# Building the Customer Mobile App (Android & iOS Beta)

This guide covers creating **Beta** builds of the customer app using [EAS Build](https://docs.expo.dev/build/introduction/) for both Android and iOS.

## Prerequisites

1. **Expo account** – Sign up at [expo.dev](https://expo.dev) if you don’t have one.
2. **EAS CLI** – Install and log in:
   ```bash
   npm install -g eas-cli
   eas login
   ```
3. **Link the project** (first time only) – From this directory (`apps/customer-mobile`):
   ```bash
   eas build:configure
   ```
   This uses the existing `eas.json`. When prompted, choose or create an Expo project to link.

## First Beta build (APK)

From the repo root or from `apps/customer-mobile`:

```bash
# From repo root
npm run build:android:beta -w customer-mobile

# Or from apps/customer-mobile
npm run build:android:beta
```

Or with EAS CLI directly:

```bash
cd apps/customer-mobile
eas build --platform android --profile preview
```

- **Profile**: `preview` (see `eas.json`) – internal distribution, **APK** output.
- **Output**: EAS builds in the cloud and gives you a link to download the `.apk`.
- **Install**: Share the download link with testers; they can install the APK on Android devices (allow “Install from unknown sources” if needed).

## Environment for the build

- The build uses your **app’s config** from `app.json` and any **env** you set in EAS (e.g. in [expo.dev](https://expo.dev) → Project → Build → Environment variables).
- For the app to talk to your API, set **EXPO_PUBLIC_API_URL** (or your API env var) in EAS secrets or in the `preview` profile in `eas.json` under `env`, e.g.:
  ```json
  "preview": {
    "distribution": "internal",
    "env": {
      "EXPO_PUBLIC_API_URL": "https://your-api.example.com"
    },
    "android": { "buildType": "apk" },
    "channel": "preview"
  }
  ```
  Or set it in the EAS dashboard so the built app points at your Beta API.

## Version for next Betas

Before each new Beta, bump the version so testers and stores see an update:

1. **app.json** – `expo.version` (e.g. `1.0.0` → `1.0.1`) and `expo.android.versionCode` (e.g. `1` → `2`).
2. Re-run the Beta build:
   ```bash
   npm run build:android:beta -w customer-mobile
   ```

## Production build (Play Store)

When you’re ready for Play Store (internal testing or production):

```bash
eas build --platform android --profile production
```

This produces an **AAB** (Android App Bundle) for upload to Google Play Console. Configure signing (e.g. EAS credentials) and optionally `eas submit` as in `eas.json`.

### EAS “Install dependencies” failed (monorepo + Prisma)

This app lives in an **npm workspace** with the API at the repo root. A root `npm install` on EAS runs **`@prisma/client`’s postinstall** (`prisma generate`), which often breaks on mobile build workers.

`eas.json` sets **`PRISMA_SKIP_POSTINSTALL_GENERATE=1`** on build profiles so install can finish. (Only affects the EAS builder; run `npm run prisma:generate` locally for the API as usual.)

### Branding icon script before build

`update-icon-from-branding` runs **on your machine** before upload. It needs a reachable API URL: set **`EXPO_PUBLIC_API_URL`** in `apps/customer-mobile/.env`, or pass a public base URL so it is not stuck on a LAN IP like `192.168.x.x`.

## First Beta build (iOS)

From the repo root or from `apps/customer-mobile`:

```bash
# From repo root
npm run build:ios:beta -w customer-mobile

# Or from apps/customer-mobile
npm run build:ios:beta
```

Or with EAS CLI:

```bash
cd apps/customer-mobile
eas build --platform ios --profile preview
```

- **Profile**: `preview` – internal distribution (ad hoc build).
- **Apple Developer account**: You need an [Apple Developer Program](https://developer.apple.com/programs/) membership ($99/year). EAS will prompt you to sign in with your Apple ID and can manage credentials.
- **Output**: EAS gives you a link to download the build or install via simulator.
- **Install on devices**: For internal testing, register test devices in your Apple Developer account. Install via the build link or use TestFlight for production builds later.

**iOS version for next Betas:** Bump `expo.version` and `expo.ios.buildNumber` in `app.json` before each new Beta.

## Production build (iOS / App Store)

```bash
eas build --platform ios --profile production
```

Produces an IPA for App Store Connect. Use `eas submit` or upload manually.

---

## Troubleshooting

- **“Project not configured”** – Run `eas build:configure` and link the app to an Expo project.
- **Build fails** – Check the build log on [expo.dev](https://expo.dev) → your project → Builds.
- **App can’t reach API** – Set `EXPO_PUBLIC_API_URL` (or your API base URL) in EAS env/secrets for the profile you use to build.
