import 'package:fomato/presentation/pages/calendar_page.dart';
import 'package:fomato/presentation/pages/checkin_page.dart';
import 'package:fomato/presentation/pages/home_page.dart';
import 'package:fomato/presentation/pages/settings_page.dart';
import 'package:fomato/presentation/pages/shell_page.dart';
import 'package:fomato/presentation/pages/timer_page.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ShellPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          preload: true,
          routes: [
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          preload: true,
          routes: [
            GoRoute(
              path: AppRoutes.calendar,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: CalendarPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          preload: true,
          routes: [
            GoRoute(
              path: AppRoutes.timer,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TimerPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          preload: true,
          routes: [
            GoRoute(
              path: AppRoutes.checkin,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: CheckinPage()),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
