import 'package:flutter/cupertino.dart';

class TokenProvider extends ChangeNotifier{
  static String token;

  setToken(String _t){
    token = _t;
  }

  String getToken(){
    return token;
  }
}