import 'package:flutter/widgets.dart';

class ScrollPositionProvider extends ChangeNotifier {
  bool isScrolledToTop = true;

  bool getIsScrolledToTop() => isScrolledToTop;

  updateFlag(bool flag) {
    print("update called with " + flag.toString());
    isScrolledToTop = flag;
    notifyListeners();
  }
}
