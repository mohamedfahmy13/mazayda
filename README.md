# 🏛️ Mazayada — تطبيق منصة مزايدة (Flutter Clean Architecture)

تطبيق فلاتر لمنصة المزادات الحكومية الجزائرية، مبني بـ **Clean Architecture** ومربوط بالـ API الفعلي.

---

## 🧱 الـ Stack

| الأداة | الاستخدام |
|--------|-----------|
| **Dio** | الـ HTTP client + interceptors |
| **dio_smart_retry** | إعادة محاولة الطلبات الفاشلة (شبكة/مهلة) تلقائيًا |
| **pusher_channels_flutter** | المزايدة اللحظية (realtime) |
| **firebase_messaging** | Push notifications من السيرفر |
| **flutter_local_notifications** | عرض الإشعار والتطبيق مفتوح |
| **Freezed** | الموديلات + الـ sealed states |
| **json_serializable** | تحويل JSON ↔ Dart |
| **Equatable** | المقارنة في الـ entities |
| **flutter_bloc (Cubit)** | إدارة الحالة |
| **get_it + injectable** | الـ Dependency Injection |
| **dartz** | `Either<Failure, T>` للـ error handling |
| **flutter_screenutil** | التجاوب مع أحجام الشاشات |
| **flutter_secure_storage** | تخزين التوكنات بأمان |
| **image_picker** | تصوير/اختيار مستندات الـ KYC |
| **flutter_animate** | الأنيميشن والميكرو-إنتراكشن |
| **go_router** | التنقّل المركزي (متاح للاستخدام) |
| **formz** | التحقق من الحقول (متاح) |
| **connectivity_plus** | فحص الاتصال (متاح) |
| **url_launcher** | فتح بوابة الدفع والروابط |
| **webview_flutter** | بوابة الدفع داخل التطبيق |
| **gap / shimmer / skeletonizer / logger** | أدوات مساعدة للـ UI واللوج |

---

## 📂 هيكل المشروع (Clean Architecture)

```
lib/
├── core/                          # المشترك بين كل الـ features
│   ├── constants/
│   │   ├── app_colors.dart        # الألوان (#215744 / #f4f5f9)
│   │   └── api_constants.dart     # كل الـ endpoints الفعلية
│   ├── errors/
│   │   ├── failures.dart          # Failure (sealed) — طبقة domain
│   │   └── exceptions.dart        # Exceptions — طبقة data
│   ├── network/
│   │   ├── api_client.dart        # غلاف Dio + فك الـ envelope
│   │   ├── auth_interceptor.dart  # حقن التوكن + تجديد 401
│   │   └── token_storage.dart     # تخزين access/refresh
│   ├── theme/app_theme.dart
│   ├── usecase/usecase.dart       # UseCase base + NoParams
│   ├── widgets/                   # core widgets معاد استخدامها
│   │   ├── primary_button.dart
│   │   └── state_views.dart       # Loading / Error / Empty
│   └── di/injection.dart          # إعداد get_it + injectable
│
└── features/
    └── auctions/                  # feature كاملة (قدوة لباقي الـ features)
        ├── data/
        │   ├── models/            # AuctionModel, MoneyModel (Freezed+json)
        │   ├── datasources/       # AuctionRemoteDataSource
        │   └── repositories/      # AuctionRepositoryImpl
        ├── domain/
        │   ├── entities/          # Auction, Money (Equatable, نقية)
        │   ├── repositories/      # AuctionRepository (abstract)
        │   └── usecases/          # GetAuctions, GetAuctionById
        └── presentation/
            ├── cubit/             # AuctionsCubit + states (Freezed)
            ├── pages/             # AuctionsPage, AuctionDetailPage
            └── widgets/           # AuctionCard
```

---

## 🔄 تدفق البيانات | Data Flow

```
UI (Page)
  │ يستدعي
  ▼
Cubit  ──── emit ───▶  State (Freezed sealed)
  │ ينفّذ
  ▼
UseCase  ──▶  Either<Failure, Entity>
  │
  ▼
Repository (interface في domain)
  │ التنفيذ في data
  ▼
RepositoryImpl  ──── يمسك Exceptions ويحوّلها Failures
  │
  ▼
RemoteDataSource  ──▶  ApiClient (Dio)  ──▶  الـ API
  │
  ▼
Model.fromJson  ──▶  model.toEntity()
```

**القاعدة الذهبية:** الـ `domain` ما يعرفش حاجة عن `data` ولا `Dio` ولا `JSON`. كل اتجاه الاعتماد للداخل (نحو الـ domain).

---

## 🔐 صلاحيات النظام (مهمة للـ KYC)

`image_picker` يحتاج صلاحيات الكاميرا/الصور:

**Android** — `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.CAMERA"/>
```

**iOS** — `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>نحتاج الكاميرا لتصوير مستندات الهوية</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>نحتاج الوصول للصور لرفع المستندات</string>
```

---

## 🌍 الترجمة (i18n) — عربي / فرنسي / إنجليزي

النظام الرسمي **ARB + gen-l10n** (type-safe). الملفات في `lib/l10n/`:
`app_ar.arb` (القالب) · `app_fr.arb` · `app_en.arb`.

**الاستخدام في أي شاشة:**
```dart
final t = AppLocalizations.of(context);
Text(t.login); // يترجم تلقائيًا حسب اللغة الحالية
```

**إضافة نص جديد:**
1. أضف المفتاح في `app_ar.arb` (القالب) ثم في `app_fr.arb` و `app_en.arb`.
2. شغّل `flutter gen-l10n` (أو `flutter run` يولّده تلقائيًا).
3. استخدمه عبر `t.yourKey`.

**تبديل اللغة وقت التشغيل:** عبر `LocaleCubit` (في الملف الشخصي). الاتجاه (RTL/LTR) يتغيّر تلقائيًا — العربية RTL، والباقي LTR.

---

## 🧭 التنقّل (go_router)

كل المسارات مركزية في `lib/core/router/app_router.dart` بأسماء ثابتة في `Routes`:
```dart
context.go(Routes.home);              // استبدال
context.push(Routes.notifications);   // دفع
context.push('${Routes.auctionDetail}/$id'); // بمعامل
context.pop();                        // رجوع
```

---

## 🔔 الـ Realtime والإشعارات

### Pusher (المزايدة اللحظية)
- الخدمة مجرّدة في `core/realtime/realtime_service.dart` والتطبيق بـ Pusher في `pusher_realtime_service.dart`.
- ضع مفاتيحك في `ApiConstants.pusherKey` و `pusherCluster`.
- الـ `BiddingCubit` يشترك في قناة `auction.{id}` تلقائيًا، ويسقط على polling بطيء (كل 10ث) لو فشل الاتصال. مؤشّر "مباشر" يظهر في الشاشة عند الاتصال.
- أسماء الأحداث المتوقّعة من Laravel: `bid.placed` و `price.updated` (عدّلها في `ApiConstants` لتطابق الـ backend).

### Firebase Cloud Messaging (Push)
الخدمة في `core/notifications/push_notification_service.dart`. خطوات الإعداد:
1. أنشئ مشروع Firebase وأضِف تطبيق Android/iOS.
2. ضع `google-services.json` في `android/app/` و `GoogleService-Info.plist` في `ios/Runner/`.
3. شغّل `flutterfire configure` (يولّد `firebase_options.dart`) أو أضِف الإعداد يدويًا.
4. أرسل الـ FCM token للـ backend بعد تسجيل الدخول:
   ```dart
   final token = await getIt<PushNotificationService>().getToken();
   // POST للـ backend لربط الـ token بالمستخدم (حسب endpoint السيرفر)
   ```

**صلاحيات إضافية** — Android `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

---

## 🎨 الـ Assets والخطوط

**البنية:**
```
assets/
├── fonts/   ← خط Cairo (4 أوزان) — اقرأ assets/fonts/README.md
├── images/  ← الصور (splash, empty states, placeholders)
├── icons/   ← أيقونات مخصّصة (PNG/SVG)
└── logo/    ← اللوجو (logo.png, logo_white.png, app_icon.png)
```

**الوصول للـ assets** — عبر `AppAssets` (type-safe، بدل كتابة paths كنصوص):
```dart
Image.asset(AppAssets.logo);
AppImage(asset: AppAssets.placeholder, radius: 12); // widget موحّد مع fallback
AppImage(url: auction.coverPhotoUrl);                // أو صورة من الإنترنت
```

**الخط:** Cairo مُفعّل في الـ theme (`fontFamily: 'Cairo'`) ويُطبّق على التطبيق كله.
⚠️ **مطلوب منك:** ضع ملفات `Cairo-*.ttf` الأربعة في `assets/fonts/` (الروابط في `assets/fonts/README.md`). بدونها التطبيق يعمل لكن بالخط الافتراضي.

**حماية من الكراش:** `AppImage` و splash يستخدمان `errorBuilder` — لو أي asset لسه غير موجود، يظهر بديل بدل ما يكسر التطبيق.

---

## 📶 شريط حالة الاتصال (Connectivity)

- `ConnectivityCubit` (في `core/connectivity`) يراقب اتصال الجهاز عبر `connectivity_plus` ويبثّ `online/offline`.
- `ConnectivityBanner` يلفّ التطبيق كله (عبر `MaterialApp.builder`) ويعرض:
  - شريط **أحمر** ثابت أعلى الشاشة أثناء انقطاع الاتصال.
  - ومضة **خضراء** "تم استعادة الاتصال" لثانيتين عند العودة ثم تختفي.
- مترجم (عربي/فرنسي/إنجليزي) ومتحرّك (slide من الأعلى).

---

## ✅ التحقق الفوري من الحقول (Formz)

شاشتا **التسجيل والدخول** تستخدمان `formz` للتحقق اللحظي:
- كل حقل = `FormzInput` بقواعده (NIN 18 رقم، هاتف جزائري، بريد صالح، كلمة مرور 8+ أحرف).
- الأخطاء تظهر **وأنت تكتب** (بعد أول تعديل، مش قبله) ومترجمة حسب اللغة.
- زر الإرسال **مقفول** حتى تصبح كل الحقول صحيحة (`canSubmit`).
- يدعم أيضًا **أخطاء التحقق من السيرفر** (مثلاً: البريد مستخدم) فوق التحقق المحلي.
- ملفات الـ inputs: `features/auth/presentation/formz/auth_inputs.dart`.

---

## 🧭 الـ Bottom Navigation (StatefulShellRoute)

شريط سفلي ثابت بـ 4 تبويبات: **الرئيسية · مزايداتي · الإشعارات · حسابي**.

- مبني على `StatefulShellRoute.indexedStack` — كل تبويب له navigation stack مستقل **ويحفظ حالته** (تتنقّل بين التبويبات والحالة باقية).
- الشاشات الفرعية (تفاصيل المزاد، المزايدة، KYC، الاعتراضات، Q&A) تُفتح **full-screen فوق الشريط** عبر الـ root navigator.
- الشريط في `core/widgets/shell/main_shell.dart` — أسماء مترجمة + مؤشّر علوي متحرّك للتبويب النشط.
- الضغط على نفس التبويب يرجّعك لجذره.

---

## 🔒 معالجة انتهاء الجلسة (Auto-logout)

عند فشل تجديد التوكن (الـ refresh token نفسه منتهٍ أو غير صالح):
1. `AuthInterceptor` يمسح التوكنات ويستدعي `SessionManager.expireSession()`.
2. `SessionManager` يبثّ حدثًا عبر stream (طبقة الـ network لا تعرف شيئًا عن الـ navigation — فصل نظيف).
3. `go_router` يسمع الحدث عبر `refreshListenable` ويوجّه المستخدم تلقائيًا لـ `login` من **أي شاشة**.

النمط ده بيمنع المستخدم من البقاء في شاشات محمية بجلسة منتهية، ويشتغل تلقائيًا في الخلفية.

---

## ⚙️ التشغيل | Setup

### 1) تثبيت الباكدجات
```bash
flutter pub get
```

### 2) توليد الكود (مهم جدًا)
المشروع بيستخدم code generation. الملفات `*.freezed.dart` و `*.g.dart` و `injection.config.dart` **مش موجودة** — لازم تولّدها:

```bash
dart run build_runner build --delete-conflicting-outputs
```

> أثناء التطوير استخدم watch عشان يولّد تلقائيًا مع كل تعديل:
> ```bash
> dart run build_runner watch --delete-conflicting-outputs
> ```

### 3) التشغيل
```bash
flutter run
```

---

## 🧩 إزاي تضيف feature جديدة (بنفس النمط)

خد feature الـ `auctions` كقالب. لو عايز تعمل feature الـ `notifications` مثلًا:

1. **domain/entities** — اكتب الـ entity النقي (Equatable).
2. **domain/repositories** — اكتب الـ interface (abstract).
3. **domain/usecases** — use case لكل عملية (`@injectable`).
4. **data/models** — موديل بـ Freezed + json (`fromJson` + `toEntity`).
5. **data/datasources** — `RemoteDataSource` يكلّم `ApiClient` (`@LazySingleton(as: ...)`).
6. **data/repositories** — `RepositoryImpl` يمسك الـ exceptions (`@LazySingleton(as: ...)`).
7. **presentation/cubit** — Cubit + state (Freezed sealed) (`@injectable`).
8. **presentation/pages + widgets** — الـ UI مع `BlocBuilder` ومطابقة الحالات.
9. شغّل `build_runner` عشان injectable يسجّل كل حاجة.

> أي كلاس عليه `@injectable` أو `@LazySingleton` بيتسجّل أوتوماتيك في `getIt`. مش محتاج تسجّل يدوي.

---

## 🔌 ملاحظات عن الـ API (مهمة)

- **الـ envelope:** كل response شكله `{data, message, meta}`. الـ `ApiClient` بيرجّع جزء `data` تلقائيًا.
- **الفلوس:** بترجع بالدينار الكامل بالشكل `{amount, formatted}` → `MoneyModel`.
- **التعريب:** بنبعت `Accept-Language` بلغة التطبيق الحالية في كل طلب (في الـ interceptor)، و`LocaleSync` بيحفظها على الحساب (`PUT /profile {locale}`) عشان الإشعارات تتولّد بنفس اللغة.
- **التوكن:** access + refresh. التجديد بيستخدم الـ **refresh token** كـ bearer (مش الـ access).
- **401:** الـ interceptor بيحاول يجدّد مرة واحدة ويعيد الطلب، ولو فشل بيمسح التوكنات.

> **ملاحظة Payments:** ردّ `payments/:ref/status` في الـ Postman كان 401 (محمي)، فحقول `PaymentStatusModel` (`payment_type` / `is_confirmed` / `status`) مبنية على نمط الـ spec — راجعها مع رد فعلي مصادق عليه وعدّل أسماء الحقول لو لزم.

---

## ✅ الـ features الجاهزة في النسخة دي

- ✅ **Core كامل** (network, errors, DI, theme, widgets)
- ✅ **Auctions** — قائمة المزادات + تفاصيل المزاد (مربوطة بالـ API فعليًا)
- ✅ **Auth** — Splash + Register + OTP (6 أرقام) + Login (مع فرع تأكيد البريد) + Logout + حفظ التوكنات
- ✅ **KYC** — حالة التحقق + رفع المستندات (multipart + image_picker) + dropdowns الولاية/البلدية + إرسال للمراجعة
- ✅ **Bidding** — المزايدة المباشرة: السعر الحي + **polling تلقائي على `/price`** (fallback للـ realtime) + سجل المزايدات + أزرار الزيادة + تقديم مزايدة مع عرض أخطاء القواعد المعرّبة
- ✅ **Payments** — flow كامل: إقرار كراس الشروط → التسجيل (`register`) → **بوابة دفع داخل WebView** → استطلاع الحالة (`payments/:ref/status`) + الدفع النهائي للفائز
- ✅ **My Auctions** — 4 تبويبات (active/won/lost/upcoming) مع عرض مختلف لكل تبويب وحالة فارغة لكل واحد
- ✅ **Notifications** — صندوق كامل: قائمة + عدّاد غير المقروء (badge) + تعليم واحد/الكل كمقروء (تحديث تفاؤلي) + سحب للتحديث
- ✅ **Profile** — البيانات (الهوية للقراءة فقط) + **مبدّل اللغة (3 لغات)** + تسجيل الخروج
- ✅ **go_router** — تنقّل مركزي في كل التطبيق (`core/router/app_router.dart`) بمسارات مسمّاة
- ✅ **i18n كاملة** — عربي/فرنسي/إنجليزي عبر ARB + gen-l10n، تبديل اللغة وقت التشغيل، RTL/LTR تلقائي
- ✅ **Appeals** — قائمة الاعتراضات بحالاتها + تقديم اعتراض جديد (bottom sheet)
- ✅ **Q&A** — أسئلة الفحص: قائمة سؤال/جواب + حالة "بانتظار الرد" + طرح سؤال جديد
- ✅ **Realtime (Pusher)** — المزايدة اللحظية عبر قناة `auction.{id}` + fallback polling + مؤشّر "مباشر"
- ✅ **Push (FCM + Local)** — استقبال إشعارات السيرفر + عرضها والتطبيق مفتوح

## 🎉 كل الـ features اكتملت (10 features)

auth · auctions · kyc · bidding · payments · my_auctions · notifications · profile · appeals · qa

> كل واحدة فيها endpoints جاهزة في `api_constants.dart` — تكرّر نفس الـ 9 خطوات اللي فوق.

---

## 🎨 الألوان

| | |
|--|--|
| Primary | `#215744` |
| Background | `#f4f5f9` |

---

*مبني لمستوى ~سنة ونص خبرة — مبسّط، منظّم، ومشروح بالعربي.*
