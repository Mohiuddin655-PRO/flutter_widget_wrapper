library flutter_widget_wrapper;

import 'package:flutter/material.dart';

class WidgetWrapper extends StatefulWidget {
  final Size? defaultSize;
  final Widget Function(BuildContext context, Size size) wrap;

  const WidgetWrapper({
    super.key,
    this.defaultSize,
    required this.wrap,
  });

  @override
  State<WidgetWrapper> createState() => _WidgetWrapperState();
}

class _WidgetWrapperState extends State<WidgetWrapper> {
  final GlobalKey _key = GlobalKey();

  Size? size;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onMeasureSize);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetWrapper oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(_onMeasureSize);
    super.didUpdateWidget(oldWidget);
  }

  void _onMeasureSize(Duration duration) {
    final rb = _key.currentContext?.findRenderObject() as RenderBox?;
    setState(() => size = rb?.size);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: _key,
      builder: (_) => widget.wrap(_, size ?? widget.defaultSize ?? Size.zero),
    );
  }
}
