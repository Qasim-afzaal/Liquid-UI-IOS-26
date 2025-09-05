# 💧 Liquid Fluid UI - Flutter Package

![Liquid Fluid UI Banner](https://via.placeholder.com/800/0066cc/ffffff?text=Liquid+Fluid+UI+-+Flutter+Package)

A beautiful, interactive Flutter package that creates stunning liquid fluid UI effects without animations. Perfect for adding organic, flowing visual elements to your Flutter applications.

## 🌊 Features

- **Zero Animation Dependency** - Pure mathematical fluid simulation
- **Customizable Fluid Edges** - Control tension, damping, and responsiveness
- **Gesture Responsive** - Reacts naturally to user touch interactions
- **Four Edge Support** - Left, right, top, and bottom fluid edges
- **Performance Optimized** - Efficient rendering without heavy animations

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  liquid_fluid_ui: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## 📖 Basic Usage

```dart
import 'package:liquid_fluid_ui/liquid_fluid_ui.dart';

// Simple fluid container
FluidContainer(
  child: YourWidget(),
  side: Side.left, // or top, right, bottom
)

// Fluid carousel
FluidCarousel(
  children: [
    Page1(),
    Page2(),
    Page3(),
  ],
)
```

## 🎨 Customization

```dart
FluidContainer(
  side: Side.bottom,
  edgeTension: 0.05,     // Control how tight the edge is
  touchTension: 0.2,     // Responsiveness to touch
  damping: 0.85,         // How quickly the fluid settles
  pointCount: 20,        // More points = smoother curve
  maxTouchDistance: 0.2, // How far touch influence extends
  margin: 10.0,          // Visual margin
  child: YourContent(),
)
```

## 🔧 Advanced Implementation

```dart
// Direct access to FluidEdge for custom implementations
final fluidEdge = FluidEdge(
  count: 25,
  side: Side.right,
  edgeTension: 0.01,
  touchTension: 0.1,
);

// Use with CustomClipper
ClipPath(
  clipper: FluidClipper(fluidEdge, margin: 10.0),
  child: YourWidget(),
);

// Manual control
fluidEdge.applyTouchOffset(offset, size);
fluidEdge.tick(duration);
```

## 🧩 Components

### FluidEdge
The core class that manages the fluid simulation points and physics.

### FluidClipper
A CustomClipper implementation that creates the fluid path based on the FluidEdge.

### FluidContainer
A ready-to-use widget with fluid edges on any side.

### FluidCarousel
A swipeable carousel with fluid transition effects between pages.

## 📱 Example App

Check out the example directory for a complete implementation demonstrating:
- All four edge types
- Custom parameter tuning
- Gesture interaction examples
- Performance optimization tips

## 🏗️ Architecture

The package uses a physics-based approach without traditional animations:
1. **Point-based system** - Mathematical representation of fluid points
2. **Physics simulation** - Tension, damping, and touch response calculations
3. **Custom painting** - Efficient path rendering through CustomClipper
4. **Gesture integration** - Direct mapping of touch to fluid deformation

## 🎯 Use Cases

- **Onboarding screens** with fluid transitions
- **Interactive buttons** with liquid feedback
- **Navigation elements** with organic shapes
- **Data visualization** with flowing charts
- **Gaming interfaces** with dynamic elements

## 🔮 Performance Notes

- No AnimationController means less overhead
- Efficient path calculations with O(n) complexity
- Minimal rebuilds through careful state management
- Configurable point count for performance/quality balance

## 🤝 Contributing

We welcome contributions! Please feel free to submit:
- New fluid effects
- Performance improvements
- Additional documentation
- Example implementations

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

Having issues with Liquid Fluid UI?
1. Check the example app for implementation guidance
2. Review the API documentation
3. Open an issue on GitHub with code samples

---

<div align="center">
Crafted with fluid precision in Flutter 💙<br/>
**Bring your UI to life with liquid elegance**
</div>
