import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/session/session_manager.dart';
import '../../../../core/widgets/signed_in_gate.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/auction_question.dart';
import '../cubit/qa_cubit.dart';

class QaPage extends StatelessWidget {
  final String auctionId;
  const QaPage({super.key, required this.auctionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QaCubit>()..load(auctionId),
      child: const _QaView(),
    );
  }
}

class _QaView extends StatefulWidget {
  const _QaView();
  @override
  State<_QaView> createState() => _QaViewState();
}

class _QaViewState extends State<_QaView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    // القراءة للكل، والسؤال نفسه مصادَق — الضيف يسجّل دخول الأول.
    if (!getIt<SessionManager>().isSignedIn && !await openSignIn(context)) {
      return;
    }
    if (!mounted) return;
    context.read<QaCubit>().ask(text);
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأسئلة والاستفسارات')),
      body: Column(
        children: [
          // بانر فترة الفحص
          Container(
            width: double.infinity,
            color: AppColors.infoBg,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 16.sp, color: AppColors.info),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'يمكنك طرح أسئلتك خلال فترة الفحص، وسيجيب الموظف المختص',
                    style: TextStyle(
                        fontSize: 11.sp, color: AppColors.info, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<QaCubit, QaState>(
              builder: (context, state) {
                if (state.loading) return const LoadingView();
                if (state.error != null && state.items.isEmpty) {
                  return ErrorView(message: state.error!);
                }
                if (state.items.isEmpty) {
                  return const EmptyView(
                    message: 'لا توجد أسئلة بعد — كن أول من يسأل',
                    icon: Icons.help_outline,
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.items.length,
                  itemBuilder: (_, i) => _QaCard(state.items[i]),
                );
              },
            ),
          ),
          // حقل طرح السؤال
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border:
                  Border(top: BorderSide(color: AppColors.border, width: 0.5)),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'اكتب سؤالك هنا...',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  BlocBuilder<QaCubit, QaState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: state.asking ? null : _send,
                        child: Container(
                          width: 46.w,
                          height: 46.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: state.asking
                              ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white),
                                )
                              : Icon(Icons.send,
                                  size: 20.sp, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QaCard extends StatelessWidget {
  final AuctionQuestion q;
  const _QaCard(this.q);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // السؤال
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.help_outline,
                  size: 17.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(q.question,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary)),
              ),
            ],
          ),
          SizedBox(height: 9.h),
          // الإجابة أو حالة الانتظار
          if (q.isAnswered)
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.successBg,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.verified_user_outlined,
                      size: 15.sp, color: AppColors.success),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Text(q.answer!,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textPrimary,
                            height: 1.6)),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                Icon(Icons.schedule,
                    size: 14.sp, color: AppColors.warning),
                SizedBox(width: 6.w),
                Text('بانتظار رد الموظف المختص',
                    style: TextStyle(
                        fontSize: 11.sp, color: AppColors.warning)),
              ],
            ),
        ],
      ),
    );
  }
}
