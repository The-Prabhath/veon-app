<div align="center">

<br/>

```
██╗   ██╗███████╗ ██████╗ ███╗   ██╗
██║   ██║██╔════╝██╔═══██╗████╗  ██║
██║   ██║█████╗  ██║   ██║██╔██╗ ██║
╚██╗ ██╔╝██╔══╝  ██║   ██║██║╚██╗██║
 ╚████╔╝ ███████╗╚██████╔╝██║ ╚████║
  ╚═══╝  ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
```

### **Modern Flutter Fashion E-Commerce App**

*A sleek UI with a premium shopping experience — crafted for fashion-forward users.*

<br/>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)

![Status](https://img.shields.io/badge/Status-In%20Development-orange?style=for-the-badge)
![Frontend](https://img.shields.io/badge/Frontend-Complete-brightgreen?style=for-the-badge)
![Backend](https://img.shields.io/badge/Backend-In%20Progress-yellow?style=for-the-badge)

<br/>

</div>

---

## 📱 Overview

**VEON** is a cross-platform fashion e-commerce application built with **Flutter** and powered by **Firebase**. It delivers a seamless, high-end shopping experience with a modern UI tailored for fashion enthusiasts. Featuring a dark-themed home, curated product catalog, wishlist, cart management, and smooth checkout — VEON makes fashion shopping feel effortless and premium.

> ⚠️ **Development Status:** UI / Frontend is complete. Firebase backend integration is currently in progress.

---

## 🖼️ App Screens

### 🚀 Onboarding
| Choose Your Product | Select Payment Method | Doorstep Delivery |
|---|---|---|
| Welcome to a world of limitless choices | Seamless transaction experience | Swift, secure & contactless delivery |

### 🔐 Authentication
| Sign In | Sign Up |
|---|---|
| Email & Password login | Full registration: First/Last name, username, phone |
| Remember Me option | Terms & Privacy agreement |
| Google & Facebook OAuth | Google & Facebook OAuth |

### 🏠 Main Screens
| Home | Store | Wishlist | Profile |
|---|---|---|---|
| Personalised greeting | Men / Women / Accessories / Gift Cards tabs | Saved products grid | User info & avatar |
| Search bar | Product grid with discount badges | Heart toggle per product | My Addresses, Cart, Orders |
| Category icons (T-Shirt, Pants, Shoes, Accessories, Dress) | — | Quick add to cart | Bank Account & Coupons |
| Banner carousel | — | — | Notifications & Privacy settings |
| Popular Products section | — | — | Firebase Cloud sync & Geolocation |

### 🛍️ Shopping Flow
| Product Details | Cart | Order Review | Payment Success |
|---|---|---|---|
| Multi-image gallery | Item list with quantity control | Promo code input | Animated success badge |
| Star rating & reviews count | Per-item pricing | Subtotal + Shipping + Tax breakdown | Shipping confirmation message |
| Colour & Size selector (S / M / L / XL / XXL) | Total at bottom | PayPal payment mode | Continue button |
| Discount badge (e.g. 25% off) | Checkout CTA | Shipping address with change option | — |
| Add to Cart button | — | Final Checkout CTA | — |

---

## ✨ Features

- 🚀 **3-Step Onboarding** — Illustrated walkthrough highlighting core app benefits
- 🔐 **Authentication** — Email/password login & registration + Google / Facebook OAuth
- 🏠 **Home Feed** — Personalised greeting, search bar, category quick-access, banner carousel & popular products
- 🛍️ **Store** — Browse by Men, Women, Accessories & Gift Cards with discount badges
- ❤️ **Wishlist** — Save favourite items with one tap
- 📦 **Product Details** — Multi-angle image gallery, star ratings, colour picker & size selector
- 🛒 **Cart** — Add, remove and adjust item quantities with live pricing
- 🧾 **Order Review** — Promo code, itemised pricing (subtotal / shipping / tax), payment & shipping address
- ✅ **Payment Success** — Clean order confirmation screen
- 👤 **Profile** — Manage addresses, orders, bank account, coupons, notifications & account privacy
- ☁️ **Firebase Sync** — Cloud data upload & geolocation-based recommendations *(in progress)*
- 📲 **Cross-Platform** — Android · iOS · Web · Windows · macOS · Linux

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | Flutter |
| **Language** | Dart |
| **Backend / Database** | Firebase Firestore *(in progress)* |
| **Authentication** | Firebase Auth + Google & Facebook OAuth *(in progress)* |
| **Storage** | Firebase Storage *(in progress)* |
| **State Management** | *(Provider / Riverpod / Bloc — update as applicable)* |
| **Payments** | PayPal |
| **Platforms** | Android · iOS · Web · Windows · macOS · Linux |

---

## 📂 Project Structure

```
veon-app/
├── android/              # Android platform code
├── ios/                  # iOS platform code
├── linux/                # Linux platform code
├── macos/                # macOS platform code
├── web/                  # Web platform code
├── windows/              # Windows platform code
├── assets/               # Images, fonts & static assets
├── lib/
│   ├── models/           # Data models (Product, User, Order, Cart...)
│   ├── screens/
│   │   ├── onboarding/   # 3-step onboarding slides
│   │   ├── auth/         # Sign In & Sign Up
│   │   ├── home/         # Home feed
│   │   ├── store/        # Store with category tabs
│   │   ├── wishlist/     # Wishlist
│   │   ├── product/      # Product detail
│   │   ├── cart/         # Cart
│   │   ├── checkout/     # Order review & payment success
│   │   └── profile/      # Account & settings
│   ├── widgets/          # Reusable UI components
│   ├── services/         # Firebase & API services
│   ├── providers/        # State management
│   └── main.dart         # App entry point
├── test/                 # Unit & widget tests
├── firebase.json         # Firebase configuration
├── pubspec.yaml          # Flutter dependencies
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) `>=3.0.0`
- [Dart SDK](https://dart.dev/get-dart) (bundled with Flutter)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- Android Studio / Xcode (for mobile builds)

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

> 📌 Place `google-services.json` → `android/app/`  
> 📌 Place `GoogleService-Info.plist` → `ios/Runner/`

**4. Run the app**

```bash
flutter run                  # Default connected device
flutter run -d chrome        # Web
flutter run -d android       # Android
flutter run -d ios           # iOS
```

---

## 🧪 Running Tests

```bash
flutter test
flutter test --coverage
```

---

## 📦 Build

```bash
flutter build apk --release          # Android APK
flutter build appbundle --release    # Android App Bundle
flutter build ios --release          # iOS
flutter build web --release          # Web
flutter build windows --release      # Windows
```

---

## 🔥 Firebase Setup

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Authentication** — Email/Password, Google, Facebook
3. Enable **Cloud Firestore** — product catalogue, orders, user data
4. Enable **Firebase Storage** — product images & user avatars
5. Run `flutterfire configure` to sync all platform configs

---

## 🗺️ Roadmap

- [x] Complete UI design for all screens
- [x] Onboarding flow (3 slides)
- [x] Sign In & Sign Up screens
- [x] Home, Store, Wishlist, Profile (bottom nav)
- [x] Product Details, Cart & Checkout screens
- [x] Payment Success screen
- [ ] Firebase Auth integration (email + social)
- [ ] Firestore product catalogue
- [ ] Cart & order management with Firestore
- [ ] PayPal payment gateway
- [ ] Push notifications
- [ ] Geolocation-based recommendations

---

## 🤝 Contributing

1. Fork the project
2. Create your branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add your feature'`
4. Push to branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 👤 Author

**Kavindu Prabhath**

- GitHub: [@The-Prabhath](https://github.com/The-Prabhath)
- Email: kavinduprabathkp@gmail.com

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ and Flutter

⭐ Star this repo if you found it helpful!

</div>
