# Project N2: Multitool App

Project N2 is a versatile Flutter application that serves as a multitool for various productivity and finance management tasks.

## Features

- **To-Do Lists**: Manage tasks with daily resets and custom lists.
- **Wallet Management**: Track finances and transactions.
- **Calendar**: (Planned feature)
- **Customizable Widgets**: Add and arrange widgets on the home screen.
- **Theme Customization**: Choose between light, dark, and OLED black themes.
- **Cross-Platform**: Supports iOS, Android, and potentially web and desktop platforms.

## Technology Stack

- **Framework**: Flutter
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Local Database**: ObjectBox
- **Backend Services**: Firebase (Firestore, Authentication, Storage)
- **In-App Purchases**: Supported

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Xcode (for mobile development)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/your-username/project_n2.git
   ```
2. Navigate to the project directory:
   ```
   cd project_n2
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Generate necessary files:
   ```
   dart run build_runner build
   ```
   Or, for continuous code generation during development:
   ```
   dart run build_runner watch
   ```
5. Run the app:
   ```
   flutter run
   ```

## Project Structure

The project follows a modular architecture with the following main directories:

- `lib/core`: Core functionality and routing
- `lib/models`: Data models and state management
- `lib/views`: UI screens and dialogs
- `lib/shared`: Shared widgets and layouts
- `lib/tools`: Utility functions and enums

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[Add your license information here]

## Contact

[Add your contact information here]
