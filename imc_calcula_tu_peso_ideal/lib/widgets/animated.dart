import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final double val_datos;

  const AnimatedImage({super.key, required this.val_datos});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation movingRight;

  late double asd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    movingRight = Tween(begin: 0.0, end: widget.val_datos).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AnimatedBuilder(
        animation: controller,
        child: SizedBox(
          height: 10,
          child: Image.asset(
            'assets/arrow.png',
            color: Colors.white,
          ),
        ),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(movingRight.value, 0.0),
            child: child,
          );
        },
      ),
    );
  }
}
