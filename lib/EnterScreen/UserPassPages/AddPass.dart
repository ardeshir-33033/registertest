import 'package:flutter/material.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Models/LoginModel.dart';

import '../../pasajtabaghewidget.dart';

class Addpassword extends StatefulWidget {
  String phoneNumber;
  Addpassword({this.phoneNumber});
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<Addpassword> {
  TextEditingController NewPassword = TextEditingController();
  TextEditingController NewPassAccount = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/Background.png",
              )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              child: Container(
                child: RegisterTextField(
                  controller: NewPassword,
                  hint: "رمز عبور جدید",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                child: RegisterTextField(
                  controller: NewPassAccount,
                  hint: "تکرار رمز عبور",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: ()async {
                  if(NewPassAccount.text == NewPassword.text){
                    await ProfileService().AddnewUser(widget.phoneNumber, NewPassword.text);
                    var user = await ProfileService().login(
                      LoginModel(
                        password: NewPassword.text,
                        userName: widget.phoneNumber,
                      ),
                    );
                    if (user != null) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasajTabagheWidget()));
                    } else {
                      final snackBar = SnackBar(
                        content: Container(
                          height: 52.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ورود ناموفق",
                              ),
                              Text(
                                "لطفا شناسه و رمز کاربری خود را چک کنید",
                              ),
                            ],
                          ),
                        ),
                      );

                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    }
                  }
                },
                color: Color(0xFFDC0909),
                child: Text("ثبت"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
