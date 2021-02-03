import 'package:flutter/material.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Models/Response.dart';
import 'AddPass.dart';

class ReceivedSMS extends StatefulWidget {
  String phoneNumb;

  ReceivedSMS({this.phoneNumb});

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<ReceivedSMS> {
  TextEditingController SentCode = TextEditingController();
  TextEditingController UserName = TextEditingController();

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
                  controller: SentCode,
                  hint: "کد ارسالی را وارد کنید",
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async {
                ResponseModel response = await ProfileService()
                    .AddUserCode(SentCode.text, widget.phoneNumb);
                if (response.isSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addpassword(
                        phoneNumber: widget.phoneNumb,
                      ),
                    ),
                  );
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
                            response.message,
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
