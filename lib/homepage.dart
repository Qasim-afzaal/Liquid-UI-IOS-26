import 'package:flutter/material.dart';
import 'fluid_card.dart';
import 'fluid_carousel.dart';

class Showcase extends StatefulWidget {
  const Showcase({super.key, required this.title});

  final String title;

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: FluidCarousel(
          children: <Widget>[
            FluidCard(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              title: "Start Your Day \nwith Peaceful Mornings",
              subtitle: "Wake up refreshed with calming sounds designed to ease you into the day.",
              image: 'images/Illustration-Red.png',
            ),
            FluidCard(
              gradient: const LinearGradient(
                colors: [Color(0xFFF7971E), Color(0xFFFFD200)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              title: "Refresh Your Mind \nwith Guided Breathing",
              subtitle: "Reduce stress and boost focus with science-backed breathing techniques.",
              image: 'images/Illustration-Yellow.png',
            ),
            FluidCard(
              gradient: const LinearGradient(
                colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              title: "Sleep Soundly \nwith Soothing Stories",
              subtitle: "Drift into deep sleep with relaxing bedtime stories and mindfulness exercises.",
              image: 'images/Illustration-Blue.png',
              showButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
