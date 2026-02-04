import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: 将边缘右滑抽离成独立的组件。
    // For devices with notches, the drag area needs to be larger on the side
    // that has the notch. Minimum 20px for non-notch devices.
    final double edgePadding = switch (Directionality.of(context)) {
      TextDirection.rtl => MediaQuery.paddingOf(context).right,
      TextDirection.ltr => MediaQuery.paddingOf(context).left,
    };
    final double dragAreaWidth = max(edgePadding, 40.0);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                // 打开父级 ShellPage 的 drawer
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(FluentIcons.line_horizontal_3_24_regular),
            ),
            title: Text("工作任务"),
            centerTitle: false,
            actions: [
              PopupMenuButton<String>(
                icon: Icon(FluentIcons.more_vertical_24_regular),
                onSelected: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'option1', child: Text('Option 1')),
                  PopupMenuItem(value: 'option2', child: Text('Option 2')),
                ],
              ),
            ],
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          width: dragAreaWidth,
          top: 0.0,
          bottom: 0.0,
          child: GestureDetector(
            onPanUpdate: (details) {
              // Open drawer when swiping right from left edge
              if (details.delta.dx > 8) {
                Scaffold.of(context).openDrawer();
              }
            },
            behavior: HitTestBehavior.translucent,
          ),
        ),
      ],
    );
  }
}
