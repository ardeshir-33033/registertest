import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Models/LoginModel.dart';
import 'package:register/Models/Response.dart';

import 'RecievedSMS.dart';

class NewMobileAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewMobileAccount> {
  TextEditingController mobileNumber = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Container(
                child: RegisterTextField(
                  controller: mobileNumber,
                  hint: "شماره موبایل",
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async {
                ResponseModel Saved = await ProfileService().AddUserPhoneNumber(
                    LoginPhone(phoneNumber: mobileNumber.text));

                if (Saved.isSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceivedSMS(
                                phoneNumb: mobileNumber.text,
                              )));
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
                            Saved.message,
                          ),
                        ],
                      ),
                    ),
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
                }
              },
              color: Color(0xFFDC0909),
              child: Text("ثبت"),
            ),
          ],
        ),
      ),
    );
  }
}
