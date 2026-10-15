import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../kyc/domain/entities/kyc_entities.dart';
import 'auction_filter_options.dart';

class AuctionFilterSheet extends StatefulWidget {
  final List<Wilaya> wilayas;
  final String? initialType;
  final Wilaya? initialWilaya;
  final void Function(String? type, Wilaya? wilaya) onApply;

  const AuctionFilterSheet({
    super.key,
    required this.wilayas,
    required this.initialType,
    required this.initialWilaya,
    required this.onApply,
  });

  @override
  State<AuctionFilterSheet> createState() => AuctionFilterSheetState();
}

class AuctionFilterSheetState extends State<AuctionFilterSheet> {
  final _wilayaSearch = TextEditingController();
  late String? _type = widget.initialType;
  late Wilaya? _wilaya = widget.initialWilaya;
  late List<Wilaya> _filtered = widget.wilayas;

  @override
  void initState() {
    super.initState();
    _wilayaSearch.addListener(_filterWilayas);
  }

  void _filterWilayas() {
    final q = _wilayaSearch.text.trim();
    setState(() {
      _filtered = q.isEmpty
          ? widget.wilayas
          : widget.wilayas.where((w) => w.names.contains(q)).toList();
    });
  }

  @override
  void dispose() {
    _wilayaSearch.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _type = null;
      _wilaya = null;
      _wilayaSearch.clear();
      _filtered = widget.wilayas;
    });
  }

  void _apply() {
    widget.onApply(_type, _wilaya);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        final t = AppLocalizations.of(context);
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
          ),
          child: Column(
            children: [
              // مقبض + عنوان
              Gap(10.h),
              Container(
                width: 38.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.borderStrong,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Gap(14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      t.filterAuctions,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close_rounded,
                        size: 22.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              const Divider(height: 1, color: AppColors.border),
              // المحتوى القابل للتمرير
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 8.h),
                  children: [
                    _SectionTitle(t.type),
                    Gap(10.h),
                    _Segmented(
                      options: auctionTypeKeys
                          .map((k) => (k, auctionTypeFilterLabel(k, t)))
                          .toList(),
                      selected: _type,
                      onSelect: (v) => setState(() => _type = v),
                    ),
                    Gap(22.h),
                    Row(
                      children: [
                        _SectionTitle(t.wilaya),
                        const Spacer(),
                        if (_wilaya != null)
                          GestureDetector(
                            onTap: () => setState(() => _wilaya = null),
                            child: Text(
                              t.clearSelection,
                              style: TextStyle(
                                fontSize: 11.5.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Gap(10.h),
                    _WilayaSearchField(controller: _wilayaSearch),
                    Gap(10.h),
                    _wilayaList(),
                  ],
                ),
              ),
              // الأزرار السفلية
              _FilterSheetFooter(onReset: _reset, onApply: _apply),
            ],
          ),
        );
      },
    );
  }

  Widget _wilayaList() {
    if (widget.wilayas.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            AppLocalizations.of(context).wilayasLoadError,
            style: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
          ),
        ),
      );
    }
    if (_filtered.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            AppLocalizations.of(context).noWilayaMatch,
            style: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
          ),
        ),
      );
    }
    final language = Localizations.localeOf(context).languageCode;
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: _filtered.map((w) {
        return _WilayaChip(
          name: w.nameFor(language),
          selected: w.id == _wilaya?.id,
          onTap: () => setState(() => _wilaya = w),
        );
      }).toList(),
    );
  }
}

/// عنوان قسم داخل الـ sheet.
class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(fontSize: 13.5.sp, fontWeight: FontWeight.w700),
  );
}

/// حقل البحث عن ولاية.
class _WilayaSearchField extends StatelessWidget {
  final TextEditingController controller;
  const _WilayaSearchField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 13.sp),
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).searchWilayaHint,
          hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 19.sp,
            color: AppColors.textHint,
          ),
          filled: true,
          fillColor: AppColors.background,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.r),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
          ),
        ),
      ),
    );
  }
}

/// شريحة ولاية قابلة للاختيار.
class _WilayaChip extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback onTap;

  const _WilayaChip({
    required this.name,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.10)
              : AppColors.background,
          borderRadius: BorderRadius.circular(11.r),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
            width: selected ? 1.2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected) ...[
              Icon(Icons.check_rounded, size: 15.sp, color: AppColors.primary),
              Gap(4.w),
            ],
            Text(
              name,
              style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// أزرار الـ sheet السفلية (إعادة تعيين / عرض النتائج).
class _FilterSheetFooter extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const _FilterSheetFooter({required this.onReset, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 48.h,
                child: OutlinedButton(
                  onPressed: onReset,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.borderStrong),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Text(
                    t.reset,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 48.h,
                child: ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Text(
                    t.showResults,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Segmented extends StatelessWidget {
  final List<(String?, String)> options;
  final String? selected;
  final ValueChanged<String?> onSelect;

  const _Segmented({
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Row(
        children: options.map((o) {
          final sel = o.$1 == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(o.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: sel ? AppColors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: sel
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  o.$2,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: sel ? FontWeight.w700 : FontWeight.w400,
                    color: sel ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
