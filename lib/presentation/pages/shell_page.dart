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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(milliseconds: 300),
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: [
            NavigationDestination(
              icon: _BouncingIcon(
                icon: FluentIcons.checkmark_square_24_regular,
                isSelected: navigationShell.currentIndex == 0,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: _BouncingIcon(
                icon: FluentIcons.calendar_date_24_regular,
                isSelected: navigationShell.currentIndex == 1,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: _BouncingIcon(
                icon: FluentIcons.clock_alarm_24_regular,
                isSelected: navigationShell.currentIndex == 2,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: _BouncingIcon(
                icon: FluentIcons.drink_coffee_24_regular,
                isSelected: navigationShell.currentIndex == 3,
              ),
              label: '',
            ),
          ],
        ),
      ),
      // 在 ShellPage 可以确保弹出时覆盖导航栏
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

class _BouncingIcon extends StatelessWidget {
  const _BouncingIcon({required this.icon, required this.isSelected});

  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.2 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutBack,
      child: Icon(
        icon,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }
}
