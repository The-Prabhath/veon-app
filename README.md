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

<br/>

</div>

---

## 📱 Overview

**VEON** is a cross-platform fashion e-commerce application built with **Flutter** and powered by **Firebase**. It delivers a seamless, high-end shopping experience with a modern UI tailored for fashion enthusiasts. Whether you're browsing the latest trends or checking out your cart, VEON makes it feel effortless and elegant.

---

## ✨ Features

- 🛍️ **Product Catalog** — Browse curated fashion collections with rich product details
- 🔍 **Smart Search** — Quickly find items by name, category, or style
- ❤️ **Wishlist** — Save your favourite looks for later
- 🛒 **Shopping Cart** — Smooth add-to-cart and checkout flow
- 🔐 **Authentication** — Secure sign-in with Firebase Auth
- 📦 **Order Management** — Track your orders in real time
- 🌙 **Dark Mode** — Elegant dark & light theme support
- 📲 **Cross-Platform** — Runs on Android, iOS, Web, Windows, macOS & Linux

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | Flutter |
| **Language** | Dart |
| **Backend / DB** | Firebase (Firestore, Auth, Storage) |
| **State Management** | *(e.g., Provider / Riverpod / Bloc)* |
| **Platforms** | Android · iOS · Web · Windows · macOS · Linux |

---

## 📂 Project Structure

```
veon-app/
├── android/          # Android platform code
├── ios/              # iOS platform code
├── linux/            # Linux platform code
├── macos/            # macOS platform code
├── web/              # Web platform code
├── windows/          # Windows platform code
├── assets/           # Images, fonts & static assets
├── lib/              # Main Dart source code
│   ├── models/       # Data models
│   ├── screens/      # UI screens
│   ├── widgets/      # Reusable widgets
│   ├── services/     # Firebase & API services
│   ├── providers/    # State management
│   └── main.dart     # App entry point
├── test/             # Unit & widget tests
├── firebase.json     # Firebase configuration
├── pubspec.yaml      # Flutter dependencies
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

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

**4. Run the app**

```bash
# Run on a connected device or emulator
flutter run

# Run for a specific platform
flutter run -d chrome        # Web
flutter run -d android       # Android
flutter run -d ios           # iOS
```

---

## 🧪 Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 📦 Build

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

---

## 🔥 Firebase Setup

This project uses Firebase for backend services. Ensure you:

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Authentication**, **Firestore**, and **Storage**
3. Download and place `google-services.json` → `android/app/`
4. Download and place `GoogleService-Info.plist` → `ios/Runner/`
5. Run `flutterfire configure` to sync settings

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

---

## 👤 Author

**Kavindu Prabhath**

- GitHub: [@The-Prabhath](https://github.com/The-Prabhath)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ and Flutter

⭐ Star this repo if you found it helpful!

</div>
