import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Models/GoogleAuth.dart';
import 'package:register/Models/LoginModel.dart';
import 'file:///C:/flutter/register/RegisterPT2/V2/lib/MainPageScreen/PasajNew.dart';
import 'package:register/Provider/ProviderServices.dart';
import 'package:register/pasajtabaghewidget.dart';
import '../TestPasaj.dart';
import 'RedSmallCheckBox.dart';
import 'UserPassPages/ForgetPassword.dart';
import 'UserPassPages/NewAccountMobile.dart';

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

  Future initialize() async {
    await ProfileService().initialization();
    // await RegisterBusiness().initialDataAsync();
  }

  @override
  void initState() {
    super.initState();
    initialize().then((value) async {
      auto = ProfileService().autoLoginAllow();

      setState(() {
        vis = true;
      });

      if (auto) {
        // setState(() {
        if (ProfileService().getUserData().userName != null) {
          userName.text = ProfileService().getUserData().userName;
          password.text = ProfileService().getUserData().password;
        }
        // });

        var user = await ProfileService().login(
          LoginModel(
            password: password.text,
            userName: userName.text,
          ),
        );
        if (user != null) {
          setState(() {

            AutoLoginCheck().value = true;
          });
          // await ProfileService().getUserByUsername(userName.text);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PasajNew()));
        }
      }
    });
  }

  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '170054889137-0m0e963is6gmsjjurkqu6niga773l83h.apps.googleusercontent.com');

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/Background.png",
                )),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.4,
                ),
                RegisterTextField(
                  controller: userName,
                  hint: "نام کاربری",
                ),
                RegisterTextField(
                  controller: password,
                  hint: "رمز عبور",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 20),
                      child: GestureDetector(
                        child: Text(
                          "فراموشی رمز",
                          style: TextStyle(fontSize: 9),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 4),
                      child: Consumer<AutoLoginCheck>(
                        builder: (context, AutoLog, child) => Container(
                          width: MediaQuery.of(context).size.width / 2.98,
                          child: CheckboxListTile(
                            dense: true,
                            title: Text(
                              "ورود خودکار",
                              style: TextStyle(fontSize: 9),
                            ),
                            value: AutoLog.value,
                            onChanged: (value) {
                              AutoLog.checkLoginVal(value);
                              ProfileService()
                                  .saveAutoLoginDataLocaly(AutoLog.value);
                              ProfileService().loadAutoLoginDataLocaly();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Visibility(
                      visible: vis,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red[800],
                        ),
                        backgroundColor: Color(0xFF2C2C2C),
                      )),
                ),
                SizedBox(
                  height: vis ? phoneheight / 15 : phoneheight / 9,
                ),
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Color(0xFFDC0909),
                    child: Text(
                      "ورود",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
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
                        // await ProfileService().getUserByUsername(userName.text);
                        if (user != null) {
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasajNew()));
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
                      } catch (e) {}
                      setState(() {
                        vis = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage(
                    "assets/images/Artboard1.png",
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      LoginSignIn();
                    },
                    child: Text('ورود با حساب گوگل',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: phoneheight / 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ایجاد حساب کاربری',
                      style: TextStyle(fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewMobileAccount()));
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(right:4.0),
                        child: Text(
                          'جدید',
                          style: TextStyle(color: Color(0xFFDC0909) , fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void LoginSignIn() async {
    await googleSignIn.signOut();

    GoogleSignInAccount GoogleUser = await googleSignIn.signIn();
    GoogleAuth googleAuth;

    if (GoogleUser == null) {
      print("failed");
    } else {
      googleAuth = ProfileService().GoogleSignToPost(GoogleUser);
      await ProfileService().GoogleLogIn(googleAuth);
      ////RegisterBusiness().initialDataAsync();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PasajNew()));
    }
  }
}
