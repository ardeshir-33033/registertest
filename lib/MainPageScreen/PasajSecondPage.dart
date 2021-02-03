import 'package:flutter/material.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Component/PictureAudioRow.dart';
import 'package:register/Component/googleMapComponent.dart';

class PasajSecondPage extends StatefulWidget {
  @override
  _PasajSecondPageState createState() => _PasajSecondPageState();
}

class _PasajSecondPageState extends State<PasajSecondPage> {
  TextEditingController PasajName;
  TextEditingController Address;
  TextEditingController floor;
  TextEditingController StoreName;
  TextEditingController Pelak;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/MainBackground.png",
                  )),
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RegisterTextField(controller: PasajName, hint: "پاساژ"),
                  RegisterTextField(controller: Address, hint: "آدرس"),
                  RegisterTextField(controller: floor, hint: "طبقه"),
                  RegisterTextField(controller: StoreName, hint: "نام فروشگاه"),
                  RegisterTextField(controller: Pelak, hint: "پلاک"),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width / 1.2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: googleMapComponent(
                      OnMyLocationCallback: (my) {
                        // _register.locationLat = my.latitude;
                        // _register.locationLng = my.longitude;
                      },
                      myLocation: true,
                    ),
                  ),
                  Row(
                    children: [
                      PicAudio(
                        ////register: _register,
                        onPictureCallBack: () {
                          setState(() {});
                        },
                      ),
                      // Image.asset('assets/images/camera.png', width: 40,height: 40,),
                      // Image.asset(
                      //   'assets/images/VoiceIcon.png',width: 40,height: 40,
                      // ),
                    ],
                  ),
                  Container(
                    height: phoneheight / 5,
                    width: phoneWidth / 4,
                    child: Image.asset(
                      'assets/images/SubmitButton.png',
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
