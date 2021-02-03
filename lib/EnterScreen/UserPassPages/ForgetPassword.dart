import 'package:flutter/material.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Models/Response.dart';
import 'package:register/Service/EndPointService.dart';
import 'package:register/Service/ResetPasswordService.dart';

import 'RecievedSMS.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<ForgetPassword> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController userName = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Container(
                child: RegisterTextField(
                  controller: userName,
                  hint: "نام کاربری را وارد کنید",
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async {
                ResponseModel _response = await ResetPassword()
                    .addToQuery("userName", userName.text)
                    .httpDelete(
                      HeaderEnum.EmptyHeaderEnum,
                      ResponseEnum.ResponseModelEnum,
                    );
                if (_response.isSuccess) {
                  final snackBar = SnackBar(
                    content: Container(
                      height: 52.0,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "عملیات موفقیت آمیز",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Text(
                            "رمز عبور به شماره همراه شما ارسال شد",

                          ),
                        ],
                      ),
                    ),
                  );
                  _scaffoldKey.currentState
                      .showSnackBar(snackBar);
                }
              },
              color: Color(0xFFDC0909),
              child: Text("بازیابی"),
            ),
          ],
        ),
      ),
    );
  }
}
