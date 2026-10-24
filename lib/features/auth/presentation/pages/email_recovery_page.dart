import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/arabic_numerals.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../domain/entities/email_recovery.dart';
import '../auth_constants.dart';
import '../cubit/email_recovery_cubit.dart';
import '../formz/auth_input_errors.dart';
import '../widgets/app_text_field.dart';

/// سقف حجم صورة السيلفي — نفس سقف مستندات الـ KYC (`kyc.doc_max_kb`).
const _selfieMaxKb = 1024;

/// أبعاد الضغط: الوش والبطاقة لازم يفضلوا مقروءين بعد التصغير.
const _selfieMaxSide = 1600.0;
const _selfieQuality = 82;

/// شاشة استرجاع البريد الإلكتروني المفقود — تعديل العميل رقم 1.
///
/// المواطن اللي فقد بريده مايقدرش يستقبل رمز ولا يسجّل دخول، فالشاشة دي
/// **خارج الجلسة**: بيثبت هويته ببياناته وصورة سيلفي مع البطاقة، والطلب
/// بيروح للجهة المختصة تراجعه وتعتمد البريد الجديد.
class EmailRecoveryPage extends StatelessWidget {
  const EmailRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EmailRecoveryCubit>(),
      child: const _EmailRecoveryView(),
    );
  }
}

class _EmailRecoveryView extends StatelessWidget {
  const _EmailRecoveryView();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocConsumer<EmailRecoveryCubit, EmailRecoveryFormState>(
      listenWhen: (a, b) =>
          b.errorMessage != null && a.errorMessage != b.errorMessage,
      listener: (context, state) {
        // أخطاء الحقول بتتعرض تحت الحقل نفسه — الـ snackbar للأخطاء العامة بس.
        if (state.serverErrors != null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage!),
            backgroundColor: AppColors.danger,
          ),
        );
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(t.lostEmailTitle),
          leading: state.step == EmailRecoveryStep.submitted
              ? null
              : const _BackButton(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child:
              (state.step == EmailRecoveryStep.form
                      ? _FormStep(state: state)
                      : _SubmittedStep(state: state))
                  .animate()
                  .fadeIn(duration: 250.ms),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(AppIcons.back),
      onPressed: () =>
          context.canPop() ? context.pop() : context.go(Routes.login),
    );
  }
}

/// الخطوة 1 — البيانات + صورة السيلفي.
class _FormStep extends StatelessWidget {
  final EmailRecoveryFormState state;
  const _FormStep({required this.state});

  /// التقاط السيلفي من الكاميرا **بس** — صورة من المعرض تكسر الغرض من
  /// الإثبات (تقدر تبقى صورة قديمة أو لشخص تاني).
  Future<void> _pickSelfie(BuildContext context) async {
    final cubit = context.read<EmailRecoveryCubit>();
    final t = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final shot = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxWidth: _selfieMaxSide,
      maxHeight: _selfieMaxSide,
      imageQuality: _selfieQuality,
    );
    if (shot == null) return;

    // نتحقق من الحجم قبل الرفع — أرحم من رحلة شبكة بترجع 422.
    final bytes = await File(shot.path).length();
    if (bytes > _selfieMaxKb * 1024) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(t.lostEmailImageTooLarge(_selfieMaxKb)),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    cubit.selfiePicked(shot.path);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cubit = context.read<EmailRecoveryCubit>();
    final srv = state.serverErrors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // المسار ده بيتعرّف بالرقم الوطني وتاريخ الميلاد، والاتنين بقوا
        // اختياريين عند التسجيل — فالحساب اللي مالوش رقم مالوش طريق هنا.
        _Hint('${t.lostEmailHint}\n${t.lostEmailNeedsIdentity}'),
        Gap(16.h),
        AppTextField(
          label: t.nin,
          hint: t.ninHint,
          icon: Icons.badge_outlined,
          keyboardType: TextInputType.number,
          maxLength: AuthConstants.ninLength,
          inputFormatters: [AppInputFormatters.anyNumeralDigitsOnly],
          onChanged: cubit.ninChanged,
          errorText: state.nin.errorText(t) ?? srv?['nin']?.first,
        ),
        _BirthDateField(
          value: state.birthDate.value,
          errorText: state.birthDate.errorText(t) ?? srv?['birth_date']?.first,
          onPicked: cubit.birthDateChanged,
        ),
        AppTextField(
          label: t.phone,
          hint: '0XXXXXXXXX',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          maxLength: AuthConstants.phoneLength,
          inputFormatters: [AppInputFormatters.anyNumeralDigitsOnly],
          onChanged: cubit.phoneChanged,
          errorText: state.phone.errorText(t) ?? srv?['phone']?.first,
        ),
        AppTextField(
          label: t.lostEmailNewEmail,
          hint: 'example@mail.com',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          onChanged: cubit.newEmailChanged,
          errorText: state.newEmail.errorText(t) ?? srv?['new_email']?.first,
        ),
        Gap(6.h),
        _SelfieTile(
          path: state.selfiePath,
          errorText: srv?['selfie_with_id']?.first,
          onTap: () => _pickSelfie(context),
        ),
        Gap(16.h),
        PrimaryButton(
          label: t.lostEmailSubmit,
          icon: Icons.send_outlined,
          isLoading: state.isSubmitting,
          onPressed: state.canSubmit ? cubit.submit : null,
        ),
      ],
    );
  }
}

/// خانة صورة السيلفي — بتعرض معاينة بعد الالتقاط.
class _SelfieTile extends StatelessWidget {
  final String? path;
  final String? errorText;
  final VoidCallback onTap;

  const _SelfieTile({
    required this.path,
    required this.errorText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final picked = (path ?? '').isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: picked ? AppColors.successBg : AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: errorText != null
                    ? AppColors.danger
                    : (picked ? AppColors.success : AppColors.primary),
                width: 0.8,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: BoxDecoration(
                        color: (picked ? AppColors.success : AppColors.primary)
                            .withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        picked
                            ? Icons.check_circle_outline
                            : Icons.person_pin_outlined,
                        size: 21.sp,
                        color: picked ? AppColors.success : AppColors.primary,
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.lostEmailSelfie,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Gap(2.h),
                          Text(
                            picked
                                ? t.lostEmailRetake
                                : t.lostEmailSelfieHint,
                            style: TextStyle(
                              fontSize: 10.5.sp,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 19.sp,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                if (picked) ...[
                  Gap(11.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.file(
                      File(path!),
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          Gap(5.h),
          Text(
            errorText!,
            style: TextStyle(fontSize: 11.sp, color: AppColors.danger),
          ),
        ],
      ],
    );
  }
}

/// الخطوة 2 — الطلب اتبعت، والحالة بتتابَع من هنا.
class _SubmittedStep extends StatelessWidget {
  final EmailRecoveryFormState state;
  const _SubmittedStep({required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cubit = context.read<EmailRecoveryCubit>();
    final request = state.request;
    final status = request?.status ?? EmailRecoveryStatus.pending;

    final (IconData icon, Color tone, String body) = switch (status) {
      EmailRecoveryStatus.approved => (
        Icons.check_circle_outline,
        AppColors.success,
        t.lostEmailApprovedBody,
      ),
      EmailRecoveryStatus.rejected => (
        Icons.cancel_outlined,
        AppColors.danger,
        t.lostEmailRejectedBody,
      ),
      _ => (
        Icons.hourglass_top_outlined,
        AppColors.warning,
        t.lostEmailSubmittedBody,
      ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Gap(18.h),
        Icon(icon, size: 56.sp, color: tone),
        Gap(12.h),
        Text(
          // نص الحالة من السيرفر أدق لما يكون موجود (فيه حالات وسيطة).
          request?.statusLabel?.isNotEmpty ?? false
              ? request!.statusLabel!
              : t.lostEmailSubmittedTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
        ),
        Gap(8.h),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),
        Gap(18.h),
        if (request != null) _RequestCard(request: request),
        Gap(18.h),
        if (status == EmailRecoveryStatus.approved)
          PrimaryButton(
            label: t.login,
            icon: Icons.login,
            onPressed: () => context.go(Routes.login),
          )
        else if (status == EmailRecoveryStatus.rejected)
          PrimaryButton(
            label: t.lostEmailResubmit,
            icon: Icons.edit_outlined,
            onPressed: cubit.backToForm,
          )
        else
          PrimaryButton(
            label: t.lostEmailRefreshStatus,
            icon: Icons.refresh,
            isLoading: state.isSubmitting,
            onPressed: cubit.refreshStatus,
          ),
        Gap(10.h),
        TextButton(
          onPressed: () => context.go(Routes.login),
          child: Text(t.login),
        ),
      ],
    );
  }
}

/// بطاقة تفاصيل الطلب — الرقم والتاريخ والبريد المطلوب وسبب الرفض.
class _RequestCard extends StatelessWidget {
  final EmailRecoveryRequest request;
  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (request.id.isNotEmpty)
            _Row(label: t.lostEmailRequestRef, value: request.id),
          if (request.newEmailMasked?.isNotEmpty ?? false)
            _Row(
              label: t.lostEmailNewEmail,
              value: request.newEmailMasked!,
            ),
          if (request.submittedAt != null)
            _Row(
              label: t.lostEmailSubmittedAt,
              value: _formatDate(request.submittedAt!),
            ),
          if (request.rejectionReason?.isNotEmpty ?? false) ...[
            Gap(8.h),
            Text(
              t.lostEmailRejectionReason,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
            ),
            Gap(3.h),
            Text(
              request.rejectionReason!,
              style: TextStyle(
                fontSize: 11.5.sp,
                height: 1.6,
                color: AppColors.danger,
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String _formatDate(DateTime d) =>
      '${d.year}/${d.month.toString().padLeft(2, '0')}/'
      '${d.day.toString().padLeft(2, '0')}';
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11.5.sp,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// حقل تاريخ الميلاد — نفس سلوك شاشة التسجيل (قراءة فقط + منتقي تاريخ).
class _BirthDateField extends StatefulWidget {
  final String value;
  final String? errorText;
  final ValueChanged<String> onPicked;

  const _BirthDateField({
    required this.value,
    required this.errorText,
    required this.onPicked,
  });

  @override
  State<_BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<_BirthDateField> {
  final _controller = TextEditingController();

  @override
  void didUpdateWidget(_BirthDateField old) {
    super.didUpdateWidget(old);
    if (widget.value != _controller.text) _controller.text = widget.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final now = DateTime.now();
    final lastAllowed = DateTime(
      now.year - AuthConstants.minAgeYears,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));

    return AppTextField(
      label: t.birthDate,
      hint: t.selectBirthDate,
      icon: Icons.cake_outlined,
      readOnly: true,
      controller: _controller,
      errorText: widget.errorText,
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(widget.value) ?? lastAllowed,
          firstDate: DateTime(1900),
          lastDate: lastAllowed,
          helpText: t.selectBirthDate,
        );
        if (picked != null) widget.onPicked(_fmt(picked));
      },
    );
  }
}

class _Hint extends StatelessWidget {
  final String text;
  const _Hint(this.text);

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(13.w),
    decoration: BoxDecoration(
      color: AppColors.infoBg,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11.5.sp,
        height: 1.7,
        color: AppColors.textPrimary,
      ),
    ),
  );
}
