<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f0f0f,40:1e1b4b,80:312e81,100:4338ca&height=220&section=header&text=VEON&fontSize=90&fontColor=ffffff&fontAlignY=40&fontStyle=bold&desc=Modern%20Flutter%20Fashion%20E-Commerce&descAlignY=62&descSize=18&descColor=a5b4fc" width="100%"/>

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![GetX](https://img.shields.io/badge/GetX-8B5CF6?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/get)

<br/>

[![Android](https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white)](#)
[![iOS](https://img.shields.io/badge/iOS-000000?style=flat-square&logo=apple&logoColor=white)](#)
[![Web](https://img.shields.io/badge/Web-4285F4?style=flat-square&logo=googlechrome&logoColor=white)](#)
[![Windows](https://img.shields.io/badge/Windows-0078D4?style=flat-square&logo=windows&logoColor=white)](#)
[![macOS](https://img.shields.io/badge/macOS-000000?style=flat-square&logo=apple&logoColor=white)](#)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)](#)

<br/>

![UI](https://img.shields.io/badge/UI%20%2F%20Frontend-✅%20Complete-22c55e?style=flat-square)
![Backend](https://img.shields.io/badge/Firebase%20Backend-🔧%20In%20Progress-f59e0b?style=flat-square)
![Type](https://img.shields.io/badge/Type-University%20Assignment-6366f1?style=flat-square)

<br/>

*"Discover Limitless Choices and Unmatched Convenience"*

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
- [Author](#-author)

---

## 🌟 Overview

**VEON** is a cross-platform fashion e-commerce mobile application developed as a **university module assignment**. Built with **Flutter** and **GetX**, it follows a production-grade **feature-first clean architecture** with a full separation of `controllers`, `models`, and `screens` per feature domain.

The app delivers a premium end-to-end shopping experience — from an illustrated onboarding flow, through product browsing and wishlist management, to a full checkout pipeline with order review and payment confirmation. The UI is fully complete and the **Firebase backend integration is currently in progress**.

---

## 🖼️ App Screens

<details>
<summary><b>🚀 Onboarding  (3 Slides)</b></summary>
<br/>

| # | Screen | Description |
|:---:|---|---|
| 1 | **Choose Your Product** | Welcome to a world of limitless choices — your perfect product awaits |
| 2 | **Select Payment Method** | For seamless transactions — your convenience, our priority |
| 3 | **Deliver at Your Doorstep** | Swift, secure, and contactless delivery right to your door |

Each slide has a **Skip** button and a **Next arrow** with dot indicators.

</details>

<details>
<summary><b>🔐 Authentication</b></summary>
<br/>

| Screen | Elements |
|---|---|
| **Sign In** | VEON logo · Email & password fields · Remember Me · Forgot Password · Sign In button · Google & Facebook OAuth |
| **Sign Up** | First & Last name · Username · Email · Phone number · Password · Terms & Privacy checkbox · Create Account button · Google & Facebook OAuth |
| **Password Configuration** | Forgot password / reset flow |

</details>

<details>
<summary><b>🏠 Core Screens  (Bottom Navigation)</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Home** | Personalised greeting · Search bar · Category icons (T-Shirt, Pants, Shoes, Accessories, Dress) · Featured banner carousel · Popular Products grid |
| **Store** | Tab filters: Men · Women · Accessories · Gift Cards · Product grid with 25% discount badges · Wishlist heart per card · Add to cart |
| **Wishlist** | Saved products grid · Heart toggle · Quick add-to-cart per item |
| **Profile / Account** | User avatar & name · My Addresses · My Cart · My Orders · Bank Account · My Coupons · Notifications · Account Privacy · Firebase Cloud Sync · Geolocation toggle |

</details>

<details>
<summary><b>🛒 Shopping Flow</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Product Details** | Multi-angle image gallery (4 thumbnails) · Star rating & review count · Original & discounted price · Discount badge · Colour picker · Size selector (S / M / L / XL / XXL) · In Stock status · Quantity stepper · Add to Cart |
| **Cart** | Item list with thumbnail · Colour & size summary · Quantity ± controls · Per-item price · Checkout CTA button |
| **Order Review** | Item summary · Promo code input · Subtotal / Shipping Fee / Tax / Total breakdown · Payment mode (PayPal) · Shipping address with change option · Checkout CTA |
| **Payment Success** | Animated green badge · "Payment Success!" heading · Shipping confirmation · Continue button |

</details>

---

## ✨ Features

| Category | Features |
|---|---|
| **Onboarding** | 3-step illustrated slideshow · Skip & Next navigation · Dot indicators |
| **Auth** | Email/password sign-in & sign-up · Remember Me · Forgot password · Google OAuth · Facebook OAuth |
| **Home** | Personalised greeting · Category quick-access · Banner carousel · Popular products section |
| **Store** | Men / Women / Accessories / Gift Cards tabs · Discount badges · Add to wishlist |
| **Product** | Multi-image gallery · Ratings · Colour & size variants · Stock status · Quantity control |
| **Cart** | Add / remove items · Quantity management · Live total calculation |
| **Checkout** | Promo code · Itemised cost (subtotal + shipping + tax) · Payment method · Saved address |
| **Orders** | In-progress and completed order tracking |
| **Profile** | Address management · Coupon list · Bank account · Notification settings · Privacy controls |
| **App Settings** | Firebase cloud sync · Geolocation toggle |
| **Platform** | Android · iOS · Web · Windows · macOS · Linux |

---

## 🏗️ Architecture

VEON uses a **Feature-First Clean Architecture** with **GetX** for state management, dependency injection (via `bindings/`), and routing. Each feature module is fully self-contained.

```
┌──────────────────────────────────────────────────────────────────┐
│                          VEON APP                                │
│                                                                  │
│   ┌────────────┐   ┌────────────┐   ┌────────────────────────┐  │
│   │  BINDINGS  │   │   COMMON   │   │         UTILS          │  │
│   │            │   │            │   │                        │  │
│   │ GetX DI &  │   │  styles/   │   │ constants  · device    │  │
│   │  routing   │   │  widgets/  │   │ formatters · helpers   │  │
│   └────────────┘   └────────────┘   │ http       · logging   │  │
│                                     │ local_storage · theme  │  │
│   ┌────────────┐                    │ validators             │  │
│   │    DATA    │                    └────────────────────────┘  │
│   │            │                                                 │
│   │ repos/     │                                                 │
│   │ services/  │                                                 │
│   └────────────┘                                                 │
│                                                                  │
│   ┌──────────────────────────────────────────────────────────┐   │
│   │                       FEATURES                          │   │
│   │                                                          │   │
│   │  ┌──────────────────────┐  ┌───────────────────────┐   │   │
│   │  │   AUTHENTICATION     │  │   PERSONALIZATION     │   │   │
│   │  │                      │  │                       │   │   │
│   │  │ controllers/         │  │ controllers/          │   │   │
│   │  │  └─ onboarding/      │  │ models/               │   │   │
│   │  │ models/              │  │ screens/              │   │   │
│   │  │ screens/             │  │  ├─ address/          │   │   │
│   │  │  ├─ login/           │  │  ├─ profile/          │   │   │
│   │  │  ├─ onboarding/      │  │  └─ settings/         │   │   │
│   │  │  ├─ password_config/ │  └───────────────────────┘   │   │
│   │  │  └─ signup/          │                               │   │
│   │  └──────────────────────┘                               │   │
│   │                                                          │   │
│   │  ┌──────────────────────────────────────────────────┐   │   │
│   │  │                      SHOP                        │   │   │
│   │  │                                                  │   │   │
│   │  │  controllers/   models/   screens/               │   │   │
│   │  │                           ├─ all_products/       │   │   │
│   │  │                           ├─ brand/              │   │   │
│   │  │                           ├─ cart/               │   │   │
│   │  │                           ├─ checkout/           │   │   │
│   │  │                           ├─ home/               │   │   │
│   │  │                           ├─ order/              │   │   │
│   │  │                           ├─ product_details/    │   │   │
│   │  │                           ├─ product_reviews/    │   │   │
│   │  │                           ├─ store/              │   │   │
│   │  │                           ├─ sub_category/       │   │   │
│   │  │                           └─ wishlist/           │   │   │
│   │  └──────────────────────────────────────────────────┘   │   │
│   └──────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────┘
```

---

## 📂 Project Structure

```
veon-app/
│
├── android/                          # Android platform
├── ios/                              # iOS platform
├── web/                              # Web platform
├── windows/                          # Windows desktop
├── linux/                            # Linux desktop
├── macos/                            # macOS desktop
├── assets/                           # Images, fonts, icons
│
└── lib/
    │
    ├── bindings/                     # GetX dependency injection bindings
    │
    ├── common/
    │   ├── styles/
    │   │   ├── rounded_container.dart
    │   │   ├── shadows.dart
    │   │   └── spacing_styles.dart
    │   └── widgets/                  # Global reusable widgets
    │       ├── appbar/
    │       ├── brand/
    │       ├── chips/
    │       ├── custom_shapes/
    │       ├── icons/
    │       ├── image_text_widgets/
    │       ├── images/
    │       ├── layouts/
    │       ├── list_tiles/
    │       ├── login_signup/
    │       ├── products/
    │       ├── success_screen/
    │       └── texts/
    │
    ├── data/
    │   ├── repositories/             # Data access layer
    │   └── services/                 # External service integrations
    │
    ├── features/
    │   │
    │   ├── authentication/           # 🔐 Auth feature
    │   │   ├── controllers/
    │   │   │   └── onboarding/
    │   │   ├── models/
    │   │   └── screens/
    │   │       ├── login/
    │   │       ├── onboarding/
    │   │       ├── password_configuration/
    │   │       └── signup/
    │   │
    │   ├── personalization/          # 👤 User profile feature
    │   │   ├── controllers/
    │   │   ├── models/
    │   │   └── screens/
    │   │       ├── address/
    │   │       ├── profile/
    │   │       └── settings/
    │   │
    │   └── shop/                     # 🛍️ Core shop feature
    │       ├── controllers/
    │       ├── models/
    │       └── screens/
    │           ├── all_products/
    │           ├── brand/
    │           ├── cart/
    │           ├── checkout/
    │           ├── home/
    │           ├── order/
    │           ├── product_details/
    │           ├── product_reviews/
    │           ├── store/
    │           ├── sub_category/
    │           └── wishlist/
    │
    ├── localization/                 # 🌍 Multi-language support
    │
    ├── utils/
    │   ├── constants/                # App-wide constants
    │   ├── device/                   # Device utility helpers
    │   ├── formatters/               # Date, currency formatters
    │   ├── helpers/                  # General helper functions
    │   ├── http/                     # HTTP client utilities
    │   ├── local_storage/            # Local persistence (GetStorage)
    │   ├── logging/                  # App logging
    │   ├── theme/                    # Light & dark theme config
    │   └── validators/               # Form input validators
    │
    ├── app.dart                      # Root app widget
    ├── firebase_options.dart         # Firebase config (auto-generated)
    ├── main.dart                     # App entry point
    └── navigation_menu.dart          # Bottom navigation controller
```

---

## 🛠️ Tech Stack

| Layer | Technology | Role |
|---|---|---|
| **UI Framework** | Flutter | Cross-platform UI rendering |
| **Language** | Dart | Business logic & UI code |
| **State Management** | GetX | Reactive state, routing & DI |
| **Dependency Injection** | GetX Bindings | Controller lifecycle management |
| **Authentication** | Firebase Auth | Email/password · Google · Facebook |
| **Database** | Cloud Firestore | Products, orders, users, addresses |
| **File Storage** | Firebase Storage | Product images & user avatars |
| **Local Storage** | GetStorage | Persistent local preferences |
| **HTTP Client** | Dart HTTP / Dio | API communication layer |
| **Payments** | PayPal | Checkout payment processing |
| **Localisation** | Flutter i18n | Multi-language support |
| **Config** | firebase_options.dart | Multi-platform Firebase config |

---

## 🚀 Getting Started

### Prerequisites

| Tool | Requirement |
|---|---|
| Flutter SDK | `>= 3.0.0` |
| Dart SDK | Bundled with Flutter |
| Firebase CLI | Latest stable |
| Android Studio | For Android target |
| Xcode | For iOS / macOS target |

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
> 📌 `firebase_options.dart` is auto-generated into `lib/`

**4. Run the app**
```bash
flutter run                   # Auto-detect connected device
flutter run -d android        # Android emulator or device
flutter run -d ios            # iOS simulator or device
flutter run -d chrome         # Web (Chrome)
flutter run -d windows        # Windows desktop
```

---

## 🧪 Testing & Analysis

```bash
# Run all unit & widget tests
flutter test

# Run with coverage
flutter test --coverage

# Static code analysis
flutter analyze

# Check for outdated packages
flutter pub outdated
```

---

## 📦 Build

```bash
# Android
flutter build apk --release              # APK
flutter build appbundle --release        # AAB (Play Store)

# iOS
flutter build ios --release              # IPA (App Store)

# Web
flutter build web --release

# Desktop
flutter build windows --release
flutter build linux --release
flutter build macos --release
```

---

## 🔥 Firebase Setup

| Step | Action |
|---|---|
| 1 | Create a project at [console.firebase.google.com](https://console.firebase.google.com) |
| 2 | Enable **Authentication** — Email/Password · Google · Facebook |
| 3 | Enable **Cloud Firestore** — products, orders, users, addresses |
| 4 | Enable **Firebase Storage** — product images, user avatars |
| 5 | Run `flutterfire configure` to sync all platform configs |

> The `firebase_options.dart` file is auto-generated and should not be committed with real credentials. Add it to `.gitignore` or use environment secrets in CI/CD.

---

## 🗺️ Roadmap

### ✅ Phase 1 — UI Complete
- [x] Onboarding flow (3 illustrated slides)
- [x] Sign In screen with OAuth buttons
- [x] Sign Up screen with full registration form
- [x] Password configuration / reset screen
- [x] Home feed — greeting, categories, banner, popular products
- [x] Store — tab-filtered product grid with discounts
- [x] Product Details — gallery, variants, ratings, add to cart
- [x] Cart — quantity management & pricing
- [x] Order Review — promo code, cost breakdown, address, payment
- [x] Payment Success confirmation screen
- [x] Wishlist screen
- [x] Profile & Account settings screen
- [x] Address, Profile & Settings sub-screens

### 🔧 Phase 2 — Firebase Backend (In Progress)
- [ ] Firebase Auth — email/password login & registration
- [ ] Firebase Auth — Google & Facebook OAuth
- [ ] Firestore — product catalogue & categories
- [ ] Firestore — user profile & address management
- [ ] Firestore — cart persistence & order management
- [ ] Firebase Storage — product image hosting
- [ ] PayPal payment gateway integration

### 🔮 Phase 3 — Planned Enhancements
- [ ] Push notifications (FCM)
- [ ] Real-time order tracking
- [ ] Product reviews & rating submission
- [ ] Geolocation-based recommendations
- [ ] Full multi-language support
- [ ] Sub-category & brand filtering

---

## 👤 Author

<div align="center">

**Kavindu Prabhath**

[![GitHub](https://img.shields.io/badge/GitHub-@The--Prabhath-181717?style=for-the-badge&logo=github)](https://github.com/The-Prabhath)
[![Email](https://img.shields.io/badge/Email-kavinduprabathkp@gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:kavinduprabathkp@gmail.com)

*Submitted as part of a University Module Assignment*

</div>

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:4338ca,50:312e81,100:0f0f0f&height=130&section=footer" width="100%"/>

**Built with ❤️ using Flutter & GetX**

⭐ *If you found this project helpful, please consider giving it a star!*

</div>
