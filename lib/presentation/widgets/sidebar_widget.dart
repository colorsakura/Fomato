import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideBarWidget extends ConsumerWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ListTile(title: Text('项目1')),
                ListTile(title: Text('项目2')),
              ],
            ),
            Positioned(
              height: 48,
              left: 20,
              bottom: 20,
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(FluentIcons.add_square_24_regular),
                        const SizedBox(width: 10),
                        Text('添加'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 128),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FluentIcons.settings_24_regular),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
