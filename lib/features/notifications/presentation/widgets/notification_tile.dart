import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart' show Bidi;
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../domain/entities/app_notification.dart';
import 'notification_labels.dart';

/// اتجاه نص الإشعار من محتواه مش من لغة الواجهة: نص السيرفر ممكن ييجي بلغة
/// غير لغة التطبيق (إشعارات قديمة اتولّدت بالعربي)، ولو اتعرض عربي بـ LTR
/// النقطة وعلامات «» بتنقلب لأول السطر.
TextDirection _directionOf(String text) =>
    Bidi.detectRtlDirectionality(text) ? TextDirection.rtl : TextDirection.ltr;

/// بطاقة إشعار تبرز غير المقروء وتوضح النوع والوقت والوجهة بصريًا.
class NotificationTile extends StatefulWidget {
  final AppNotification notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final notification = widget.notification;
    final t = AppLocalizations.of(context);
    final unread = !notification.isRead;
    final style = notification.kind.style;

    return AnimatedScale(
      scale: _pressed ? 0.985 : 1,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: unread
              ? AppColors.white
              : AppColors.white.withValues(alpha: 0.70),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: unread
                ? style.fg.withValues(alpha: 0.20)
                : AppColors.border.withValues(alpha: 0.78),
          ),
          boxShadow: unread
              ? [
                  BoxShadow(
                    color: const Color(0xFF102A21).withValues(alpha: 0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 7),
                  ),
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHighlightChanged: (value) {
              if (_pressed != value) setState(() => _pressed = value);
            },
            child: Stack(
              children: [
                AnimatedPositionedDirectional(
                  duration: const Duration(milliseconds: 220),
                  start: 0,
                  top: unread ? 15.h : 28.h,
                  bottom: unread ? 15.h : 28.h,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: unread ? 3.5.w : 0,
                    decoration: BoxDecoration(
                      color: style.fg,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(13.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _NotificationIcon(
                        kind: notification.kind,
                        unread: unread,
                      ),
                      Gap(11.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    notification.title,
                                    textDirection: _directionOf(
                                      notification.title,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      height: 1.4,
                                      fontWeight: unread
                                          ? FontWeight.w700
                                          : FontWeight.w600,
                                      color: unread
                                          ? AppColors.textPrimary
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                                Gap(7.w),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: unread
                                      ? _UnreadDot(
                                          key: ValueKey(notification.id),
                                          color: style.fg,
                                        )
                                      : const SizedBox.shrink(
                                          key: ValueKey('read'),
                                        ),
                                ),
                              ],
                            ),
                            Gap(5.h),
                            Text(
                              notification.body,
                              textDirection: _directionOf(notification.body),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.textSecondary,
                                height: 1.55,
                              ),
                            ),
                            Gap(9.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(9.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.schedule_rounded,
                                        size: 12.sp,
                                        color: AppColors.textHint,
                                      ),
                                      Gap(4.w),
                                      Text(
                                        notificationTimeAgo(
                                          notification.createdAt,
                                          t,
                                        ),
                                        style: TextStyle(
                                          fontSize: 9.5.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                if (notification.hasDestination)
                                  Container(
                                    width: 28.w,
                                    height: 28.w,
                                    decoration: BoxDecoration(
                                      color: style.bg,
                                      borderRadius: BorderRadius.circular(9.r),
                                    ),
                                    child: Icon(
                                      AppIcons.openDetails,
                                      size: 15.sp,
                                      color: style.fg,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final NotificationKind kind;
  final bool unread;

  const _NotificationIcon({required this.kind, required this.unread});

  @override
  Widget build(BuildContext context) {
    final style = kind.style;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: 46.w,
      height: 46.w,
      decoration: BoxDecoration(
        color: style.bg,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: style.fg.withValues(alpha: unread ? 0.12 : 0),
        ),
      ),
      child: Icon(style.icon, size: 21.sp, color: style.fg),
    );
  }
}

class _UnreadDot extends StatelessWidget {
  final Color color;

  const _UnreadDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      margin: EdgeInsets.only(top: 4.h),
      width: 8.w,
      height: 8.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 6),
        ],
      ),
    );

    if (MediaQuery.disableAnimationsOf(context)) return dot;
    return dot
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .fade(begin: 0.55, end: 1, duration: 900.ms)
        .scaleXY(begin: 0.82, end: 1.10, duration: 900.ms);
  }
}
