import 'package:flutter_riverpod/flutter_riverpod.dart';

final heightProvider = StateProvider.autoDispose((ref) => 100.0);
final widthProvider = StateProvider.autoDispose((ref) => 100.0);

final redProvider = StateProvider.autoDispose((ref) => 255);
final blueProvider = StateProvider.autoDispose((ref) => 255);
final greenProvider = StateProvider.autoDispose((ref) => 255);

final radiusProvider = StateProvider.autoDispose((ref) => 0.0);