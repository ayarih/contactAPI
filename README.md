# Contacts API

A Flutter application for managing and interacting with device contacts through a clean API interface.

## Overview

This project provides a Flutter-based contacts management system that allows users to access, create, update, and manage contacts on their device. Built with Flutter's cross-platform capabilities, this application works seamlessly across Android, iOS, Web, Windows, macOS, and Linux platforms.

## Features

- **Contact Management**: Create, read, update, and delete contacts
- **Cross-Platform Support**: Works on Android, iOS, Web, Windows, macOS, and Linux
- **Device Integration**: Seamlessly integrates with native contact systems
- **Clean Architecture**: Organized codebase following Flutter best practices
- **API-First Design**: Built with a focus on providing a robust API layer

## Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
- Dart SDK (comes with Flutter)
- Platform-specific development tools:
  - **Android**: Android Studio / Android SDK
  - **iOS**: Xcode (macOS only)
  - **Desktop**: Platform-specific build tools

## Getting Started

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ayarih/contactAPI.git
cd contactAPI
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
# For Android/iOS
flutter run

# For Web
flutter run -d chrome

# For Desktop (Windows/macOS/Linux)
flutter run -d windows  # or macos, linux
```

## Project Structure

```
contactAPI/
├── android/          # Android-specific files
├── ios/              # iOS-specific files
├── lib/              # Main application code
├── linux/            # Linux-specific files
├── macos/            # macOS-specific files
├── test/             # Unit and widget tests
├── web/              # Web-specific files
├── windows/          # Windows-specific files
└── pubspec.yaml      # Project dependencies
```

## Platform-Specific Setup

### Android

Add the following permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.WRITE_CONTACTS" />
```

### iOS

Add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSContactsUsageDescription</key>
<string>This app needs access to contacts to manage your contact list.</string>
```

## Development

### Running Tests

```bash
flutter test
```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Desktop
flutter build windows --release  # or macos, linux
```

## Dependencies

Check `pubspec.yaml` for a complete list of dependencies. Key dependencies typically include:

- `contacts_service` or similar for device contact access
- `permission_handler` for managing permissions
- Platform-specific packages for native integrations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Contacts Service Package](https://pub.dev/packages/contacts_service)

## License

This project is open source. Please check the repository for license information.

## Support

If you encounter any issues or have questions, please file an issue on the GitHub repository.

## Acknowledgments

Built with Flutter - Google's UI toolkit for building natively compiled applications.
