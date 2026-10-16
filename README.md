# Spolužrádlo

Sdílená lednička a mrazák pro domácnosti s více lidmi. Flutter (Android + iOS), Supabase, Riverpod.

## Struktura

```
lib/
├── main.dart                 # init .env, Supabase, ProviderScope
├── core/                     # config (env.dart), router, theme, utils
├── data/
│   ├── local/                # Drift – offline databáze
│   ├── remote/               # Supabase klient
│   └── repositories/         # offline-first repozitáře
├── features/
│   ├── auth/                 # přihlášení
│   ├── household/            # domácnost, pozvánky (deep link)
│   ├── items/                # produkty – přidání, předání, žádost, řazení
│   ├── scanner/              # skenování čárových kódů
│   └── notifications/        # upozornění na trvanlivost
└── shared/                   # modely (freezed) a sdílené widgety
supabase/
├── migrations/               # SQL schéma + RLS
└── functions/                # Edge Functions (denní kontrola expirací)
```

## Spuštění

```bash
cp .env.example .env              # doplnit Supabase URL a klíč
flutter pub get
dart run build_runner build -d    # vygeneruje *.g.dart / *.freezed.dart
flutter run
```

## Oprávnění

| Oprávnění | Android | iOS | Proč |
|---|---|---|---|
| Internet, stav sítě | `INTERNET`, `ACCESS_NETWORK_STATE` | – | Supabase, offline synchronizace |
| Kamera | `CAMERA` | `NSCameraUsageDescription` | skenování čárových kódů |
| Notifikace | `POST_NOTIFICATIONS`, `SCHEDULE_EXACT_ALARM`, `RECEIVE_BOOT_COMPLETED`, `VIBRATE` | `PERMISSION_NOTIFICATIONS` (Podfile), `remote-notification` | upozornění na trvanlivost |
| Deep link | intent-filter `spoluzradlo://invite`, `spoluzradlo://login-callback` | `CFBundleURLTypes` | pozvánky, návrat z přihlášení |
