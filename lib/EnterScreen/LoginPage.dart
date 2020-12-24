import 'package:flutter/material.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Business/RegisterBusiness.dart';
import 'package:register/Models/LoginModel.dart';
import 'package:register/pasajtabaghewidget.dart';
import 'RedButton.dart';
import 'RedSmallCheckBox.dart';
import 'RedSmallCheckBox1.dart';

class QC_LoginPage extends StatefulWidget {
  QC_LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _QC_LoginPageState createState() => _QC_LoginPageState();
}

class _QC_LoginPageState extends State<QC_LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool vis = false;
  bool auto = false;
  Widget autoWidget = REDSmallCheckBox0Widget();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void initState() {
    super.initState();
    RegisterBusiness().initialDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/newbg.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: false,
                child: Container(
                  child: Text(
                    "در حال پردازش",
                    style: TextStyle(
                        //color: CBase().basePrimaryColor,
                        //fontSize: CBase().getTextfontSizeByScreen(),
                        ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                  left: 50.0,
                  right: 50.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, right: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'نام کاربری',
                            style: TextStyle(
                              //fontFamily: CBase().fontFamily,
                              fontSize: 11,
                              //color: CBase().textPrimaryColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                              //fontFamily: CBase().fontFamily,
                              fontSize: 11,
                              //color: CBase().textPrimaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffffffff),
                        border: Border.all(color: Colors.grey[400]
                            //width: CBase().borderPrimarySize,
                            //color: CBase().borderPrimaryColor,
                            ),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x1f000000),
                              offset: Offset(0, 3),
                              blurRadius: 6)
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(),
                        child: TextField(
                          controller: userName,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, right: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'رمز عبور',
                            style: TextStyle(
                              //fontFamily: CBase().fontFamily,
                              fontSize: 11,
                              //color: CBase().textPrimaryColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                              //fontFamily: CBase().fontFamily,
                              fontSize: 11,
                              //color: CBase().textPrimaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            //width: CBase().borderPrimarySize,
                            color: Colors.grey[400]),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x1f000000),
                              offset: Offset(0, 3),
                              blurRadius: 6)
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(),
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FlatButton(
                                  padding: EdgeInsets.only(
                                      top: 0.0, bottom: 35.0, left: 20),
                                  child: Text(
                                    "بازیابی رمز عبور",
                                    style: TextStyle(
                                      //fontFamily: CBase().fontFamily,
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      //color: CBase().textPrimaryColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  highlightColor: Colors.grey[200],
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           QC_ResetPasswordPage()),
                                    // ),
                                  },
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Visibility(
                                  maintainSize: false,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: vis,
                                  child: Container(
                                    child: vis
                                        ? CircularProgressIndicator()
                                        : Text(""),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      bottom: 35.0,
                                      top: 0.0,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          child: Text(
                                            "ورود خودکار",
                                            style: TextStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.0,
                                        ),
                                        autoWidget,
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),

                          GestureDetector(
                            onTap: () async {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             PasajTabagheWidget()));

                              try {
                                setState(() {
                                  vis = true;
                                });

                                var user = await ProfileService().login(
                                  LoginModel(
                                    password: password.text,
                                    userName: userName.text,
                                  ),
                                );

                                await ProfileService()
                                    .getUserByUsername(userName.text);

                                if (user != null) {
                                  //Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PasajTabagheWidget()));
                                } else {
                                  final snackBar = SnackBar(
                                    content: Container(
                                      height: 50.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ورود ناموفق",
                                          ),
                                          Text(
                                            "لطفا شناسه و رمز کاربری خود را چک کنید",
                                            // style: TextStyle(
                                            //    // fontFamily: CBase().fontFamily,
                                            //     fontSize: CBase()
                                            //         .getTextfontSizeByScreen()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                }
                              } catch (e) {}
                              setState(() {
                                vis = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xffeb5151),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 10.0),
                                child: Text(
                                  'ورود',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          FlatButton(
                            padding: EdgeInsets.only(bottom: 35.0, top: 0.0),
                            child: Text(
                              "حساب کاربری ندارم",
                              style: TextStyle(
                                //fontFamily: CBase().fontFamily,
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                //color: CBase().textPrimaryColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            highlightColor: Colors.grey[200],
                            onPressed: () {},
                          ),
                        ],
                        textDirection: TextDirection.rtl,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
