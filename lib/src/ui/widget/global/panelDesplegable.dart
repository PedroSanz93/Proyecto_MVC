import 'package:flutter/material.dart';

class CustomSlidingPanel extends StatefulWidget {
  final Widget panel;
  final Widget body;
  final double minHeight;
  final double maxHeight;

  const CustomSlidingPanel({
    Key? key,
    required this.panel,
    required this.body,
    this.minHeight = 30,
    this.maxHeight = 300,
  }) : super(key: key);

  @override
  _CustomSlidingPanelState createState() => _CustomSlidingPanelState();
}

class _CustomSlidingPanelState extends State<CustomSlidingPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _currentHeight = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.body,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                _currentHeight -= details.delta.dy;
                if (_currentHeight < widget.minHeight) {
                  _currentHeight = widget.minHeight;
                } else if (_currentHeight > widget.maxHeight) {
                  _currentHeight = widget.maxHeight;
                }
              });
            },
            onVerticalDragEnd: (_) {
              if (_currentHeight > widget.minHeight &&
                  _currentHeight < widget.maxHeight) {
                if (_currentHeight > widget.maxHeight / 2) {
                  _controller.animateTo(widget.maxHeight);
                } else {
                  _controller.animateTo(widget.minHeight);
                }
              }
            },
            child: Container(
              height: _currentHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentHeight == widget.minHeight
                            ? _controller.animateTo(widget.maxHeight)
                            : _controller.animateTo(widget.minHeight);
                      });
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: Icon(
                        _currentHeight == widget.minHeight
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: widget.panel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
