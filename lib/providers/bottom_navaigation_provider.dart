import 'package:riverpod/riverpod.dart';

class BottomNavigatorProvider extends StateNotifier<int> {
  BottomNavigatorProvider() : super(0);

  void changeCurrentIndex(int index) {
    state = index;
  }
}

final bottomNavigatorProvider =
    StateNotifierProvider<BottomNavigatorProvider, int>(
        (ref) => BottomNavigatorProvider());
