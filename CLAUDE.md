# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Fomato is a tomato-themed Todo list application built with Flutter. It combines task management with pomodoro timer functionality, using modern state management with Riverpod and declarative routing with go_router.

## Development Commands

### Running the App
```bash
# Run on connected device/emulator
flutter run

# Run on specific platform
flutter run -d chrome        # Web
flutter run -d macos         # macOS
flutter run -d windows       # Windows
flutter run -d linux         # Linux
```

### Building
```bash
# Build for release (platform-specific)
flutter build apk           # Android APK
flutter build ios           # iOS
flutter build web           # Web
flutter build macos         # macOS
flutter build windows       # Windows
flutter build linux         # Linux
```

### Testing & Analysis
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage

# Analyze code for issues
flutter analyze

# Check for outdated dependencies
flutter pub outdated

# Format code
dart format .

# Format single file
dart format lib/file.dart
```

### Dependency Management
```bash
# Install dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Add a new dependency
flutter pub add package_name
```

## Architecture

### State Management
- **flutter_riverpod** (v3.2.1): Used for reactive state management
- All pages and widgets are `ConsumerWidget` or `ConsumerStatefulWidget` for Riverpod integration
- Provider scope is initialized at the app root in `main.dart`

### Routing
- **go_router** (v17.1.0): Declarative routing with StatefulShellRoute.indexedStack
- Router configuration in `lib/app/router.dart`
- Route constants defined in `lib/app/routes.dart` as an abstract class
- Uses StatefulShellRoute.indexedStack for bottom navigation with state preservation
- Navigation shell is in `lib/presentation/pages/shell_page.dart`
- Settings page is a separate route (not in bottom navigation)

### Project Structure
```
lib/
├── main.dart              # App entry point, ProviderScope wrapper
├── app/
│   ├── app.dart          # Root MaterialApp.router configuration
│   ├── router.dart       # GoRouter configuration with StatefulShellRoute
│   └── routes.dart       # Route path constants (abstract class)
└── presentation/
    ├── pages/
    │   ├── shell_page.dart      # Bottom navigation shell with FAB and drawer
    │   ├── home_page.dart       # Tasks/Todos page with edge swipe gesture
    │   ├── calendar_page.dart   # Calendar view
    │   ├── timer_page.dart      # Timer/pomodoro page
    │   ├── checkin_page.dart    # Check-in page
    │   └── settings_page.dart   # Settings page (separate route)
    └── widgets/
        ├── sidebar_widget.dart        # Drawer sidebar widget
        └── bottom_voice_widget.dart   # Voice input bottom sheet
```

### Key Architecture Patterns

1. **Shell-based Navigation**: The app uses a StatefulShellRoute.indexedStack with 4 branches, meaning all bottom navigation tabs maintain their state when switching between them.

2. **NoTransitionPage**: All tab routes use `NoTransitionPage` for instant navigation without animation transitions. The settings route uses default transitions.

3. **Material Design 3**: The app uses Material Design 3 with a blue-based color scheme seed.

4. **Platform Support**: The app supports all major Flutter platforms (Android, iOS, Web, macOS, Windows, Linux).

5. **Custom Gestures**: The home page implements a custom edge-swipe gesture (left edge) to open the drawer, with responsive drag area width based on device padding (for notches).

### UI Components
- **Bottom Navigation Bar**: 4 tabs with icon-only navigation (labels are empty strings)
  - Tasks (checkbox icon)
  - Calendar (calendar icon)
  - Timer (timer icon)
  - Check-in (location icon)
- **Floating Action Button**: Central FAB that triggers standard action on tap, shows voice input bottom sheet on long press
- **Drawer Navigation**: SideBarWidget with blue header and project list items
- **Edge Swipe Gesture**: Custom gesture detector on home page for drawer access

## Development Notes

- The project uses Dart SDK ^3.10.7
- Code follows standard Flutter/Dart conventions as enforced by flutter_lints
- The app title is "Fomato"
- UI text is primarily in Chinese (page titles: "工作任务", "左侧边栏", etc.)
- Edge swipe gesture on home page has a TODO to refactor into a separate component
- Bottom navigation bar labels are intentionally empty (TODO comment mentions redesigning to remove labels, already done)
