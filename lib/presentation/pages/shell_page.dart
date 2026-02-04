import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fomato/presentation/widgets/bottom_voice_widget.dart';
import 'package:fomato/presentation/widgets/sidebar_widget.dart';
import 'package:go_router/go_router.dart';

class ShellPage extends ConsumerWidget {
  const ShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // 是否在已选中分支上点击时导航回该分支的根路由
      // 类似于 Android 的底部导航行为
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      drawer: SideBarWidget(),
      // TODO: Redesign the bottom navigation bar to remove the label.
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(FluentIcons.checkmark_square_24_regular),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.calendar_date_24_regular),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.clock_alarm_24_regular),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.drink_coffee_24_regular),
            label: '',
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomVoiceWidget(),
          );
        },
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(FluentIcons.add_24_regular),
        ),
      ),
    );
  }
}
