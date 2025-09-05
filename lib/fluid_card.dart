import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FluidCard extends StatefulWidget {
  final LinearGradient gradient;
  final String title;
  final String subtitle;
  final String image;
  final bool showButton;

  const FluidCard({
    super.key,
    required this.gradient,
    required this.title,
    required this.subtitle,
    required this.image,
    this.showButton = false,
  });

  @override
  State<FluidCard> createState() => _FluidCardState();
}

class _FluidCardState extends State<FluidCard> {
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((d) => setState(() {}))..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().millisecondsSinceEpoch / 2000;
    var scaleX = 1.1 + sin(time) * .05;
    var scaleY = 1.1 + cos(time) * .07;
    var offsetY = 20 + cos(time) * 20;

    return Container(
      decoration: BoxDecoration(
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Transform.translate(
              offset: Offset(0, offsetY / 10),
              child: Image.asset(widget.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MarcellusSC',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Lexend',
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  if (widget.showButton) ...[
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Get Started"),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
