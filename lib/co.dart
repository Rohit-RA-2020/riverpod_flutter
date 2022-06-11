import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class AnimatedBox extends ConsumerWidget {
  const AnimatedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = ref.watch(heightProvider);
    final double width = ref.watch(widthProvider);

    final int red = ref.watch(redProvider);
    final int blue = ref.watch(blueProvider);
    final int green = ref.watch(greenProvider);

    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final double radius = ref.watch(radiusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Height: $height',
            ),
            Text(
              'Width: $width',
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(heightProvider);
                ref.refresh(widthProvider);
                ref.refresh(blueProvider);
                ref.refresh(greenProvider);
                ref.refresh(redProvider);
              },
              icon: const Icon(Icons.restore))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Color.fromARGB(255, red, green, blue),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(heightProvider.notifier).state =
                Random().nextInt(maxHeight.toInt()).toDouble();
            ref.read(widthProvider.notifier).state =
                Random().nextInt(maxWidth.toInt()).toDouble();

            ref.read(redProvider.notifier).state = Random().nextInt(255);
            ref.read(greenProvider.notifier).state = Random().nextInt(255);
            ref.read(blueProvider.notifier).state = Random().nextInt(255);

            ref.read(radiusProvider.notifier).state =
                Random().nextInt(360).toDouble();
          }),
    );
  }
}
