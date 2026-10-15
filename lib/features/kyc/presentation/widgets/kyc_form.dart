import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../domain/entities/kyc_entities.dart';
import '../../domain/repositories/kyc_repository.dart';
import 'kyc_labeled_dropdown.dart';
import 'kyc_text_field.dart';

/// فورم البيانات الشخصية للـ KYC — يملك الحقول والمنسدلات ويبني مدخلات الإرسال.
class KycForm extends StatefulWidget {
  final List<Wilaya> wilayas;
  final List<Commune> communes;
  final Map<String, List<String>>? fieldErrors;
  final bool submitting;

  /// بيانات المستخدم المخزّنة عند السيرفر (BE-8) — بنعبّي بيها الحقول أول
  /// مرة. `null` = مفيش تعبئة مسبقة (النداء فشل) فالفورم يفتح فاضي.
  final Profile? prefill;

  /// كل المستندات المطلوبة اترفعت؟ (يتحكم في تفعيل زر الإرسال).
  final bool canSubmit;

  /// عند اختيار ولاية — لتحميل بلدياتها.
  final ValueChanged<int> onWilayaSelected;
  final ValueChanged<KycSubmitParams> onSubmit;

  const KycForm({
    super.key,
    required this.wilayas,
    required this.communes,
    required this.fieldErrors,
    required this.submitting,
    required this.canSubmit,
    required this.onWilayaSelected,
    required this.onSubmit,
    this.prefill,
  });

  @override
  State<KycForm> createState() => _KycFormState();
}

class _KycFormState extends State<KycForm> {
  final _firstFr = TextEditingController();
  final _lastFr = TextEditingController();
  final _father = TextEditingController();
  final _motherName = TextEditingController();
  final _motherSurname = TextEditingController();
  final _address = TextEditingController();
  final _postal = TextEditingController();
  final _profession = TextEditingController();
  final _idNumber = TextEditingController();
  final _income = TextEditingController();

  int? _wilayaId;
  int? _communeId;

  @override
  void initState() {
    super.initState();
    _applyPrefill();
  }

  @override
  void didUpdateWidget(KycForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    // البروفايل وصل متأخر (النداء غير متزامن) — نعبّي أول ما يوصل، وبس
    // لو الحقول لسه فاضية عشان ما نمسحش كتابة المستخدم.
    if (oldWidget.prefill == null && widget.prefill != null) _applyPrefill();
  }

  /// تعبئة الحقول من بيانات السيرفر (BE-8).
  ///
  /// بنعبّي الحقل **بس لو فاضي** — لو المستخدم بدأ يكتب، كتابته أولى.
  void _applyPrefill() {
    final p = widget.prefill;
    if (p == null) return;

    void seed(TextEditingController c, String? value) {
      if (c.text.isEmpty && value != null && value.isNotEmpty) c.text = value;
    }

    seed(_firstFr, p.firstNameFr);
    seed(_lastFr, p.lastNameFr);
    seed(_father, p.fatherName);
    seed(_motherName, p.motherName);
    seed(_motherSurname, p.motherSurname);
    seed(_address, p.address);
    seed(_postal, p.postalCode);
    seed(_profession, p.profession);
    seed(_idNumber, p.idCardNumber);
    seed(_income, p.expectedIncome?.toString());

    // الولاية جاهزة من الباك (مشتقّة من البلدية) فما نحتاجش بحث عكسي.
    _wilayaId ??= p.wilayaId;
    _communeId ??= p.communeId;
  }

  @override
  void dispose() {
    for (final c in [
      _firstFr,
      _lastFr,
      _father,
      _motherName,
      _motherSurname,
      _address,
      _postal,
      _profession,
      _idNumber,
      _income,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    widget.onSubmit(
      KycSubmitParams(
        firstNameFr: _firstFr.text.trim(),
        lastNameFr: _lastFr.text.trim(),
        fatherName: _father.text.trim(),
        motherName: _motherName.text.trim(),
        motherSurname: _motherSurname.text.trim(),
        address: _address.text.trim(),
        wilayaId: _wilayaId ?? 0,
        communeId: _communeId ?? 0,
        postalCode: _postal.text.trim(),
        profession: _profession.text.trim(),
        expectedIncome: int.tryParse(_income.text.trim()) ?? 0,
        idNumber: _idNumber.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final language = Localizations.localeOf(context).languageCode;
    final errors = widget.fieldErrors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.personalData,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12.h),
        KycTextField(
          label: t.firstNameFr,
          controller: _firstFr,
          errorText: errors?['first_name_fr']?.first,
        ),
        KycTextField(
          label: t.lastNameFr,
          controller: _lastFr,
          errorText: errors?['last_name_fr']?.first,
        ),
        KycTextField(
          label: t.fatherName,
          controller: _father,
          errorText: errors?['father_name']?.first,
        ),
        KycTextField(
          label: t.motherName,
          controller: _motherName,
          errorText: errors?['mother_name']?.first,
        ),
        KycTextField(
          label: t.motherSurname,
          controller: _motherSurname,
          errorText: errors?['mother_surname']?.first,
        ),
        KycTextField(
          label: t.profession,
          controller: _profession,
          errorText: errors?['profession']?.first,
        ),
        KycTextField(
          label: t.address,
          controller: _address,
          errorText: errors?['address']?.first,
        ),
        KycLabeledDropdown<int>(
          label: t.wilaya,
          value: _wilayaId,
          items: [
            for (final w in widget.wilayas)
              DropdownMenuItem(value: w.id, child: Text(w.nameFor(language))),
          ],
          onChanged: (id) {
            setState(() {
              _wilayaId = id;
              _communeId = null;
            });
            if (id != null) widget.onWilayaSelected(id);
          },
        ),
        SizedBox(height: 12.h),
        KycLabeledDropdown<int>(
          label: t.commune,
          value: _communeId,
          items: [
            for (final c in widget.communes)
              DropdownMenuItem(value: c.id, child: Text(c.nameFor(language))),
          ],
          onChanged: (id) => setState(() => _communeId = id),
        ),
        SizedBox(height: 12.h),
        KycTextField(
          label: t.postalCode,
          controller: _postal,
          keyboardType: TextInputType.number,
          errorText: errors?['postal_code']?.first,
        ),
        KycTextField(
          label: t.expectedIncome,
          controller: _income,
          keyboardType: TextInputType.number,
          errorText: errors?['expected_income']?.first,
        ),
        KycTextField(
          label: t.idNumber,
          controller: _idNumber,
          errorText: errors?['id_number']?.first,
        ),
        SizedBox(height: 12.h),
        PrimaryButton(
          label: t.finishVerification,
          icon: Icons.check_circle_outline,
          isLoading: widget.submitting,
          onPressed: widget.canSubmit ? _submit : null,
        ),
        if (!widget.canSubmit) ...[
          SizedBox(height: 8.h),
          Text(
            t.uploadDocsFirst,
            style: TextStyle(fontSize: 11.sp, color: AppColors.textHint),
          ),
        ],
      ],
    );
  }
}
