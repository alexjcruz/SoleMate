# SoleMate Setup Guide

## Prerequisites
- A computer running Windows, macOS, or Linux
- At least 8 GB RAM, 2 GB disk space
- Git installed
- A GitHub account
- VS Code installed with the following extensions:
    - Flutter
    - Dart
    - GitHub Pull Requests and Issues

# Install Flutter
- **macOS**:
    1. [Download Flutter SDK](https://docs.flutter.dev/get-started/install/macos)
    2. Extract and move the `flutter` folder to `/Applications/`
    3. Add Flutteer to PATH:
        ```ruby
        export PATH="$PATH:/Applications/flutter/bin"
        ```
    4. Run `flutter doctor` in terminal

- **Windows**:
    1. [Download Flutter SDK](https://docs.flutter.dev/get-started/install/windows)
    2. Extract and place in `C:\src\flutter`
    3. Add Flutter to your System Environment `PATH`
    4. Run `flutter doctor` in Command Prompt or preferred terminal

# Install Android Studio
1. [Download Android Studio](https://developer.android.com/studio)
2. During installation, check:
    - Android SDK
    - Android Virtual Device
    - Command-line tools
3. Launch Android Studio > Preferences > Plugins > Install Flutter and Dart
4. Accept licenses:
    ```
    flutter doctor --android-licenses
    ```

# iOS Setup (Mac only)
1. Install [Xcode](https://developer.apple.com/xcode/)
2. Run once to complete installation
3. Install CocoaPods:
    ```
    sudo gem install cocoapods
    ```

# Firebase Setup
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a project named `SoleMate`
3. Add both iOS and Android apps to the project
4. Download:
    - `google-services.json` for Android
    - `GoogleService-Info.plist` for iOS
5. Place them:
    - Android: `android/app/google-services.json`
    - iOS: `ios/Runner/GoogleService-Info.plist`

# Clone Project
```ruby
git clone https://github.com/yourusername/SoleMate.git
cd SoleMate
flutter pub get
```

# Run App
- Android: Use Android emulator or physical device
- iOS (Mac only): Use iPhone simulator or physical device
```
flutter run
```

# Troubleshooting
- Run `flutter doctor` and follow its suggestions
- If build issues occur, try:
```
flutter clean
flutter pub get
```










