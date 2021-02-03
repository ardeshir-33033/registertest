import 'package:flutter/cupertino.dart';

class TextFieldVisibleProvider with ChangeNotifier {
  bool TextFieldVisible = true;

  bool TextVisibleChange() {
    TextFieldVisible = !TextFieldVisible;
    notifyListeners();
  }
}

class TextFieldOpacityProvider with ChangeNotifier {
  double TextFieldOpacitylevel = 1.0;

  void changeTextFieldOpacity() {
    TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
    notifyListeners();
  }
}

class PlaceCheckBoxProvider with ChangeNotifier {

  void changeCheckBox() {
    notifyListeners();
  }
}

class checkBoxGuarantee with ChangeNotifier {

  void changeCheckBox(){
    notifyListeners();
  }
}
