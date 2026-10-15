// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Mazayada';

  @override
  String get navHome => 'Accueil';

  @override
  String get navMyAuctions => 'Mes enchères';

  @override
  String get navPayments => 'Paiements';

  @override
  String get navProfile => 'Profil';

  @override
  String get splashTagline => 'Plateforme Nationale des Enchères Publiques';

  @override
  String get login => 'Connexion';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get register => 'Créer un compte';

  @override
  String get noAccountRegister => 'Pas de compte ? Créer un compte';

  @override
  String get ninOrEmail => 'NIN ou e-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get showPassword => 'Afficher le mot de passe';

  @override
  String get hidePassword => 'Masquer le mot de passe';

  @override
  String get birthDate => 'Date de naissance';

  @override
  String get selectBirthDate => 'Choisir la date de naissance';

  @override
  String get nin => 'Numéro d\'identification national (NIN)';

  @override
  String get ninHint => '18 chiffres';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom';

  @override
  String get phone => 'Numéro de téléphone';

  @override
  String get email => 'E-mail';

  @override
  String get nextVerify => 'Suivant — Vérification';

  @override
  String get verifyEmailTitle => 'Vérification de l\'e-mail';

  @override
  String get otpHint => 'Saisissez le code à 6 chiffres envoyé à votre e-mail';

  @override
  String get confirm => 'Confirmer';

  @override
  String get resendCode => 'Renvoyer le code';

  @override
  String resendIn(int seconds) {
    return 'Renvoyer dans $seconds s';
  }

  @override
  String resendInTimer(String time) {
    return 'Renvoyer dans $time';
  }

  @override
  String get activeAuctions => 'Enchères actives';

  @override
  String get noAuctions => 'Aucune enchère pour le moment';

  @override
  String get currentPrice => 'Prix actuel';

  @override
  String get openingPrice => 'Prix de départ';

  @override
  String get highestBid => 'Meilleure offre';

  @override
  String get depositRequired => 'Caution requise';

  @override
  String bidders(int count) {
    return '$count enchérisseurs';
  }

  @override
  String get live => 'En direct';

  @override
  String get comingSoon => 'Bientôt';

  @override
  String get active => 'Actif';

  @override
  String get ended => 'Terminé';

  @override
  String get cancelled => 'Annulé';

  @override
  String get description => 'Description';

  @override
  String get auctionsTitle => 'Enchères';

  @override
  String get searchAuctionHint => 'Rechercher une enchère...';

  @override
  String get filter => 'Filtrer';

  @override
  String get filterAll => 'Tout';

  @override
  String get filterStatusActive => 'Actif';

  @override
  String get filterStatusUpcoming => 'À venir';

  @override
  String get filterStatusExtended => 'Prolongé';

  @override
  String get filterStatusClosed => 'Clôturé';

  @override
  String auctionsCount(String count) {
    return '$count enchères';
  }

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get noMoreResults => '— Plus de résultats —';

  @override
  String get noMatchingAuctions => 'Aucune enchère correspondante';

  @override
  String get tryAdjustingFilters =>
      'Essayez d\'ajuster la recherche ou les filtres';

  @override
  String get resetFilters => 'Réinitialiser les filtres';

  @override
  String get filterAuctions => 'Filtrer les enchères';

  @override
  String get type => 'Type';

  @override
  String get wilaya => 'Wilaya';

  @override
  String get clearSelection => 'Effacer la sélection';

  @override
  String get searchWilayaHint => 'Rechercher une wilaya...';

  @override
  String get wilayasLoadError => 'Impossible de charger les wilayas';

  @override
  String get noWilayaMatch => 'Aucune wilaya de ce nom';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get showResults => 'Afficher les résultats';

  @override
  String get registerAndPay => 'S\'inscrire et payer';

  @override
  String get bid => 'Enchérir';

  @override
  String get liveBidding => 'Enchère en direct';

  @override
  String get bidHistory => 'Historique des offres';

  @override
  String get noBidsYet => 'Aucune offre pour l\'instant';

  @override
  String get youAreHighest => 'Vous avez la meilleure offre';

  @override
  String placeBidAmount(String amount) {
    return 'Enchérir à $amount';
  }

  @override
  String get currentHighestBid => 'Meilleure offre actuelle';

  @override
  String get currencyDzd => 'DA';

  @override
  String bidsCount(int count) {
    return '$count offres';
  }

  @override
  String get kycTitle => 'Vérification d\'identité (KYC)';

  @override
  String get kycWarning =>
      'Complétez le formulaire sous 30 jours, sinon le compte sera suspendu';

  @override
  String get requiredDocuments => 'Documents requis';

  @override
  String get personalData => 'Données personnelles';

  @override
  String get finishVerification => 'Terminer la vérification';

  @override
  String get uploadDocsFirst =>
      'Téléversez d\'abord les trois documents requis';

  @override
  String get kycSubmitted => 'Votre demande a été envoyée pour examen';

  @override
  String get kycDocIdFront => 'Carte d\'identité (recto)';

  @override
  String get kycDocIdBack => 'Carte d\'identité (verso)';

  @override
  String get kycDocSelfie => 'Selfie avec la carte';

  @override
  String get kycDocBiometric => 'Photo biométrique';

  @override
  String get kycStatusPending => 'En attente';

  @override
  String get kycStatusUnderReview => 'En cours d\'examen';

  @override
  String get kycStatusVerified => 'Vérifié';

  @override
  String get kycStatusRejected => 'Rejeté';

  @override
  String kycStatusLabel(String status) {
    return 'Statut : $status';
  }

  @override
  String get firstNameFr => 'Prénom (en français)';

  @override
  String get lastNameFr => 'Nom (en français)';

  @override
  String get fatherName => 'Nom du père';

  @override
  String get motherName => 'Nom de la mère';

  @override
  String get motherSurname => 'Nom de jeune fille de la mère';

  @override
  String get expectedIncome => 'Revenu mensuel estimé';

  @override
  String get idNumber => 'Numéro de la carte d\'identité';

  @override
  String get commune => 'Commune';

  @override
  String get myAuctionsAll => 'Toutes';

  @override
  String get myAuctionsActive => 'Actives';

  @override
  String get myAuctionsWon => 'Gagnées';

  @override
  String get myAuctionsLost => 'Perdues';

  @override
  String get myAuctionsUpcoming => 'À venir';

  @override
  String get myAuctionsStatusAwaitingPayment => 'En attente de paiement';

  @override
  String get myAuctionsStatusCompleted => 'Terminé';

  @override
  String get myAuctionsStatusRefund => 'Caution remboursée';

  @override
  String get myAuctionsStatusUpcoming => 'Pas encore commencé';

  @override
  String get myAuctionsStatusLive => 'En cours';

  @override
  String get myAuctionsStatusEnded => 'Terminé — résultat en attente';

  @override
  String get myAuctionsStatusParticipating => 'Inscrit';

  @override
  String get myAuctionsStatusWinning => 'Vous menez';

  @override
  String get myAuctionsStatusOutbid => 'Vous êtes dépassé';

  @override
  String get myAuctionsStatusWon => 'Enchère remportée';

  @override
  String get myAuctionsStatusLost => 'Non retenu';

  @override
  String get myAuctionsPriceCurrentBid => 'Votre offre actuelle';

  @override
  String get myAuctionsPriceKnockdown => 'Prix d\'adjudication';

  @override
  String get myAuctionsPriceFinal => 'Prix final';

  @override
  String get myAuctionsEmptyAll =>
      'Vous n\'avez encore participé à aucune enchère';

  @override
  String get myAuctionsEmptyActive => 'Aucune enchère active';

  @override
  String get myAuctionsEmptyWon => 'Vous n\'avez encore gagné aucune enchère';

  @override
  String get myAuctionsEmptyLost => 'Aucune enchère perdue';

  @override
  String get myAuctionsEmptyUpcoming => 'Aucune enchère à venir';

  @override
  String get myAuctionsMyBid => 'Votre offre la plus élevée';

  @override
  String get myAuctionsDepositPaid => 'Caution payée';

  @override
  String get myAuctionsFinalPaymentDue => 'Paiement final requis';

  @override
  String get myAuctionsFinalPaymentPending => 'Paiement final en cours';

  @override
  String get myAuctionsFinalPaymentDone => 'Paiement final effectué';

  @override
  String get myAuctionsFinalPaymentFailed => 'Échec du paiement final';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllRead => 'Tout marquer';

  @override
  String get noNotifications => 'Aucune notification';

  @override
  String get timeNow => 'Maintenant';

  @override
  String timeMinutesAgo(int minutes) {
    return 'il y a $minutes min';
  }

  @override
  String timeHoursAgo(int hours) {
    return 'il y a $hours h';
  }

  @override
  String timeDaysAgo(int days) {
    return 'il y a $days j';
  }

  @override
  String get profile => 'Profil';

  @override
  String get verifiedKyc => 'Vérifié — KYC complété';

  @override
  String get kycBadgeRejected => 'Rejeté — vérifiez à nouveau';

  @override
  String get kycBadgeComplete => 'Complétez la vérification d\'identité';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get language => 'Langue';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get logout => 'Déconnexion';

  @override
  String get save => 'Enregistrer';

  @override
  String get edit => 'Modifier';

  @override
  String get profession => 'Profession';

  @override
  String get address => 'Adresse';

  @override
  String get postalCode => 'Code postal';

  @override
  String get languageArabic => 'Arabe';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get chooseLanguage => 'Choisir la langue';

  @override
  String get retry => 'Réessayer';

  @override
  String get goBack => 'Retour';

  @override
  String get errorGeneric => 'Une erreur s\'est produite, réessayez';

  @override
  String get errorNetwork => 'Vérifiez votre connexion Internet';

  @override
  String get paymentSuccess => 'Paiement réussi';

  @override
  String get paymentCancelled => 'Paiement annulé';

  @override
  String get paymentAlreadyDone =>
      'Vous êtes déjà inscrit à cette enchère — vous pouvez enchérir';

  @override
  String get paymentNotConfirmed =>
      'La confirmation du paiement n\'est pas encore arrivée. Si vous avez payé, patientez puis réessayez.';

  @override
  String get paymentBookNotConfirmed =>
      'La confirmation de l\'achat du cahier des charges n\'est pas encore arrivée. Si vous avez payé, patientez puis réessayez.';

  @override
  String get securePayment => 'Paiement sécurisé';

  @override
  String get paymentPageFailed => 'Impossible de charger la page de paiement';

  @override
  String get valRequired => 'Ce champ est requis';

  @override
  String get valEmailInvalid => 'E-mail invalide';

  @override
  String get valPasswordShort => 'Mot de passe : 12 caractères minimum';

  @override
  String get valPasswordMixedCase =>
      'Doit contenir une majuscule et une minuscule';

  @override
  String get valPasswordNumber => 'Doit contenir au moins un chiffre';

  @override
  String get valPasswordSymbol => 'Doit contenir au moins un symbole';

  @override
  String get valBirthDateUnder18 => 'Vous devez avoir au moins 18 ans';

  @override
  String get valPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get valNinInvalid => 'Le NIN doit comporter 18 chiffres';

  @override
  String get valPhoneInvalid =>
      'Numéro invalide (10 chiffres commençant par 0)';

  @override
  String get valNameShort => 'Nom trop court';

  @override
  String get offlineBanner => 'Pas de connexion Internet';

  @override
  String get backOnline => 'Connexion rétablie';

  @override
  String get appealsTitle => 'Réclamations';

  @override
  String get appealsEmpty => 'Aucune réclamation';

  @override
  String get appealSubmitted => 'Votre réclamation a été envoyée';

  @override
  String get newAppeal => 'Déposer une réclamation';

  @override
  String get newAppealTitle => 'Nouvelle réclamation';

  @override
  String get appealSubject => 'Sujet';

  @override
  String get appealSubjectHint =>
      'Ex : réclamation sur le résultat de l\'enchère';

  @override
  String get appealReason => 'Motif détaillé';

  @override
  String get appealReasonHint =>
      'Expliquez en détail le motif de la réclamation...';

  @override
  String get submitAppeal => 'Envoyer la réclamation';

  @override
  String get appealStatusPending => 'En cours d\'examen';

  @override
  String get appealStatusApproved => 'Accepté';

  @override
  String get appealStatusRejected => 'Rejeté';

  @override
  String get appealFileFromAuction =>
      'Le recours se dépose depuis la page de l\'enchère après sa clôture — ouvrez l\'enchère à laquelle vous avez participé puis choisissez « Déposer un recours ».';

  @override
  String get ctaLogin => 'Connectez-vous pour participer';

  @override
  String get ctaParticipate => 'Participer à l\'enchère';

  @override
  String get ctaNeedsKyc => 'Complétez la vérification de votre compte';

  @override
  String get ctaNeedsCommerceRegister => 'Registre de commerce requis';

  @override
  String get ctaCommerceRegisterHint =>
      'Cette enchère exige un registre de commerce valide avant tout paiement. Ajoutez-le sur la plateforme puis revenez.';

  @override
  String get ctaBuyBook => 'Acheter le cahier des charges';

  @override
  String get ctaFinalPayment => 'Effectuer le paiement final';

  @override
  String get ctaFinalPaymentDone => 'Paiement final effectué';

  @override
  String get ctaAppeal => 'Déposer un recours';

  @override
  String get ctaTrackAppeal => 'Suivre le recours';

  @override
  String get crTitle => 'Registre de commerce';

  @override
  String get crIntro =>
      'Certaines enchères exigent un registre de commerce valide. Soumettez vos informations ainsi qu\'une copie du registre et de la carte fiscale.';

  @override
  String get crStatusNone => 'Aucun registre soumis';

  @override
  String get crStatusPending => 'En cours de révision';

  @override
  String get crStatusApproved => 'Approuvé';

  @override
  String get crStatusRejected => 'Rejeté';

  @override
  String get crApprovedNote =>
      'Votre registre est approuvé — vous pouvez participer aux enchères qui l’exigent.';

  @override
  String get crPendingNote =>
      'Votre demande est en cours de révision. Vous pouvez la modifier et la renvoyer avant la décision.';

  @override
  String get crRejectedNote =>
      'Demande rejetée. Corrigez les informations et renvoyez-la.';

  @override
  String get crCompanyName => 'Nom de la société';

  @override
  String get crCompanyNameHint => 'ex. Sarl Mazayada Commerce';

  @override
  String get crRegisterNumber => 'Numéro du registre de commerce';

  @override
  String get crRegisterNumberHint => 'ex. 16/00-1234567 B 19';

  @override
  String get crRegisterNumberIncomplete =>
      'Le numéro de registre semble incomplet';

  @override
  String get crTaxNumber => 'Numéro fiscal';

  @override
  String get crTaxNumberHint => '15 chiffres — ex. 000116001234567';

  @override
  String get crTaxNumberDigitsOnly =>
      'Le numéro fiscal ne doit contenir que des chiffres';

  @override
  String crTaxNumberLength(int count) {
    return 'Le numéro fiscal comporte $count chiffres';
  }

  @override
  String get crActivityType => 'Type d\'activité';

  @override
  String get crActivityTypeHint => 'ex. Commerce de véhicules';

  @override
  String get crStartDate => 'Date de délivrance du registre';

  @override
  String get crStartDateHint => 'Choisissez la date de délivrance';

  @override
  String get crStartDateNotFuture =>
      'La date de délivrance ne peut pas être dans le futur';

  @override
  String get crSectionCompany => 'Informations de la société';

  @override
  String get crSectionDocuments => 'Documents requis';

  @override
  String crProgress(int done, int total) {
    return '$done sur $total complétés';
  }

  @override
  String get crFixErrors => 'Vérifiez les champs signalés en rouge';

  @override
  String get crDocumentsNote =>
      'Formats acceptés : PDF ou image (JPG/PNG) — 2 Mo max.';

  @override
  String get crFileTooLarge => 'La taille du fichier dépasse 2 Mo';

  @override
  String get crRegisterDocument => 'Copie du registre de commerce';

  @override
  String get crTaxCardDocument => 'Copie de la carte fiscale';

  @override
  String get crDocumentSelected => 'Nouveau fichier sélectionné';

  @override
  String get crDocumentOnFile => 'Copie enregistrée sur la plateforme';

  @override
  String get crDocumentMissing => 'Requis';

  @override
  String get crCapture => 'Photographier';

  @override
  String get crFromGallery => 'Depuis la galerie';

  @override
  String get crFromFiles => 'Fichier PDF';

  @override
  String get crSubmit => 'Soumettre pour révision';

  @override
  String get crResubmit => 'Renvoyer';

  @override
  String get crSubmitted => 'Registre soumis pour révision';

  @override
  String get valTooLong => 'Le texte dépasse la longueur autorisée';

  @override
  String get valTooShort => 'Le texte est plus court que requis';

  @override
  String get fpTitle => 'Détail du paiement final';

  @override
  String get fpConfirmedDeposit => 'Caution versée (déduite)';

  @override
  String get fpAmountDue => 'Montant dû';

  @override
  String get fpCustomsImmediate => 'Paiement immédiat (20 % douane)';

  @override
  String fpDeadline(String date, int days) {
    return 'Échéance : $date (sous $days jours)';
  }

  @override
  String get fpAlreadyPaid => 'Le paiement final a déjà été effectué';

  @override
  String get fpPay => 'Procéder au paiement';

  @override
  String get assetClassMovable => 'Bien meuble';

  @override
  String get assetClassRealEstate => 'Bien immobilier';

  @override
  String get assetClassCustoms => 'Marchandises douanières';

  @override
  String get conditionNew => 'Neuf';

  @override
  String get conditionGood => 'Bon';

  @override
  String get conditionFair => 'Acceptable';

  @override
  String get conditionPoor => 'Mauvais';

  @override
  String get conditionScrap => 'Ferraille';

  @override
  String get auctionTypeSale => 'Vente';

  @override
  String get auctionTypeLease => 'Location';

  @override
  String get adSpecifications => 'Spécifications';

  @override
  String get adPricing => 'Prix et frais';

  @override
  String get adBookPrice => 'Cahier des charges';

  @override
  String get adAssetInfo => 'Informations sur le bien';

  @override
  String get adAuctionType => 'Type d\'enchère';

  @override
  String get adAssetClass => 'Catégorie du bien';

  @override
  String get adCondition => 'État';

  @override
  String get adUnitCount => 'Nombre d’unités';

  @override
  String get adRequiresCr => 'Registre de commerce requis';

  @override
  String get adRequiresNewspaper => 'Annonce dans la presse';

  @override
  String get adYes => 'Oui';

  @override
  String get adSchedule => 'Calendrier';

  @override
  String get adStartTime => 'Début de l’enchère';

  @override
  String get adEndTime => 'Fin de l’enchère';

  @override
  String get adExtensions => 'Prolongations';

  @override
  String get adLocation => 'Emplacement';

  @override
  String get adCommune => 'Commune';

  @override
  String get adMayor => 'Maire';

  @override
  String get adOpenMap => 'Ouvrir dans Maps';

  @override
  String get adInspection => 'Visite';

  @override
  String get adInspectionState => 'État de la visite';

  @override
  String get adInspectionOpen => 'Ouverte';

  @override
  String get adInspectionClosed => 'Fermée';

  @override
  String get adFrom => 'Du';

  @override
  String get adTo => 'Au';

  @override
  String get adInspectionPlace => 'Lieu de la visite';

  @override
  String get adLease => 'Conditions de location';

  @override
  String get adLeaseDuration => 'Durée (années)';

  @override
  String get adLeaseRenewals => 'Renouvellements';

  @override
  String get adTerms => 'Conditions';

  @override
  String get adConditionTerms => 'Conditions de participation';

  @override
  String get adAwardTerms => 'Conditions d’adjudication';

  @override
  String get adResult => 'Résultat de l’enchère';

  @override
  String get adWinner => 'Adjudicataire';

  @override
  String get adNoWinner => 'Aucun adjudicataire';

  @override
  String get adFinalPrice => 'Prix final';

  @override
  String get adAppealWindow => 'Délai de recours';

  @override
  String adAppealOpen(int days) {
    return 'Ouvert ($days jours)';
  }

  @override
  String get adAppealClosed => 'Expiré';

  @override
  String kycFileTooLarge(int maxKb) {
    return 'Le fichier dépasse $maxKb Ko — essayez une image plus petite';
  }

  @override
  String get docsTitle => 'Mes documents';

  @override
  String get docsSearchHint => 'Rechercher par enchère ou document';

  @override
  String get docsTotal => 'Total';

  @override
  String get docsBooks => 'Cahiers';

  @override
  String get docsAwards => 'Adjudications';

  @override
  String get docsReceipts => 'Reçus';

  @override
  String get docsFilters => 'Filtrer les documents';

  @override
  String get docsType => 'Type de document';

  @override
  String get docsPeriod => 'Période';

  @override
  String get docsCategory => 'Catégorie';

  @override
  String get docsEntity => 'Entité';

  @override
  String get docsSort => 'Tri';

  @override
  String get docsApply => 'Appliquer';

  @override
  String get docsClearFilters => 'Tout effacer';

  @override
  String get docTypeConditionBook => 'Cahier des charges';

  @override
  String get docTypeAward => 'Document d\'adjudication';

  @override
  String get docTypeReceipt => 'Reçu de paiement';

  @override
  String get docTypeDelivery => 'PV de livraison';

  @override
  String get docsPresetAll => 'Tout';

  @override
  String get docsPresetToday => 'Aujourd\'hui';

  @override
  String get docsPreset7d => '7 derniers jours';

  @override
  String get docsPreset30d => '30 derniers jours';

  @override
  String get docsPresetMonth => 'Ce mois';

  @override
  String get docsPresetYear => 'Cette année';

  @override
  String get docsSortRecent => 'Plus récents';

  @override
  String get docsSortOldest => 'Plus anciens';

  @override
  String get docsSortAuction => 'Par enchère';

  @override
  String get docsEmpty =>
      'Aucun document — les documents de vos enchères apparaîtront ici';

  @override
  String get docsNoResults => 'Aucun document ne correspond aux filtres';

  @override
  String get docsVerify => 'Vérifier';

  @override
  String get docsCannotOpen =>
      'Impossible d\'ouvrir le fichier — aucune application PDF';

  @override
  String get docsDownloadForbidden =>
      'Vous n\'avez pas accès au téléchargement de ce document';

  @override
  String get docsDownloadUnavailable =>
      'Le fichier du document n\'est pas disponible pour le moment';

  @override
  String get adAwardDocument => 'Document d\'adjudication';

  @override
  String get adDownloadAward => 'Télécharger le document d\'adjudication';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get forgotPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get recoverAccountTitle => 'Récupération par question secrète';

  @override
  String get recoverWithSecret => 'Récupérer via la question secrète';

  @override
  String get forgotPasswordHint =>
      'Saisissez votre NIN et l’e-mail enregistré ; nous enverrons un code de réinitialisation.';

  @override
  String get recoverAccountHint =>
      'Saisissez votre NIN et l’e-mail enregistré pour afficher votre question secrète.';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get showQuestion => 'Afficher la question';

  @override
  String codeSentHint(String email) {
    return 'Si un compte est associé à $email, un code à 6 chiffres vient d’y être envoyé.';
  }

  @override
  String get otpCode => 'Code de vérification';

  @override
  String get secretAnswer => 'Réponse secrète';

  @override
  String get secretAnswerHint =>
      'La réponse est sensible à la casse et aux espaces — saisissez-la exactement comme enregistrée.';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get setNewPassword => 'Définir le mot de passe';

  @override
  String get recoveryDone =>
      'Mot de passe modifié — connectez-vous avec le nouveau';

  @override
  String get secretQMotherMaiden =>
      'Quel est le nom de jeune fille de votre mère ?';

  @override
  String get secretQFirstSchool => 'Quel est le nom de votre première école ?';

  @override
  String get secretQBirthCity => 'Dans quelle ville êtes-vous né(e) ?';

  @override
  String get secretQPetName => 'Quel est le nom de votre premier animal ?';

  @override
  String get secretQFavTeacher => 'Qui est votre enseignant préféré ?';

  @override
  String bidsSoFar(int count) {
    return '$count offre(s) jusqu\'à présent';
  }

  @override
  String get unitDays => 'jour';

  @override
  String get unitHours => 'heure';

  @override
  String get unitMinutes => 'minute';

  @override
  String get unitSeconds => 'seconde';

  @override
  String bidAmountHint(String currency) {
    return 'Montant de l\'offre ($currency)';
  }

  @override
  String minBidHint(String amount) {
    return 'Enchère minimale : $amount';
  }

  @override
  String get submitYourBid => 'Soumettre votre offre';

  @override
  String get bidBelowMinimum =>
      'Le montant est inférieur à l\'enchère minimale';

  @override
  String get biddingClosed => 'Les enchères sont closes';

  @override
  String get ackTitle => 'Inscription à l\'enchère';

  @override
  String get ackSubtitleHasBook =>
      'Acceptez les conditions de participation pour lancer l\'inscription via la passerelle de paiement sécurisée';

  @override
  String get ackSubtitleNeedsBook =>
      'L\'achat du cahier des charges est requis pour l\'inscription — deux paiements successifs s\'ouvriront : le cahier puis l\'inscription';

  @override
  String get ackDepositRow => 'Caution (remboursable)';

  @override
  String get ackBookRow => 'Cahier des charges (non remboursable)';

  @override
  String get ackAgree =>
      'Je déclare avoir lu le cahier des charges et j\'accepte les conditions de participation';

  @override
  String get ackContinue => 'Continuer vers le paiement';

  @override
  String get ackGatewayNote =>
      'La passerelle de paiement sécurisée (CIBWeb) va s\'ouvrir';

  @override
  String minBidSectorHint(String amount, String percent) {
    return 'Enchère minimale $amount (taux du secteur $percent %)';
  }

  @override
  String bidBelowSectorMinimum(String amount, String percent) {
    return 'Impossible de proposer moins de $amount — le taux d\'augmentation fixé pour ce secteur est de $percent %';
  }

  @override
  String get adSession => 'Séance d\'enchère';

  @override
  String get adSessionNumber => 'Numéro de séance';

  @override
  String sessionRound(int round) {
    return 'Séance n° $round';
  }

  @override
  String get adSessionCode => 'Référence';

  @override
  String get adRescheduleCount => 'Nombre de reports';

  @override
  String get adReduction => 'Réduction appliquée au prix de départ';

  @override
  String percentValue(String percent) {
    return '$percent %';
  }

  @override
  String get adOriginalOpeningPrice => 'Prix de départ initial';

  @override
  String get adSessionHistory => 'Historique des séances';

  @override
  String get adSector => 'Secteur';

  @override
  String get adSectorIncrement => 'Taux d\'augmentation minimal du secteur';

  @override
  String get adMinBid => 'Enchère minimale acceptée';

  @override
  String get auctionFeatured => 'En vedette';

  @override
  String sessionRescheduledBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fois',
      one: 'une fois',
    );
    return 'Cette enchère a été reportée $_temp0 — le prix de départ affiché tient compte de la réduction';
  }

  @override
  String get lostEmailLink => 'E-mail perdu ?';

  @override
  String get lostEmailTitle => 'Récupération de l\'e-mail';

  @override
  String get lostEmailHint =>
      'Si vous n\'avez plus accès à votre e-mail, saisissez vos informations et joignez un selfie tenant votre carte d\'identité. Le service compétent examinera la demande et validera la nouvelle adresse.';

  @override
  String get lostEmailNewEmail => 'Nouvelle adresse e-mail';

  @override
  String get lostEmailSelfie => 'Selfie avec la carte d\'identité';

  @override
  String get lostEmailSelfieHint =>
      'Tenez la carte d\'identité près de votre visage ; l\'image et les données doivent être lisibles';

  @override
  String get lostEmailRetake => 'Reprendre la photo';

  @override
  String get lostEmailSubmit => 'Envoyer la demande';

  @override
  String get lostEmailSubmittedTitle => 'Demande envoyée';

  @override
  String get lostEmailSubmittedBody =>
      'Votre demande est en cours d\'examen par le service compétent. Vous pourrez vous connecter avec la nouvelle adresse dès son approbation.';

  @override
  String get lostEmailApprovedBody =>
      'Votre nouvelle adresse a été approuvée. Vous pouvez maintenant vous connecter.';

  @override
  String get lostEmailRejectedBody =>
      'La demande a été rejetée. Consultez le motif ci-dessous et renvoyez-la après correction.';

  @override
  String get lostEmailRejectionReason => 'Motif du rejet';

  @override
  String get lostEmailRefreshStatus => 'Actualiser le statut';

  @override
  String get lostEmailResubmit => 'Modifier et renvoyer';

  @override
  String get lostEmailRequestRef => 'N° de demande';

  @override
  String get lostEmailSubmittedAt => 'Date de dépôt';

  @override
  String get lostEmailSelfieRequired =>
      'Le selfie avec la carte d\'identité est obligatoire';

  @override
  String lostEmailImageTooLarge(int max) {
    return 'L\'image dépasse $max Ko — reprenez une photo plus légère';
  }

  @override
  String get docTypeParticipationReceipt => 'Reçu de participation';

  @override
  String get docTypeAuctionResult => 'Reçu du résultat de l\'enchère';

  @override
  String get adDocuments => 'Documents de l\'enchère';

  @override
  String get adDownloadParticipationReceipt =>
      'Télécharger le reçu de participation';

  @override
  String get adDownloadResult => 'Télécharger le reçu du résultat';

  @override
  String get adDownloadConditionBook => 'Télécharger le cahier des charges';

  @override
  String get adReceiptHint =>
      'Vous pouvez imprimer ou enregistrer le reçu après le téléchargement';

  @override
  String get adUnavailableTitle => 'Enchère indisponible';

  @override
  String get adUnavailableBody =>
      'Cette enchère a peut-être été annulée ou n\'est plus publiée.';

  @override
  String get premiumTitle => 'Abonnement Premium';

  @override
  String get premiumTagline =>
      'Soyez informé des nouvelles enchères avant les autres';

  @override
  String get premiumActive => 'Votre abonnement est actif';

  @override
  String get premiumInactive => 'Aucun abonnement actif';

  @override
  String get premiumPlanLabel => 'Formule';

  @override
  String get premiumStatus => 'Statut';

  @override
  String get premiumStartedAt => 'Date de début';

  @override
  String get premiumExpiresAt => 'Date d\'expiration';

  @override
  String get premiumAutoRenew => 'Renouvellement automatique';

  @override
  String get premiumAutoRenewOn => 'Activé';

  @override
  String get premiumAutoRenewOff => 'Désactivé';

  @override
  String get premiumStopAutoRenew => 'Désactiver le renouvellement';

  @override
  String get premiumStopAutoRenewConfirm =>
      'Votre abonnement restera actif jusqu\'à sa date d\'expiration et ne sera pas renouvelé. Continuer ?';

  @override
  String premiumDaysRemaining(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours restants',
      one: '1 jour restant',
    );
    return '$_temp0';
  }

  @override
  String get premiumExpiringSoon =>
      'Votre abonnement expire bientôt — renouvelez-le pour ne rien manquer';

  @override
  String get premiumChoosePlan => 'Choisissez votre formule';

  @override
  String get premiumSubscribe => 'S\'abonner';

  @override
  String get premiumRenew => 'Renouveler';

  @override
  String get premiumRecommended => 'Meilleur rapport';

  @override
  String get premiumPeriodMonthly => 'par mois';

  @override
  String get premiumPeriodYearly => 'par an';

  @override
  String get premiumNoPlans => 'Aucune formule disponible pour le moment';

  @override
  String get premiumPaymentDone => 'Votre abonnement est activé';

  @override
  String get cancel => 'Annuler';

  @override
  String get prefsTitle => 'Préférences de notification';

  @override
  String get prefsChannelsTitle => 'Canaux de réception';

  @override
  String get prefsChannelPush => 'Notifications de l\'application';

  @override
  String get prefsChannelPushHint =>
      'Reçues sur votre téléphone dès l\'événement';

  @override
  String get prefsChannelEmail => 'E-mail';

  @override
  String get prefsChannelEmailHint =>
      'Un récapitulatif des nouvelles enchères correspondant à vos intérêts';

  @override
  String get prefsChannelEmailPremiumOnly => 'Réservé aux membres Premium';

  @override
  String get prefsChannelSms => 'SMS';

  @override
  String get prefsNewAuctionAlerts => 'Alertes nouvelles enchères';

  @override
  String get prefsNewAuctionAlertsHint =>
      'Nous vous prévenons dès qu\'une enchère de vos catégories est publiée';

  @override
  String get prefsCategoriesTitle => 'Catégories qui vous intéressent';

  @override
  String get prefsCategoriesHint =>
      'Choisissez une ou plusieurs catégories. Sans sélection, vous recevrez toutes les catégories.';

  @override
  String get prefsCategoriesAll => 'Toutes les catégories';

  @override
  String get prefsNoCategories => 'Aucune catégorie disponible';

  @override
  String get prefsSave => 'Enregistrer les préférences';

  @override
  String get prefsSaved => 'Vos préférences ont été enregistrées';

  @override
  String get prefsDiscardChanges =>
      'Vous avez des modifications non enregistrées. Quitter sans enregistrer ?';

  @override
  String get prefsLeave => 'Quitter';

  @override
  String get prefsGoPremium => 'Passer à Premium';
}
