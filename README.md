<div align="center">

<br />

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1a1a2e,50:4f46e5,100:7c3aed&height=200&section=header&text=VEON&fontSize=80&fontColor=ffffff&fontAlignY=38&desc=Modern%20Flutter%20Fashion%20E-Commerce&descAlignY=58&descSize=20&descColor=c4b5fd" width="100%"/>

<br />

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![GetX](https://img.shields.io/badge/GetX-8B5CF6?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/get)

<br />

[![Android](https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white)](https://www.android.com)
[![iOS](https://img.shields.io/badge/iOS-000000?style=flat-square&logo=apple&logoColor=white)](https://www.apple.com/ios)
[![Web](https://img.shields.io/badge/Web-4285F4?style=flat-square&logo=googlechrome&logoColor=white)](#)
[![Windows](https://img.shields.io/badge/Windows-0078D4?style=flat-square&logo=windows&logoColor=white)](#)
[![macOS](https://img.shields.io/badge/macOS-000000?style=flat-square&logo=apple&logoColor=white)](#)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)](#)

<br />

![UI](https://img.shields.io/badge/UI%20%2F%20Frontend-✅%20Complete-22c55e?style=flat-square)
![Backend](https://img.shields.io/badge/Firebase%20Backend-🔧%20In%20Progress-f59e0b?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-a855f7?style=flat-square)

<br />

> **VEON** is a premium fashion e-commerce app built with Flutter.  
> Browse curated collections, manage your cart, and checkout with ease — all wrapped in a sleek, modern UI.

<br />

</div>

---

## 📌 Table of Contents

- [Overview](#-overview)
- [App Screens](#️-app-screens)
- [Features](#-features)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Tech Stack](#️-tech-stack)
- [Getting Started](#-getting-started)
- [Firebase Setup](#-firebase-setup)
- [Roadmap](#️-roadmap)
- [Contributing](#-contributing)
- [Author](#-author)

---

## 🌟 Overview

**VEON** is a cross-platform fashion e-commerce application engineered with Flutter and Firebase. It follows a **feature-first clean architecture** with a clear separation of concerns across `controllers`, `models`, and `screens`. The app delivers a refined, high-performance shopping experience from onboarding through to payment confirmation.

```
"Discover Limitless Choices and Unmatched Convenience"
```

---

## 🖼️ App Screens

<details>
<summary><b>🚀 Onboarding  (3 Slides)</b></summary>

| Slide | Title | Description |
|:---:|---|---|
| 1 | **Choose Your Product** | Welcome to a World of Limitless Choices |
| 2 | **Select Payment Method** | Seamless Transactions, Your Convenience is Our Priority |
| 3 | **Deliver at Your Doorstep** | Swift, Secure, and Contactless Delivery |

</details>

<details>
<summary><b>🔐 Authentication</b></summary>

| Screen | Details |
|---|---|
| **Sign In** | Email & password · Remember Me · Forgot Password · Google & Facebook OAuth |
| **Sign Up** | First/Last name · Username · Email · Phone · Password · Terms & Privacy |

</details>

<details>
<summary><b>🏠 Core App Screens</b></summary>

| Screen | Key Elements |
|---|---|
| **Home** | Personalised greeting · Search bar · Category icons (T-Shirt, Pants, Shoes, Accessories, Dress) · Banner carousel · Popular Products |
| **Store** | Tab filters: Men · Women · Accessories · Gift Cards · Product grid with discount badges |
| **Wishlist** | Saved items grid · Heart toggle · Quick add-to-cart |
| **Profile / Account** | Avatar · My Addresses · My Cart · My Orders · Bank Account · My Coupons · Notifications · Privacy · Firebase Sync · Geolocation toggle |

</details>

<details>
<summary><b>🛒 Shopping Flow</b></summary>

| Screen | Key Elements |
|---|---|
| **Product Details** | Multi-angle gallery · Star rating & review count · Discount badge · Colour picker · Size selector (S / M / L / XL / XXL) · Add to Cart |
| **Cart** | Item list · Quantity controls · Per-item pricing · Checkout CTA |
| **Order Review** | Promo code · Subtotal / Shipping / Tax breakdown · Payment mode (PayPal) · Shipping address · Final checkout |
| **Payment Success** | Animated badge · Confirmation message · Continue button |

</details>

---

## ✨ Features

```
✅ 3-step illustrated onboarding
✅ Email / Password authentication
✅ Google & Facebook OAuth sign-in
✅ Home feed with personalised greeting & banner carousel
✅ Category-based product browsing
✅ Product detail view with image gallery & variant selection
✅ Colour & size selector (S / M / L / XL / XXL)
✅ Discount badges & pricing
✅ Wishlist with heart toggle
✅ Shopping cart with quantity management
✅ Promo code support at checkout
✅ Order review with itemised cost breakdown
✅ PayPal payment integration (UI complete)
✅ Payment success confirmation
✅ User profile & account management
✅ Address management
✅ Order tracking (in-progress & completed)
✅ Coupon management
✅ Push notification settings
✅ Account privacy controls
🔧 Firebase Cloud data sync (in progress)
🔧 Geolocation-based recommendations (in progress)
```

---

## 🏗️ Architecture

VEON follows a **Feature-First Architecture** — each feature is fully self-contained with its own `controllers`, `models`, and `screens`.  
This pattern improves scalability, testability, and team collaboration.

```
┌─────────────────────────────────────────────────────────┐
│                       VEON APP                          │
│                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ COMMON       │  │ DATA         │  │ UTILS        │  │
│  │ • Styles     │  │ • Repos      │  │ • Helpers    │  │
│  │ • Widgets    │  │ • Services   │  │ • Constants  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                   FEATURES                      │   │
│  │                                                 │   │
│  │  ┌─────────────────┐  ┌───────────────────┐   │   │
│  │  │ AUTHENTICATION  │  │ PERSONALIZATION   │   │   │
│  │  │ • controllers   │  │ • controllers     │   │   │
│  │  │ • models        │  │ • models          │   │   │
│  │  │ • screens       │  │ • screens         │   │   │
│  │  └─────────────────┘  └───────────────────┘   │   │
│  │                                                 │   │
│  │  ┌──────────────────────────────────────────┐  │   │
│  │  │                  SHOP                    │  │   │
│  │  │  controllers │ models │ screens:         │  │   │
│  │  │  all_products · brand · cart · checkout  │  │   │
│  │  │  home · order · product_details          │  │   │
│  │  │  product_reviews · store                 │  │   │
│  │  │  sub_category · wishlist                 │  │   │
│  │  └──────────────────────────────────────────┘  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │ LOCALIZATION │  │ FIREBASE     │                    │
│  └──────────────┘  └──────────────┘                    │
└─────────────────────────────────────────────────────────┘
```

---

## 📂 Project Structure

```
veon-app/
│
├── android/                        # Android platform
├── ios/                            # iOS platform
├── web/                            # Web platform
├── windows/                        # Windows platform
├── linux/                          # Linux platform
├── macos/                          # macOS platform
├── assets/                         # Images, fonts, icons
│
└── lib/
    │
    ├── common/
    │   ├── styles/
    │   │   ├── rounded_container.dart
    │   │   ├── shadows.dart
    │   │   └── spacing_styles.dart
    │   └── widgets/                # Reusable UI components
    │
    ├── data/                       # Repositories & data sources
    │
    ├── features/
    │   │
    │   ├── authentication/         # 🔐 Auth Feature
    │   │   ├── controllers/        #   Login, Register, Forgot Password
    │   │   ├── models/             #   User model
    │   │   └── screens/            #   Sign In, Sign Up screens
    │   │
    │   ├── personalization/        # 👤 Profile Feature
    │   │   ├── controllers/        #   Profile, Address, Settings
    │   │   ├── models/             #   Address, Coupon models
    │   │   └── screens/            #   Profile, Address, Settings screens
    │   │
    │   └── shop/                   # 🛍️ Shop Feature
    │       ├── controllers/        #   Home, Cart, Checkout, Wishlist
    │       ├── models/             #   Product, Cart, Order, Brand
    │       └── screens/
    │           ├── all_products/   #   Full product listing
    │           ├── brand/          #   Brand-specific page
    │           ├── cart/           #   Cart screen
    │           ├── checkout/       #   Order review + payment success
    │           ├── home/           #   Home feed
    │           ├── order/          #   Order tracking
    │           ├── product_details/#   Product detail + gallery
    │           ├── product_reviews/#   Reviews & ratings
    │           ├── store/          #   Store with category tabs
    │           ├── sub_category/   #   Sub-category browsing
    │           └── wishlist/       #   Saved items
    │
    ├── localization/               # 🌍 Multi-language support
    ├── utils/                      # 🔧 Helpers, constants, validators
    │
    ├── app.dart                    # App root widget
    ├── firebase_options.dart       # Firebase config (auto-generated)
    ├── main.dart                   # Entry point
    └── navigation_menu.dart        # Bottom navigation controller
```

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| **UI Framework** | Flutter | Cross-platform UI |
| **Language** | Dart | App logic |
| **State Management** | GetX | Controllers, routing, DI |
| **Authentication** | Firebase Auth | Email, Google, Facebook |
| **Database** | Cloud Firestore | Products, orders, users |
| **Storage** | Firebase Storage | Product images, avatars |
| **Backend Config** | firebase_options.dart | Multi-platform Firebase |
| **Payments** | PayPal | Checkout integration |
| **Localisation** | Flutter Localizations | Multi-language support |

---

## 🚀 Getting Started

### Prerequisites

| Tool | Version |
|---|---|
| Flutter SDK | `>= 3.0.0` |
| Dart SDK | Bundled with Flutter |
| Firebase CLI | Latest |
| Android Studio / Xcode | For mobile targets |

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/The-Prabhath/veon-app.git
cd veon-app
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Configure Firebase**
```bash
firebase login
flutterfire configure
```

> 📌 `google-services.json` → `android/app/`  
> 📌 `GoogleService-Info.plist` → `ios/Runner/`  
> 📌 `firebase_options.dart` → `lib/` *(auto-generated)*

**4. Run the app**
```bash
# Any connected device
flutter run

# Specific platform
flutter run -d chrome        # Web
flutter run -d android       # Android  
flutter run -d ios           # iOS
flutter run -d windows       # Windows
```

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage report
flutter test --coverage

# Analyse code
flutter analyze
```

---

## 📦 Build

```bash
flutter build apk --release           # Android APK
flutter build appbundle --release     # Android App Bundle (Play Store)
flutter build ios --release           # iOS (App Store)
flutter build web --release           # Web
flutter build windows --release       # Windows desktop
```

---

## 🔥 Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com) and create a new project
2. Enable the following services:

| Service | Usage |
|---|---|
| **Authentication** | Email/Password · Google · Facebook |
| **Cloud Firestore** | Products · Orders · Users · Addresses |
| **Firebase Storage** | Product images · User avatars |
| **Analytics** | User behaviour & funnel tracking |

3. Run `flutterfire configure` — this auto-generates `firebase_options.dart`

---

## 🗺️ Roadmap

#### ✅ Phase 1 — UI Complete
- [x] Onboarding flow (3 illustrated slides)
- [x] Sign In & Sign Up screens
- [x] Home feed with search, categories & banner
- [x] Store with Men / Women / Accessories / Gift Cards tabs
- [x] Product Detail screen (gallery, sizes, colours, ratings)
- [x] Cart with quantity management
- [x] Order Review (promo, pricing, address, payment)
- [x] Payment Success confirmation
- [x] Wishlist screen
- [x] Profile & Account settings screen

#### 🔧 Phase 2 — Firebase Backend (In Progress)
- [ ] Firebase Auth — email/password + Google + Facebook
- [ ] Firestore — product catalogue & categories
- [ ] Firestore — user profiles & addresses
- [ ] Firestore — cart & order management
- [ ] Firebase Storage — product images
- [ ] PayPal payment gateway integration

#### 🔮 Phase 3 — Advanced Features
- [ ] Push notifications
- [ ] Order real-time tracking
- [ ] Geolocation-based recommendations
- [ ] Multi-language support
- [ ] Product reviews & ratings system
- [ ] Admin dashboard

---

## 🤝 Contributing

Contributions are welcome! Here's how:

```bash
# 1. Fork & clone
git clone https://github.com/The-Prabhath/veon-app.git

# 2. Create a feature branch
git checkout -b feature/your-feature-name

# 3. Commit changes
git commit -m "feat: add your feature"

# 4. Push & open a PR
git push origin feature/your-feature-name
```

Please follow the existing feature-first folder structure and keep controllers, models, and screens separated within each feature module.

---

## 👤 Author

<div align="center">

**Kavindu Prabhath**

[![GitHub](https://img.shields.io/badge/GitHub-@The--Prabhath-181717?style=for-the-badge&logo=github)](https://github.com/The-Prabhath)
[![Email](https://img.shields.io/badge/Email-kavinduprabathkp@gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:kavinduprabathkp@gmail.com)

</div>

---

## 📄 License

```
MIT License — Copyright (c) 2024 Kavindu Prabhath

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

See the full [LICENSE](LICENSE) file for details.

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:7c3aed,50:4f46e5,100:1a1a2e&height=120&section=footer" width="100%"/>

**Built with ❤️ using Flutter**

⭐ If you found this project helpful, please give it a star!

</div>
