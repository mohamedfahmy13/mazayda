import 'package:mazayada/l10n/app_localizations.dart';
import 'auth_inputs.dart';

/// تحويل أخطاء حقول الـ formz إلى نص مترجم حسب اللغة الحالية.
/// ترجع `null` طالما الحقل لسه pure (المستخدم لمسهوش) أو صالح،
/// عشان الخطأ ما يظهرش قبل أول تعديل.

extension NinInputErrorText on NinInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      NinError.empty => t.valRequired,
      NinError.invalid => t.valNinInvalid,
      _ => null,
    };
  }
}

extension OptionalNinInputErrorText on OptionalNinInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return t.valNinInvalid;
  }
}

extension NameInputErrorText on NameInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      NameError.empty => t.valRequired,
      NameError.tooShort => t.valNameShort,
      _ => null,
    };
  }
}

extension PhoneInputErrorText on PhoneInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      PhoneError.empty => t.valRequired,
      PhoneError.invalid => t.valPhoneInvalid,
      _ => null,
    };
  }
}

extension EmailInputErrorText on EmailInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      EmailError.empty => t.valRequired,
      EmailError.invalid => t.valEmailInvalid,
      _ => null,
    };
  }
}

extension PasswordInputErrorText on PasswordInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      PasswordError.empty => t.valRequired,
      _ => null,
    };
  }
}

extension NewPasswordInputErrorText on NewPasswordInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      NewPasswordError.empty => t.valRequired,
      NewPasswordError.tooShort => t.valPasswordShort,
      NewPasswordError.needsMixedCase => t.valPasswordMixedCase,
      NewPasswordError.needsNumber => t.valPasswordNumber,
      NewPasswordError.needsSymbol => t.valPasswordSymbol,
      _ => null,
    };
  }
}

extension BirthDateInputErrorText on BirthDateInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      BirthDateError.empty => t.valRequired,
      BirthDateError.under18 => t.valBirthDateUnder18,
      _ => null,
    };
  }
}

extension ConfirmPasswordInputErrorText on ConfirmPasswordInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return switch (error) {
      ConfirmPasswordError.empty => t.valRequired,
      ConfirmPasswordError.mismatch => t.valPasswordMismatch,
      _ => null,
    };
  }
}

extension RequiredInputErrorText on RequiredInput {
  String? errorText(AppLocalizations t) {
    if (isPure || isValid) return null;
    return t.valRequired;
  }
}
