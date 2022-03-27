import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/features/home_player/view_model/home_player_view_model.dart';

class InheritedMedia extends InheritedWidget {
  final HomePlayerViewModel viewModel;

  const InheritedMedia(
      {Key? key, required Widget child, required this.viewModel})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static InheritedMedia of(BuildContext context) {
    final InheritedMedia? widget =
    context.dependOnInheritedWidgetOfExactType<InheritedMedia>();
    assert(widget != null, 'No InheritedMedia found in context');
    return widget!;
  }
}
