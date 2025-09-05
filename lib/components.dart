import 'dart:math';
import 'package:flutter/widgets.dart';

class SunAndMoon extends StatefulWidget {
  final bool? isDragComplete;
  final List<String> assetPaths;
  final int index;

  const SunAndMoon({
    super.key,
    this.isDragComplete = false,
    this.assetPaths = const [
      'images/Sun-Yellow.png',
      'images/Sun-Red.png',
      'images/Moon-Crescent.png',
    ],
    required this.index,
  });

  @override
  State<StatefulWidget> createState() => _SunAndMoonState();
}

class _SunAndMoonState extends State<SunAndMoon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  int rotationRadius = 300;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController.unbounded(vsync: this);
    _rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDragComplete = widget.isDragComplete ?? false;
    if (_currentIndex != widget.index) {
      _currentIndex = widget.index;
      _animationController
        ..reset()
        ..animateTo(1,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut);
    }
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        return _buildSunMoonTransition();
      },
    );
  }

  Widget _buildSunMoonTransition() {
    double angle = _rotationAnimation.value * (pi / 2);
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildPositionedImage(widget.index % widget.assetPaths.length, angle),
        _buildPositionedImage(
            (widget.index + 1) % widget.assetPaths.length, angle - pi / 2),
      ],
    );
  }

  Widget _buildPositionedImage(int index, double angle) {
    return Positioned(
      top: cos(angle) * rotationRadius,
      left: sin(angle) * rotationRadius,
      child: Image.asset(
        widget.assetPaths[index],
        height: 100,
        width: 100,
      ),
    );
  }
}
