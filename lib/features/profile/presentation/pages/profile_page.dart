import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/list_entrance_animation.dart';
import '../../../../core/widgets/signed_in_gate.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/profile.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_language_switcher.dart';
import '../widgets/profile_loading_view.dart';
import '../widgets/profile_delete_account_button.dart';
import '../widgets/profile_logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return SignedInGate(
      title: t.navProfile,
      icon: Icons.person_outline_rounded,
      message: t.guestProfileBody,
      builder: (_) => BlocProvider(
        create: (_) => getIt<ProfileCubit>()..load(),
        child: const _ProfileView(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => switch (state) {
          ProfileLoading() => const ProfileLoadingView(),
          ProfileError(:final message) => _ProfileErrorView(message: message),
          ProfileLoaded(:final profile) => _ProfileContent(profile: profile),
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final Profile profile;

  const _ProfileContent({required this.profile});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cubit = context.read<ProfileCubit>();

    final sections = <Widget>[
      _SectionTitle(text: t.personalData),
      ProfileInfoCard(
        rows: [
          // ممكن يكون لسه ماتضافش (اختياري عند التسجيل، بيتطلب في الـ KYC).
          ProfileInfoRow(
            icon: Icons.badge_outlined,
            label: t.nin,
            value: profile.needsNin ? t.profileNotProvided : profile.ninMasked!,
          ),
          ProfileInfoRow(
            icon: Icons.phone_outlined,
            label: t.phone,
            value: profile.phone ?? '—',
          ),
          ProfileInfoRow(
            icon: Icons.mail_outline_rounded,
            label: t.email,
            value: profile.email ?? '—',
          ),
          if (profile.address?.isNotEmpty ?? false)
            ProfileInfoRow(
              icon: Icons.location_on_outlined,
              label: t.address,
              value: profile.address!,
            ),
        ],
      ),
      _ProfileActionsCard(
        children: [
          // العضوية المميّزة أول صف: هي المدخل الوحيد للاشتراك وإدارته
          // (تعديلات العميل 24 · 25)، وبتحمل شارة الحالة الحالية.
          _ProfileNavRow(
            icon: Icons.workspace_premium_outlined,
            label: t.premiumTitle,
            trailing: profile.isPremium
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Text(
                      t.premiumActive,
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : null,
            onTap: () => context.push(Routes.premium),
          ),
          _ProfileNavRow(
            icon: Icons.notifications_active_outlined,
            label: t.prefsTitle,
            onTap: () => context.push(Routes.notificationPreferences),
          ),
          _ProfileNavRow(
            icon: Icons.folder_copy_outlined,
            label: t.docsTitle,
            onTap: () => context.push(Routes.documents),
          ),
          _ProfileNavRow(
            icon: Icons.storefront_outlined,
            label: t.crTitle,
            trailing: profile.hasCommerceRegister
                ? Icon(
                    Icons.verified_rounded,
                    size: 17.sp,
                    color: AppColors.success,
                  )
                : null,
            onTap: () => context.push(Routes.commercialRegister),
          ),
        ],
      ),
      const ProfileLanguageSwitcher(),
      ProfileLogoutButton(onPressed: () => _logout(context)),
      // حذف الحساب لازم يبقى سهل الوصول من جوّه التطبيق (App Store
      // 5.1.1(v)) — مش مستخبّي ورا الدعم أو الإيميل.
      ProfileDeleteAccountButton(
        onPressed: () => context.push(Routes.deleteAccount),
      ),
    ];

    return Column(
      children: [
        ProfileHeader(
          profile: profile,
          onNotificationsTap: () => context.go(Routes.notifications),
        ),
        Expanded(
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: cubit.load,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16.w, 17.h, 16.w, 22.h),
              itemCount: sections.length,
              separatorBuilder: (_, __) => Gap(14.h),
              itemBuilder: (context, index) {
                final section = sections[index];
                if (MediaQuery.disableAnimationsOf(context)) return section;
                return section.staggeredEntrance(
                  index,
                  duration: const Duration(milliseconds: 360),
                  slideBegin: 0.045,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// الخروج بيرجّع التطبيق ضيف على المزايدات. الـ router بيتمسك قبل الـ await
/// لأن التبويب ده نفسه بيتقلب لطلب الدخول أول ما الجلسة تخلص.
Future<void> _logout(BuildContext context) async {
  final router = GoRouter.of(context);
  await context.read<ProfileCubit>().logout();
  router.go(Routes.home);
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Gap(8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _ProfileActionsCard extends StatelessWidget {
  final List<Widget> children;

  const _ProfileActionsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.82)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF102A21).withValues(alpha: 0.045),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1)
              Divider(
                height: 1,
                indent: 48.w,
                color: AppColors.border.withValues(alpha: 0.72),
              ),
          ],
        ],
      ),
    );
  }
}

class _ProfileNavRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ProfileNavRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 11.h),
          child: Row(
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.075),
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Icon(icon, size: 18.sp, color: AppColors.primary),
              ),
              Gap(10.w),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (trailing != null) ...[trailing!, Gap(7.w)],
              Icon(
                AppIcons.chevronForwardIos,
                size: 13.sp,
                color: AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileErrorView extends StatelessWidget {
  final String message;

  const _ProfileErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            18.w,
            MediaQuery.paddingOf(context).top + 18.h,
            18.w,
            18.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
          ),
          child: Text(
            t.profile,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: ErrorView(
            message: message,
            onRetry: context.read<ProfileCubit>().load,
          ),
        ),
      ],
    );
  }
}
