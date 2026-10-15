import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import 'package:open_filex/open_filex.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/documents_usecases.dart';

/// زر تحميل وثيقة مستقل بذاته — بيدير حالة التحميل داخليًا.
///
/// مستقل عن `DocumentsCubit` عشان يشتغل في أي شاشة تانية، زي بلوك الفائز
/// في تفاصيل المزاد (وثيقة الترسية) — من غير ما نحمّل حالة المكتبة كلها.
class DocumentDownloadButton extends StatefulWidget {
  final String documentId;
  final String title;
  final String label;
  final IconData icon;

  const DocumentDownloadButton({
    super.key,
    required this.documentId,
    required this.title,
    required this.label,
    this.icon = Icons.download_outlined,
  });

  @override
  State<DocumentDownloadButton> createState() =>
      _DocumentDownloadButtonState();
}

class _DocumentDownloadButtonState extends State<DocumentDownloadButton> {
  bool _busy = false;

  Future<void> _download() async {
    if (_busy) return;
    setState(() => _busy = true);

    final t = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final res = await getIt<DownloadDocument>()(
      DownloadDocumentParams(id: widget.documentId, title: widget.title),
    );

    if (!mounted) return;
    setState(() => _busy = false);

    await res.fold(
      (f) async => messenger.showSnackBar(
        SnackBar(
          content: Text(_failureMessage(f, t)),
          backgroundColor: AppColors.danger,
        ),
      ),
      (path) async {
        final result = await OpenFilex.open(path);
        if (result.type != ResultType.done) {
          messenger.showSnackBar(SnackBar(content: Text(t.docsCannotOpen)));
        }
      },
    );
  }

  /// الرفض المتوقع بنصوصنا: ردّ الخطأ بييجي bytes زي الملف فرسالته مابتتقريش
  /// (كانت بتطلع «حدث خطأ» عامة)، ورفض الـ policy أصلًا رسالته إنجليزي ثابت.
  String _failureMessage(Failure f, AppLocalizations t) => switch (f) {
    ServerFailure(statusCode: 403) => t.docsDownloadForbidden,
    ServerFailure(statusCode: 404) => t.docsDownloadUnavailable,
    _ => f.message,
  };

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: _busy ? null : _download,
      icon: _busy
          ? SizedBox(
              width: 15.w,
              height: 15.w,
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(widget.icon, size: 17.sp),
      label: Text(widget.label, style: TextStyle(fontSize: 12.sp)),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
