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
![Backend](https://img.shields.io/badge/Firebase%20Backend-✅%20Complete-22c55e?style=flat-square)
![Status](https://img.shields.io/badge/Project%20Status-✅%20Fully%20Complete-22c55e?style=flat-square)
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

**VEON** is a cross-platform fashion e-commerce mobile application developed as a **university module assignment**. Built with **Flutter** and **GetX**, it follows a production-grade **feature-first clean architecture** with full separation of `controllers`, `models`, and `screens` per feature domain.

The app delivers a premium end-to-end shopping experience — from an illustrated onboarding flow, through product browsing, search, and wishlist management, to a full checkout pipeline with order review and payment confirmation. Both the **UI and Firebase backend are fully complete**, including real-time Firestore data, Firebase Auth (email/password + Google OAuth), order management, address management, and cloud-synced user profiles.

---

## 🖼️ App Screens

<details>
<summary><b>🚀 Onboarding (3 Slides)</b></summary>
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
| **Sign In** | VEON logo · Email & password fields · Remember Me · Forgot Password · Sign In button · Google OAuth |
| **Sign Up** | First & Last name · Username · Email · Phone number · Password · Terms & Privacy checkbox · Create Account button · Google OAuth |
| **Forgot Password** | Email entry · password reset link flow |
| **Reset Password** | Confirmation screen with resend option |

</details>

<details>
<summary><b>🏠 Core Screens (Bottom Navigation)</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Home** | Personalised greeting · Search bar · Category icons · Featured banner carousel (Firestore-driven) · Popular Products grid |
| **Store** | Tab filters by category · Brand showcase · Product grid with discount badges · Wishlist heart per card · Add to cart |
| **Wishlist** | Saved products grid · Heart toggle · Quick add-to-cart per item |
| **Profile / Account** | User avatar & name · My Addresses · My Cart · My Orders · My Coupons · Notifications · Account Privacy · Firebase Cloud Sync · Settings |

</details>

<details>
<summary><b>🔍 Search</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Search** | Live search input · Filtered product results · Product cards with add-to-cart |

</details>

<details>
<summary><b>🛒 Shopping Flow</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Product Details** | Multi-angle image slider · Star rating & review count · Original & discounted price · Discount badge · Colour picker · Size selector (S / M / L / XL / XXL) · Variation-based pricing · In Stock status · Quantity stepper · Add to Cart |
| **Cart** | Item list with thumbnail · Colour & size summary · Quantity ± controls · Per-item price · Checkout CTA |
| **Checkout / Order Review** | Item summary · Coupon code input · Subtotal / Shipping Fee / Tax / Total breakdown · Payment method · Billing address with change option · Place Order CTA |
| **Payment Success** | Animated success badge · "Your Order is Being Processed" confirmation · Continue Shopping button |

</details>

<details>
<summary><b>📦 Orders & Brands</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **My Orders** | Live order list from Firestore · Order status badges · Itemised order details |
| **All Brands** | Brand grid with product counts · Tap to view brand-specific products |
| **Brand Products** | Filtered product listing by brand |
| **Sub Categories** | Category-filtered horizontal product sections |
| **All Products** | Sortable full product listing |
| **Product Reviews** | Star rating breakdown · Progress bars · User review cards |

</details>

<details>
<summary><b>👤 Profile & Personalization</b></summary>
<br/>

| Screen | Key Elements |
|---|---|
| **Profile** | Editable user details · Profile image · Name, username, email, phone, DOB, gender |
| **Addresses** | Saved address list · Add new address form · Set default address |
| **Settings** | Dark/Light mode · Geolocation toggle · Firebase cloud sync · Account Privacy · Logout |

</details>

---

## ✨ Features

| Category | Features |
|---|---|
| **Onboarding** | 3-step illustrated slideshow · Skip & Next navigation · Dot indicators |
| **Auth** | Email/password sign-in & sign-up · Remember Me · Forgot & reset password · Google OAuth · Form validation · Custom Firebase exception handling |
| **Home** | Personalised greeting · Category quick-access · Firestore-powered banner carousel · Popular products section |
| **Store** | Category tab filters · Brand showcase · Discount badges · Add to wishlist |
| **Search** | Live search with real-time filtering · Product results grid |
| **Product** | Multi-image slider · Ratings · Colour & size variants · Variation-based pricing & stock · Quantity control |
| **Cart** | Add / remove items · Quantity management · Live total calculation · Persistent via GetStorage |
| **Checkout** | Coupon/promo code · Itemised cost (subtotal + shipping + tax) · Payment method · Saved address selection |
| **Orders** | Firestore-backed order creation · Order list with status tracking · In-progress and completed orders |
| **Wishlist** | Toggle wishlist per product · Persistent wishlist state |
| **Brands** | Brand listing · Brand-specific product filtering |
| **Sub Categories** | Category-based product exploration |
| **Profile** | Full profile editing · Profile image update via Firebase Storage |
| **Addresses** | Add / edit / delete addresses · Default address selection · Firestore-synced |
| **App Settings** | Light & dark theme · Firebase cloud sync · Geolocation toggle · Account privacy |
| **Error Handling** | Custom exceptions for Firebase Auth, Firestore, Platform & Format errors |
| **Network** | Network connectivity manager with offline detection |
| **Platform** | Android · iOS · Web · Windows · macOS · Linux |

---

## 🏗️ Architecture

VEON uses a **Feature-First Clean Architecture** with **GetX** for state management, dependency injection (via `bindings/`), and routing. Each feature module is fully self-contained with its own controllers, models, and screens.

```
┌──────────────────────────────────────────────────────────────────┐
│                          VEON APP                                │
│                                                                  │
│   ┌────────────┐   ┌────────────┐   ┌────────────────────────┐  │
│   │  BINDINGS  │   │   COMMON   │   │         UTILS          │  │
│   │            │   │            │   │                        │  │
│   │ GetX DI &  │   │  styles/   │   │ constants  · device    │  │
│   │  routing   │   │  widgets/  │   │ formatters · helpers   │  │
│   └────────────┘   └────────────┘   │ exceptions · network  │  │
│                                     │ local_storage · theme  │  │
│   ┌────────────┐                    │ validators · popups    │  │
│   │    DATA    │                    │ logging    · http      │  │
│   │            │                    └────────────────────────┘  │
│   │ repos/     │                                                 │
│   │  ├─ auth   │                                                 │
│   │  ├─ user   │                                                 │
│   │  ├─ address│                                                 │
│   │  ├─ product│                                                 │
│   │  ├─ brand  │                                                 │
│   │  ├─ category                                                 │
│   │  ├─ banner │                                                 │
│   │  └─ orders │                                                 │
│   └────────────┘                                                 │
│                                                                  │
│   ┌──────────────────────────────────────────────────────────┐   │
│   │                       FEATURES                          │   │
│   │                                                          │   │
│   │  ┌──────────────────────┐  ┌───────────────────────┐   │   │
│   │  │   AUTHENTICATION     │  │   PERSONALIZATION     │   │   │
│   │  │  controllers/        │  │  controllers/         │   │   │
│   │  │   ├─ login/          │  │   ├─ user_controller  │   │   │
│   │  │   ├─ signup/         │  │   └─ address_ctrl     │   │   │
│   │  │   └─ onboarding/     │  │  models/              │   │   │
│   │  │  screens/            │  │   ├─ user_model       │   │   │
│   │  │   ├─ login/          │  │   └─ address_model    │   │   │
│   │  │   ├─ signup/         │  │  screens/             │   │   │
│   │  │   ├─ onboarding/     │  │   ├─ address/         │   │   │
│   │  │   └─ password_config/│  │   ├─ profile/         │   │   │
│   │  └──────────────────────┘  │   └─ settings/        │   │   │
│   │                            └───────────────────────┘   │   │
│   │  ┌──────────────────────────────────────────────────┐   │   │
│   │  │                      SHOP                        │   │   │
│   │  │  controllers/                                    │   │   │
│   │  │   ├─ banner · brand · category · home            │   │   │
│   │  │   ├─ cart · checkout · order · wishlist          │   │   │
│   │  │   ├─ store · search                              │   │   │
│   │  │   └─ product/ (product + variation)              │   │   │
│   │  │  models/                                         │   │   │
│   │  │   ├─ banner · brand · category · product         │   │   │
│   │  │   ├─ product_attribute · product_variation       │   │   │
│   │  │   ├─ cart_item · order                           │   │   │
│   │  │  screens/                                        │   │   │
│   │  │   ├─ home · store · search · wishlist            │   │   │
│   │  │   ├─ all_products · brand · sub_category         │   │   │
│   │  │   ├─ product_details · product_reviews           │   │   │
│   │  │   ├─ cart · checkout · order                     │   │   │
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
    ├── app.dart                      # Root app widget
    ├── main.dart                     # App entry point
    ├── navigation_menu.dart          # Bottom navigation controller
    ├── firebase_options.dart         # Firebase config (auto-generated)
    │
    ├── bindings/
    │   └── general_bindings.dart     # GetX global DI bindings
    │
    ├── common/
    │   ├── styles/
    │   │   ├── rounded_container.dart
    │   │   ├── shadows.dart
    │   │   └── spacing_styles.dart
    │   └── widgets/
    │       ├── appbar/               # Custom AppBar & TabBar
    │       ├── brand/                # BrandCard, BrandShowCase
    │       ├── chips/                # ChoiceChip
    │       ├── custom_shapes/        # Containers & curved edges
    │       ├── icons/                # Circular icon button
    │       ├── images/               # Circular & rounded images
    │       ├── image_text_widgets/   # Vertical image+text
    │       ├── layouts/              # GridLayout
    │       ├── list_tiles/           # SettingsMenuTile, UserProfileTile
    │       ├── loaders/              # AnimationLoader, CircularLoader
    │       ├── login_signup/         # FormDivider, SocialButtons
    │       ├── products/
    │       │   ├── cart/             # AddRemoveButton, CartItem, CartMenuIcon, CouponWidget
    │       │   ├── product_cards/    # ProductCardVertical, ProductCardHorizontal
    │       │   ├── ratings/          # RatingIndicator
    │       │   └── sortable/         # SortableProducts
    │       ├── success_screen/       # SuccessScreen
    │       └── texts/                # PriceText, TitleText, SectionHeading, BrandTitle
    │
    ├── data/
    │   └── repositories/
    │       ├── authentication/       # AuthenticationRepository
    │       ├── user/                 # UserRepository
    │       ├── address/              # AddressRepository
    │       ├── products/             # ProductRepository
    │       ├── brands/               # BrandRepository
    │       ├── categories/           # CategoryRepository
    │       ├── banners/              # BannerRepository
    │       └── orders/               # OrderRepository
    │
    ├── features/
    │   │
    │   ├── authentication/
    │   │   ├── controllers/
    │   │   │   ├── login/            # LoginController
    │   │   │   ├── signup/           # SignupController
    │   │   │   └── onboarding/       # OnboardingController + widgets
    │   │   └── screens/
    │   │       ├── login/            # LoginScreen + LoginForm + LoginHeader
    │   │       ├── signup/           # SignupScreen + SignupForm + TermsCheckbox
    │   │       ├── onboarding/       # OnboardingScreen
    │   │       └── password_configuration/  # ForgetPassword + ResetPassword
    │   │
    │   ├── personalization/
    │   │   ├── controllers/
    │   │   │   ├── user_controller.dart
    │   │   │   └── address_controller.dart
    │   │   ├── models/
    │   │   │   ├── user_model.dart
    │   │   │   └── address_model.dart
    │   │   └── screens/
    │   │       ├── address/          # AddressScreen + AddNewAddress + SingleAddress
    │   │       ├── profile/          # ProfileScreen + ProfileMenu
    │   │       └── settings/         # SettingsScreen
    │   │
    │   └── shop/
    │       ├── controllers/
    │       │   ├── banner_controller.dart
    │       │   ├── brand_controller.dart
    │       │   ├── cart_controller.dart
    │       │   ├── category_controller.dart
    │       │   ├── checkout_controller.dart
    │       │   ├── home_controller.dart
    │       │   ├── order_controller.dart
    │       │   ├── search_controller.dart
    │       │   ├── store_controller.dart
    │       │   ├── wishlist_controller.dart
    │       │   └── product/
    │       │       ├── product_controller.dart
    │       │       └── variation_controller.dart
    │       ├── models/
    │       │   ├── banner_model.dart
    │       │   ├── brand_model.dart
    │       │   ├── cart_item_model.dart
    │       │   ├── category_model.dart
    │       │   ├── order_model.dart
    │       │   ├── product_model.dart
    │       │   ├── product_attribute_model.dart
    │       │   └── product_variation_model.dart
    │       └── screens/
    │           ├── home/             # HomeScreen + HomeAppbar + HomeCategories + PromoSlider
    │           ├── store/            # StoreScreen + CategoryTab
    │           ├── search/           # SearchScreen
    │           ├── wishlist/         # WishlistScreen
    │           ├── all_products/     # AllProductsScreen
    │           ├── brand/            # AllBrandsScreen + BrandProductsScreen
    │           ├── sub_category/     # SubCategoriesScreen
    │           ├── product_details/  # ProductDetail + ImageSlider + MetaData + Attributes + BottomCart + RatingShare
    │           ├── product_reviews/  # ProductReviews + UserReviewCard + RatingProgressIndicator
    │           ├── cart/             # CartScreen + CartItems
    │           ├── checkout/         # CheckoutScreen + BillingAddress + BillingAmount + BillingPayment
    │           └── order/            # OrderScreen + OrderList
    │
    ├── localization/                 # 🌍 Multi-language support
    │
    └── utils/
        ├── constants/                # colors · sizes · text_strings · image_strings · enums · api_constants
        ├── device/                   # DeviceUtility
        ├── exceptions/               # Custom Firebase, Auth, Format, Platform exceptions
        ├── formatters/               # Formatter (date, phone, currency)
        ├── helpers/                  # HelperFunctions, PricingCalculator
        ├── http/                     # HttpClient
        ├── local_storage/            # StorageUtility (GetStorage)
        ├── logging/                  # Logger
        ├── network/                  # NetworkManager
        ├── popups/                   # Loaders, FullScreenLoader
        ├── theme/                    # Light & Dark theme + custom sub-themes
        └── validators/               # Validation (email, phone, password)
```

---

## 🛠️ Tech Stack

| Layer | Technology | Role |
|---|---|---|
| **UI Framework** | Flutter | Cross-platform UI rendering |
| **Language** | Dart | Business logic & UI code |
| **State Management** | GetX | Reactive state, routing & DI |
| **Dependency Injection** | GetX Bindings | Controller lifecycle management |
| **Authentication** | Firebase Auth | Email/password · Google OAuth |
| **Database** | Cloud Firestore | Products, orders, users, addresses, banners, brands, categories |
| **File Storage** | Firebase Storage | Product images & user avatars |
| **Local Storage** | GetStorage | Persistent local preferences & cart |
| **HTTP Client** | Dart HTTP | API communication layer |
| **Network** | NetworkManager | Connectivity detection & handling |
| **Error Handling** | Custom Exceptions | Firebase Auth, Firestore, Platform & Format exceptions |
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
| 2 | Enable **Authentication** — Email/Password · Google |
| 3 | Enable **Cloud Firestore** — products, orders, users, addresses, banners, brands, categories |
| 4 | Enable **Firebase Storage** — product images, user avatars |
| 5 | Run `flutterfire configure` to sync all platform configs |

### Firestore Collections

| Collection | Purpose |
|---|---|
| `Users` | User profiles & account data |
| `Users/{id}/Addresses` | Per-user saved addresses |
| `Users/{id}/Orders` | Per-user order history |
| `Products` | Product catalogue with variants & attributes |
| `Categories` | Product category hierarchy |
| `Brands` | Brand listing with image & product count |
| `Banners` | Home screen promotional banners |

> ⚠️ The `firebase_options.dart` file is auto-generated and should not be committed with real credentials. Add it to `.gitignore` or use environment secrets in CI/CD.

---

## 🗺️ Roadmap

### ✅ Phase 1 — UI Complete
- [x] Onboarding flow (3 illustrated slides)
- [x] Sign In screen with OAuth buttons
- [x] Sign Up screen with full registration form
- [x] Forgot Password & Reset Password screens
- [x] Home feed — greeting, categories, banner, popular products
- [x] Store — tab-filtered product grid with discounts & brands
- [x] Search screen with live filtering
- [x] Product Details — gallery, variants, ratings, add to cart
- [x] Cart — quantity management & pricing
- [x] Checkout / Order Review — coupon, cost breakdown, address, payment
- [x] Payment Success confirmation screen
- [x] Wishlist screen
- [x] All Products, All Brands, Brand Products screens
- [x] Sub Categories screen
- [x] Product Reviews screen
- [x] Orders screen
- [x] Profile & Account settings screen
- [x] Address, Profile & Settings sub-screens

### ✅ Phase 2 — Firebase Backend Complete
- [x] Firebase Auth — email/password login & registration
- [x] Firebase Auth — Google OAuth
- [x] Firestore — product catalogue with variants & attributes
- [x] Firestore — category & brand management
- [x] Firestore — banner / promo slider data
- [x] Firestore — user profile & address management
- [x] Firestore — cart persistence & order management
- [x] Firebase Storage — product image hosting & user avatars
- [x] Custom Firebase & platform exception handling
- [x] Network connectivity detection & management

### 🔮 Phase 3 — Planned Enhancements
- [ ] Push notifications (FCM)
- [ ] Real-time order tracking
- [ ] Product reviews & rating submission
- [ ] Geolocation-based recommendations
- [ ] Full multi-language support (localization/)
- [ ] PayPal payment gateway integration
- [ ] Facebook OAuth

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

**Built with ❤️ using Flutter & Firebase**

⭐ *If you found this project helpful, please consider giving it a star!*

</div>
