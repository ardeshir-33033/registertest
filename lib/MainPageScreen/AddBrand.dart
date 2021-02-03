import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/Provider/PasajFirstProvider.dart';

class AddBrandpage extends StatefulWidget {
  @override
  _AddBrandpageState createState() => _AddBrandpageState();
}

class _AddBrandpageState extends State<AddBrandpage> {
  TextEditingController CompanyNameController;
  TextEditingController NamayandegiNumberController;
  TextEditingController BrandPersianNameController;
  TextEditingController BrandEnglishNameController;
  TextEditingController CountryController;
  TextEditingController GuaranteeController;
  TextEditingController WebSiteController;

  bool checkedGuarantee = false;

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
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 7.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("تعریف برند جدید:"),
                      SizedBox(height: 5),
                      Divider(
                        height: 1,
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                RegisterTextField(
                    controller: CompanyNameController, hint: "نام شرکت"),
                RegisterTextField(
                    controller: NamayandegiNumberController,
                    hint: "شماره نمایندگی"),
                RegisterTextField(
                    controller: BrandPersianNameController, hint: "نام فارسی"),
                RegisterTextField(
                    controller: BrandEnglishNameController, hint: "نام لاتین"),
                RegisterTextField(
                    controller: CountryController, hint: "کشور سازنده"),
                RegisterTextField(
                    controller: WebSiteController, hint: "وبسایت"),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Consumer<checkBoxGuarantee>(
                        builder: (context, checkBoxGurantee, child) =>
                            GestureDetector(
                          onTap: () {
                            checkedGuarantee = !checkedGuarantee;
                            checkBoxGurantee.changeCheckBox();
                          },
                          child: Image.asset(
                              checkedGuarantee
                                  ? 'assets/images/check1.png'
                                  : 'assets/images/check2.png',
                              height: 30),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 15),
                      child: Container(
                        width: phoneWidth / 1.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text('گارانتی'),
                            Divider(
                              height: 1,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SendDataComponent(
                  title: 'اسکن برند',
                  gestureAdded: () {},
                  pictureAddress: 'assets/images/camera.png',
                ),
                SendDataComponent(
                  title: 'آپلود لیست قطعات',
                  gestureAdded: () {},
                  pictureAddress: 'assets/images/uploadList.png',
                ),
                SendDataComponent(
                  title: 'فایل',
                  gestureAdded: () {},
                  pictureAddress: 'assets/images/fileUpload.png',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 40,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Image.asset('assets/images/SubmitButton.png'))),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class SendDataComponent extends StatelessWidget {
  const SendDataComponent({
    this.title,
    this.gestureAdded,
    this.pictureAddress,
  });

  final String title;
  final String pictureAddress;
  final Function gestureAdded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 7.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              GestureDetector(
                  onTap: () {
                    gestureAdded();
                  },
                  child: Image.asset(
                    pictureAddress,
                    height: 40,
                    width: 30,
                  )),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
