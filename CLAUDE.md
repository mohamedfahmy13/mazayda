# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Mazayada is a Flutter app for the Algerian government auction platform (منصة مزايدة), built with Clean Architecture and wired to a live Laravel API. The README (in Arabic) is the most detailed reference — consult it for per-feature notes.

## Commands

```bash
flutter pub get                                          # install deps

# Generated files (*.freezed.dart, *.g.dart, injection.config.dart) ARE committed,
# so a fresh clone compiles as-is — but regenerate after editing any model/DI (see below).
dart run build_runner build --delete-conflicting-outputs # one-shot generation
dart run build_runner watch --delete-conflicting-outputs # regen on every save (use while developing)

flutter run                                              # run (also auto-generates l10n)
flutter gen-l10n                                         # regenerate localizations only
flutter analyze                                          # lint (flutter_lints + extra rules)
flutter test                                             # run all tests
flutter test test/widget_test.dart                       # run a single test file
```

After editing anything annotated with `@injectable`/`@LazySingleton`, or any Freezed/json model, you must re-run `build_runner` or the change won't take effect.

## Architecture

Strict Clean Architecture. Each feature under `lib/features/<name>/` has three layers with dependencies pointing **inward** toward `domain`:

- **domain/** — pure Dart. `entities/` (Equatable), `repositories/` (abstract interfaces), `usecases/` (one class per operation, `@injectable`). Knows nothing about Dio, JSON, or Freezed.
- **data/** — `models/` (Freezed + json_serializable, each with `fromJson` and `toEntity()`), `datasources/` (RemoteDataSource calling `ApiClient`), `repositories/` (Impl that catches `Exception`s and maps them to `Failure`s). DI: `@LazySingleton(as: AbstractType)`.
- **presentation/** — `cubit/` (Cubit + Freezed sealed state, `@injectable`), `pages/`, `widgets/`. UI matches on state via `BlocBuilder`.

Data flow: `Page → Cubit → UseCase → Repository(interface) → RepositoryImpl → RemoteDataSource → ApiClient(Dio) → API`, returning `Either<Failure, Entity>` (dartz) back up. The `auctions` feature is the canonical template — copy its structure when adding a feature, then run `build_runner` so injectable registers everything (no manual `getIt` registration).

The 10 features: `auth · auctions · kyc · bidding · payments · my_auctions · notifications · profile · appeals · qa`.

## Core infrastructure (`lib/core/`)

- **di/injection.dart** — `getIt` + `configureDependencies()` (called once in `main`). External deps (Dio, FlutterSecureStorage, Connectivity) are provided via the `RegisterModule` `@module`.
- **network/** — `ApiClient` wraps Dio and **automatically unwraps the `{data, message, meta}` envelope**, returning only `data`. `AuthInterceptor` injects the access token, sends `Accept-Language` = the current app language (read from `LocaleCubit` per request), and on a 401 tries a single token refresh **using the refresh token as bearer** (not the access token); on refresh failure it clears tokens and calls `SessionManager.expireSession()`. `token_storage.dart` persists access/refresh in secure storage.
- **session/SessionManager** — broadcasts session-expiry over a stream; `go_router`'s `refreshListenable` listens and auto-redirects to `login` from any screen. Keeps the network layer decoupled from navigation.
- **router/app_router.dart** — all routes centralized as named constants in `Routes`. Uses `StatefulShellRoute.indexedStack` for the 4-tab bottom nav (home · my-auctions · notifications · profile), each tab keeping its own state; detail screens open full-screen over the shell via the root navigator. Build the router once (not per rebuild) with `createRouter(getIt<SessionManager>())`.
- **realtime/** — abstract `RealtimeService` + Pusher impl for live bidding (channel `auction.{id}`, events `bid.placed` / `price.updated`), with polling fallback. Keys in `ApiConstants.pusherKey` / `pusherCluster`.
- **notifications/PushNotificationService** — FCM + flutter_local_notifications. Firebase init is wrapped in try/catch in `main` so a missing `google-services.json` disables Push instead of crashing.
- **connectivity/** — `ConnectivityCubit` + `ConnectivityBanner` (wraps the app via `MaterialApp.builder`).
- **theme/app_theme.dart** — `AppTheme.light` only; there is **no dark theme**. The Cairo font is wired here. **utils/locale_cubit.dart** — `LocaleCubit` persists the chosen language in secure storage; `main` awaits `loadSaved()` before `runApp`. **utils/locale_sync.dart** — `LocaleSync` pushes the language to the account (`PUT /profile {locale}`) at startup, after login, and on every switch, because the backend renders notifications in the account's saved locale, not the request's.
- **constants/** — `api_constants.dart` (all real endpoints + base URL), `app_colors.dart` (Primary `#215744`, Background `#f4f5f9`), `app_assets.dart` (type-safe `AppAssets`).

## Conventions

- **State management:** flutter_bloc Cubits only (no full Blocs). States are Freezed sealed unions.
- **Errors:** `exceptions.dart` (data layer) → caught in RepositoryImpl → `failures.dart` (domain, sealed) → surfaced as `Either<Failure, T>`.
- **i18n:** ARB + gen-l10n, type-safe. Template is `lib/l10n/app_ar.arb`; also maintain `app_fr.arb` and `app_en.arb`. Access via `AppLocalizations.of(context)`. Runtime language switch through `LocaleCubit`; RTL/LTR flips automatically (Arabic is RTL). Add a key to all three ARB files, then regenerate.
- **Assets:** reference through the type-safe `AppAssets` (never raw path strings); use the `AppImage` widget (has `errorBuilder` fallback) for both local assets and network URLs. Font is Cairo (variable), applied via theme.
- **Forms:** `formz` for live validation (see `features/auth/presentation/formz/auth_inputs.dart`); submit stays disabled until `canSubmit`, and server validation errors layer on top of local rules.
- **Sizing:** `flutter_screenutil` (design size 375×812) — use `.w`/`.h`/`.sp`. Spacing via `gap`'s `Gap()` rather than `SizedBox`.
- **Generated files** (`*.freezed.dart`, `*.g.dart`, `injection.config.dart`) are excluded from analysis — never edit them by hand.

## API notes

- Base URL is `https://mazayada.findosystem.com` (in `api_constants.dart`). `colloectio.json` at the repo root is the full Postman export ("Mazayada API Documentation") — the most complete endpoint/payload reference. It is currently **untracked** (not committed), so treat it as a local-only reference that may not exist on every clone.
- Pusher keys in `api_constants.dart` are placeholders (`YOUR_PUSHER_KEY`, cluster `eu`) — until replaced with real values, live bidding silently uses the polling fallback.
- Every response is the `{data, message, meta}` envelope; `ApiClient` returns the `data` part. Money fields come as `{amount, formatted}` → `MoneyModel`.
- Payments flow: terms acknowledgement → `register` → in-app WebView payment gateway → poll `payments/:ref/status`. The `PaymentStatusModel` field names are spec-derived (the status endpoint was 401-protected during dev) — verify against a real authenticated response and adjust if needed.
