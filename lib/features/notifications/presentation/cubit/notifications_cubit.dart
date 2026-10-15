import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/notifications/push_notification_service.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/locale_cubit.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/usecases/notifications_usecases.dart';

part 'notifications_cubit.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(true) bool loading,
    @Default(<AppNotification>[]) List<AppNotification> items,
    @Default(0) int unreadCount,
    String? error,
  }) = _NotificationsState;
}

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotifications _getNotifications;
  final MarkNotificationRead _markRead;
  final MarkAllNotificationsRead _markAll;

  /// إشعار Push وصل والصفحة مفتوحة → نحدّث القائمة من غير مؤشّر تحميل.
  StreamSubscription<void>? _pushSub;

  /// اللغة اتغيّرت → نجيب القائمة تاني باللغة الجديدة (التاب بيفضل عايش
  /// في الخلفية، فمن غيره هيعرض النسخة القديمة).
  StreamSubscription<Locale>? _localeSub;

  NotificationsCubit(
    this._getNotifications,
    this._markRead,
    this._markAll,
    PushNotificationService push,
    LocaleCubit localeCubit,
  ) : super(const NotificationsState()) {
    _pushSub = push.onForegroundMessage.listen((_) => load(silent: true));
    _localeSub = localeCubit.stream.listen((_) => load(silent: true));
  }

  /// [silent]: تحديث في الخلفية — القائمة الحالية تفضل ظاهرة لحد ما
  /// الجديدة توصل.
  Future<void> load({bool silent = false}) async {
    if (!silent) emit(state.copyWith(loading: true, error: null));
    final result = await _getNotifications(const NoParams());
    if (isClosed) return;
    result.fold(
      // فشل التحديث الصامت مايستاهلش يمسح قائمة شغّالة.
      (f) => silent
          ? null
          : emit(state.copyWith(loading: false, error: f.message)),
      (res) => emit(
        state.copyWith(
          loading: false,
          items: res.items,
          unreadCount: res.unreadCount,
        ),
      ),
    );
  }

  /// تعليم إشعار كمقروء — تحديث تفاؤلي (UI أولًا ثم الـ API).
  Future<void> markAsRead(String id) async {
    final target = state.items.firstWhere((n) => n.id == id);
    if (target.isRead) return;

    // حدّث الـ UI فورًا
    emit(
      state.copyWith(
        items: state.items
            .map((n) => n.id == id ? n.copyWith(isRead: true) : n)
            .toList(),
        unreadCount: (state.unreadCount - 1).clamp(0, 9999),
      ),
    );
    // ثم الـ API (لو فشل، نعيد التحميل)
    final res = await _markRead(id);
    res.fold((_) => load(), (_) {});
  }

  Future<void> markAllAsRead() async {
    emit(
      state.copyWith(
        items: state.items.map((n) => n.copyWith(isRead: true)).toList(),
        unreadCount: 0,
      ),
    );
    final res = await _markAll(const NoParams());
    res.fold((_) => load(), (_) {});
  }

  @override
  Future<void> close() {
    _pushSub?.cancel();
    _localeSub?.cancel();
    return super.close();
  }
}
