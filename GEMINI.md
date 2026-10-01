# ClassiPod Project Overview

This document provides a comprehensive overview of the ClassiPod project, including its purpose, architecture, and development conventions.

## Project Overview

ClassiPod is an iPod Classic-inspired music player for local audio and streaming from Subsonic-compatible servers, including Navidrome. It features a click wheel interface and focuses on providing a simple, distraction-free music listening experience. The app is built with Flutter and supports Android, iOS, Linux, macOS, Windows, and web.

### Key Technologies

*   **Framework:** Flutter
*   **State Management:** Riverpod
*   **Routing:** go_router
*   **Audio Playback:** just_audio
*   **Database:** Hive
*   **Localization:** flutter_localizations, intl
*   **CI/CD:** GitHub Actions

## Building and Running

To build and run the project, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/adeeteya/Classipod.git
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app in development mode:**
    ```bash
    flutter run --flavor dev --target=lib/main_development.dart
    ```

### Testing

The project includes unit and widget tests. To run the tests, use the following command:

```bash
flutter test
```

The project also has a GitHub Actions workflow that runs the tests on every pull request.

## Development Conventions

The project follows a strict set of development conventions to ensure code quality and consistency.

### Coding Style

The project uses the linting rules defined in the `analysis_options.yaml` file. These rules enforce a consistent coding style and help to prevent common errors. Some of the key style guidelines include:

*   Always declare return types.
*   Always use package imports.
*   Avoid relative lib imports.
*   Use `const` constructors where possible.
*   Require trailing commas.
*   Sort pub dependencies.

### Contribution Guidelines

The `CONTRIBUTING.md` file provides detailed instructions for contributing to the project. Key guidelines include:

*   Discuss changes via an issue before making a pull request.
*   Follow the code of conduct.
*   Provide clear and detailed bug reports and feature requests.

## Architecture

The project follows a feature-based architecture, with each feature located in its own directory under `lib/features`. The core functionality is located in the `lib/core` directory.

### Routing

The app uses the `go_router` package for routing. The routes are defined in the `lib/core/navigation/routes.dart` file. The `Routes` enum provides a type-safe way to navigate between screens.

### State Management

The app uses the `flutter_riverpod` package for state management. Providers are used to manage the state of the app and to provide dependencies to widgets.

### CI/CD

The project uses GitHub Actions for CI/CD. The `.github/workflows` directory contains two workflows:

*   `pr-checker.yaml`: This workflow runs on every pull request and checks for linting errors and runs the tests.
*   `build-and-deploy.yaml`: This workflow is triggered manually and can build and deploy the app for Android, Linux, Windows, and the web.
