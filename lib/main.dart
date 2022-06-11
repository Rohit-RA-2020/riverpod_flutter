import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'co.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Container App',
      home: HomeWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const AnimatedBox(),
              ),
            );
          },
          child: const Text('Got to page'),
        ),
      ),
    );
  }
}
