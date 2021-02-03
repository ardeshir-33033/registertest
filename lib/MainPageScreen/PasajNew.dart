import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/Component/NewRegisterTextField.dart';
import 'package:register/pasajtabaghewidget.dart';

import '../ApiModels/Brand.dart';
import '../Business/RegisterBusiness.dart';
import '../Provider/PasajFirstProvider.dart';

class PasajNew extends StatefulWidget {
  @override
  _PasajNewState createState() => _PasajNewState();
}

class _PasajNewState extends State<PasajNew>
    with SingleTickerProviderStateMixin {
  TextEditingController controllerName;
  TextEditingController controllerFamilyName;

  List<Brand> BrandsList = List<Brand>();
  List<String> SelectedBrandList = List<String>();

  bool TextFieldVisible = true;
  bool RasteVisible = true;
  bool MogheiatVisible = true;
  bool MogheiatListVisible = false;
  bool RasteListVisible = false;
  bool KhodroVisible = true;
  bool KhodroListVisible = false;
  bool ActivityVisible = true;
  bool ActivityListVisible = false;
  bool ImportingBrandVisible = true;
  bool ImportingBrandListVisible = false;

  double TextFieldOpacitylevel = 1.0;
  double MogheiatOpacity = 1.0;
  double RasteOpacity = 1.0;
  double KhodroOpacity = 1.0;
  double ActivityOpacity = 1.0;
  double ImportingOpacity = 1.0;

  bool selected1 = false;

  List<String> MogheiatList = [
    'چراغ برق',
    'شهرستان',
    'تعمیرگاه',
    'اطراف تهران'
  ];
  List<String> MogheiatListSelected = [];

  List<String> RasteList = ["سنگین", "نیمه سنگین", "تخصصی", "سبک"];
  List<String> RasteListSelected = [];

  List<String> KhodroList = [
    "پژو",
    "پراید",
    "ایسوزو",
    "asddss",
  ];
  List<String> KhodroListSelected = [];

  List<String> ActivityList = [
    'وارد کننده',
    'تولید کننده',
    'شخصی',
    'تخصصی',
    'نماینده انحصاری',
  ];
  List<String> ActivityListSelected = [];

  void changeMogheiatOpacity() {
    setState(() {
      TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
      RasteOpacity = RasteOpacity == 0 ? 1.0 : 0.0;
      KhodroOpacity = KhodroOpacity == 0 ? 1.0 : 0.0;
      ActivityOpacity = ActivityOpacity == 0 ? 1.0 : 0.0;
      ImportingOpacity = ImportingOpacity == 0 ? 1.0 : 0.0;
    });
  }

  void changeRasteOpacity() {
    setState(() {
      MogheiatOpacity = MogheiatOpacity == 0 ? 1.0 : 0.0;
      TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
      KhodroOpacity = KhodroOpacity == 0 ? 1.0 : 0.0;
      ActivityOpacity = ActivityOpacity == 0 ? 1.0 : 0.0;
      ImportingOpacity = ImportingOpacity == 0 ? 1.0 : 0.0;
    });
  }

  void changeKhodroOpacity() {
    setState(() {
      MogheiatOpacity = MogheiatOpacity == 0 ? 1.0 : 0.0;
      TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
      RasteOpacity = RasteOpacity == 0 ? 1.0 : 0.0;
      ActivityOpacity = ActivityOpacity == 0 ? 1.0 : 0.0;
      ImportingOpacity = ImportingOpacity == 0 ? 1.0 : 0.0;
    });
  }

  void changeActivityOpacity() {
    setState(() {
      MogheiatOpacity = MogheiatOpacity == 0 ? 1.0 : 0.0;
      TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
      RasteOpacity = RasteOpacity == 0 ? 1.0 : 0.0;
      KhodroOpacity = KhodroOpacity == 0 ? 1.0 : 0.0;
      ImportingOpacity = ImportingOpacity == 0 ? 1.0 : 0.0;
    });
  }

  void changeImportBrandOpacity() {
    setState(() {
      MogheiatOpacity = MogheiatOpacity == 0 ? 1.0 : 0.0;
      TextFieldOpacitylevel = TextFieldOpacitylevel == 0 ? 1.0 : 0.0;
      RasteOpacity = RasteOpacity == 0 ? 1.0 : 0.0;
      KhodroOpacity = KhodroOpacity == 0 ? 1.0 : 0.0;
      ActivityOpacity = ActivityOpacity == 0 ? 1.0 : 0.0;
    });
  }

  void MogheiatVisibleChange() {
    setState(() {
      TextFieldVisible = !TextFieldVisible;
      RasteVisible = !RasteVisible;
      MogheiatListVisible = !MogheiatListVisible;
      KhodroVisible = !KhodroVisible;
      ActivityVisible = !ActivityVisible;
    });
  }

  void RasteVisibleChange() {
    setState(() {
      MogheiatVisible = !MogheiatVisible;
      TextFieldVisible = !TextFieldVisible;
      RasteListVisible = !RasteListVisible;
      KhodroVisible = !KhodroVisible;
      ActivityVisible = !ActivityVisible;
    });
  }

  void KhodroVisibleChange() {
    setState(() {
      MogheiatVisible = !MogheiatVisible;
      TextFieldVisible = !TextFieldVisible;
      RasteVisible = !RasteVisible;
      KhodroListVisible = !KhodroListVisible;
      ActivityVisible = !ActivityVisible;
    });
  }

  void ActivityVisibleChange() {
    setState(() {
      MogheiatVisible = !MogheiatVisible;
      TextFieldVisible = !TextFieldVisible;
      RasteVisible = !RasteVisible;
      KhodroVisible = !KhodroVisible;
      ActivityListVisible = !ActivityListVisible;
    });
  }

  void ImportVisibleChange() {
    setState(() {
      MogheiatVisible = !MogheiatVisible;
      TextFieldVisible = !TextFieldVisible;
      RasteVisible = !RasteVisible;
      KhodroVisible = !KhodroVisible;
      ActivityVisible = !ActivityVisible;
      ImportingBrandListVisible = !ImportingBrandListVisible;
    });
  }

  // void changeAlignment(){
  //   setState(() {
  //     _alignment = _alignment == Alignment.bottomCenter ? Alignment.topCenter : Alignment.bottomCenter;
  //   });
  // }

  Future Waiting(int val) async {
    await Future.delayed(Duration(seconds: val));
  }

  @override
  void initState() {
    super.initState();

    if (RegisterBusiness()
        .getBrands()
        .length == 0) {
      RegisterBusiness().initialDataAsync().then((value) {
        ////BrandsList = RegisterBusiness().getBrands();
        setState(() {});
      });
    } else {
      ////BrandsList = RegisterBusiness().getBrands();
    }
  }

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery
        .of(context)
        .size
        .width;
    double phoneheight = MediaQuery
        .of(context)
        .size
        .height;
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
                  height: phoneheight,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: phoneheight / 3,
                      // ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Visibility(
                        visible: TextFieldVisible,
                        child: AnimatedOpacity(
                          opacity: TextFieldOpacitylevel,
                          duration: Duration(milliseconds: 500),
                          child: RegisterTextField(
                              controller: controllerName, hint: "نام"),
                        ),
                      ),
                      Visibility(
                        visible: TextFieldVisible,
                        child: AnimatedOpacity(
                          opacity: TextFieldOpacitylevel,
                          duration: Duration(milliseconds: 500),
                          child: RegisterTextField(
                              controller: controllerFamilyName,
                              hint: "نام خانوادگی"),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: MogheiatVisible,
                                child: AnimatedOpacity(
                                  opacity: MogheiatOpacity,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // selected1 = !selected1;
                                          if (RasteVisible == true) {
                                            changeMogheiatOpacity();
                                            Waiting(1).then((value) {
                                              MogheiatVisibleChange();
                                              // TextFieldVisible = !TextFieldVisible;
                                            });
                                          }
                                          // } else {
                                          //   MogheiatVisibleChange();
                                          //   Waiting(1).then((value) {
                                          //     changeMogheiatOpacity();
                                          //   });
                                          // }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 40),
                                            width: phoneWidth / 1.2,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('موقعیت:'),
                                                Visibility(
                                                  visible: !MogheiatListVisible,
                                                  child: DisiredLists(
                                                    phoneWidth: phoneWidth,
                                                    ListSelected:
                                                    MogheiatListSelected,
                                                    divide: 2.2,
                                                  ),
                                                ),
                                                MogheiatListSelected.length > 2
                                                    ? Visibility(
                                                  visible:
                                                  !MogheiatListVisible,
                                                  child: Icon(
                                                    Icons.more_horiz,
                                                    size: 20,
                                                  ),
                                                )
                                                    : Container()
                                              ],
                                            )),
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: MogheiatListVisible,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height / 3,
                                      child: ListView.builder(
                                          itemCount: MogheiatList.length,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Consumer<PlaceCheckBoxProvider>(
                                                    builder: (context,
                                                        ImageProvider, child) =>
                                                        GestureDetector(
                                                          onTap: () {
                                                            MogheiatListSelected
                                                                .contains(
                                                                MogheiatList[
                                                                index])
                                                                ? MogheiatListSelected
                                                                .remove(
                                                                MogheiatList[
                                                                index])
                                                                : MogheiatListSelected
                                                                .add(
                                                                MogheiatList[
                                                                index]);
                                                            ImageProvider
                                                                .changeCheckBox();
                                                          },
                                                          child: Image.asset(
                                                            MogheiatListSelected
                                                                .contains(
                                                                MogheiatList[
                                                                index])
                                                                ? 'assets/images/check1.png'
                                                                : 'assets/images/check2.png',
                                                            width: 40,
                                                            height: 40,
                                                          ),
                                                        )),
                                                Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Text(
                                                      MogheiatList[index]),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: phoneheight / 2.5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        MogheiatVisibleChange();
                                        Waiting(1).then((value) {
                                          changeMogheiatOpacity();
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/ContinueButton.png',
                                        height: phoneheight / 20,
                                        width: phoneWidth / 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: RasteVisible,
                                child: AnimatedOpacity(
                                  opacity: RasteOpacity,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // selected1 = !selected1;
                                          if (MogheiatVisible == true) {
                                            changeRasteOpacity();
                                            Waiting(1).then((value) {
                                              RasteVisibleChange();
                                              // TextFieldVisible = !TextFieldVisible;
                                            });
                                          }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 40),
                                            width: phoneWidth / 1.2,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('رسته:'),
                                                Visibility(
                                                  visible: !RasteListVisible,
                                                  child: DisiredLists(
                                                    phoneWidth: phoneWidth,
                                                    ListSelected: RasteListSelected,
                                                    divide: 2.0,
                                                  ),
                                                ),
                                                RasteListSelected.length > 2
                                                    ? Visibility(
                                                  visible: !RasteListVisible,
                                                  child: Icon(
                                                    Icons.more_horiz,
                                                    size: 20,
                                                  ),
                                                )
                                                    : Container()
                                              ],
                                            )),
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: RasteListVisible,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height / 3,
                                      child: ListView.builder(
                                          itemCount: RasteList.length,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Consumer<PlaceCheckBoxProvider>(
                                                  builder: (context,
                                                      ImageProvider,
                                                      child) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          RasteListSelected
                                                              .contains(
                                                              RasteList[index])
                                                              ? RasteListSelected
                                                              .remove(
                                                              RasteList[index])
                                                              : RasteListSelected
                                                              .add(
                                                              RasteList[index]);
                                                          ImageProvider
                                                              .changeCheckBox();
                                                        },
                                                        child: Image.asset(
                                                          RasteListSelected
                                                              .contains(
                                                              RasteList[index])
                                                              ? 'assets/images/check1.png'
                                                              : 'assets/images/check2.png',
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Text(RasteList[index]),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: phoneheight / 2.5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        {
                                          RasteVisibleChange();
                                          Waiting(1).then((value) {
                                            changeRasteOpacity();
                                          });
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/images/ContinueButton.png',
                                        height: phoneheight / 20,
                                        width: phoneWidth / 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: KhodroVisible,
                                child: AnimatedOpacity(
                                  opacity: KhodroOpacity,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // selected1 = !selected1;
                                          if (MogheiatVisible == true) {
                                            changeKhodroOpacity();
                                            Waiting(1).then((value) {
                                              KhodroVisibleChange();
                                              // TextFieldVisible = !TextFieldVisible;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 40.0),
                                          child: Container(
                                              width: phoneWidth / 1.2,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('خودرو:'),
                                                  Visibility(
                                                    visible: !KhodroListVisible,
                                                    child: DisiredLists(
                                                      phoneWidth: phoneWidth,
                                                      ListSelected:
                                                      KhodroListSelected,
                                                      divide: 2.0,
                                                    ),
                                                  ),
                                                  KhodroListSelected.length > 2
                                                      ? Visibility(
                                                    visible:
                                                    !KhodroListVisible,
                                                    child: Icon(
                                                      Icons.more_horiz,
                                                      size: 20,
                                                    ),
                                                  )
                                                      : Container()
                                                ],
                                              )),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: KhodroListVisible,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height / 3,
                                      child: ListView.builder(
                                          itemCount: KhodroList.length,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Consumer<PlaceCheckBoxProvider>(
                                                  builder: (context,
                                                      ImageProvider,
                                                      child) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          KhodroListSelected
                                                              .contains(
                                                              KhodroList[index])
                                                              ? KhodroListSelected
                                                              .remove(
                                                              KhodroList[index])
                                                              : KhodroListSelected
                                                              .add(
                                                              KhodroList[index]);
                                                          ImageProvider
                                                              .changeCheckBox();
                                                        },
                                                        child: Image.asset(
                                                          KhodroListSelected
                                                              .contains(
                                                              KhodroList[index])
                                                              ? 'assets/images/check1.png'
                                                              : 'assets/images/check2.png',
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Text(
                                                      KhodroList[index]),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: phoneheight / 2.5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        {
                                          KhodroVisibleChange();
                                          Waiting(1).then((value) {
                                            changeKhodroOpacity();
                                          });
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/images/ContinueButton.png',
                                        height: phoneheight / 20,
                                        width: phoneWidth / 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: ActivityVisible,
                                child: AnimatedOpacity(
                                  opacity: ActivityOpacity,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // selected1 = !selected1;
                                          if (MogheiatVisible == true) {
                                            changeActivityOpacity();
                                            Waiting(1).then((value) {
                                              ActivityVisibleChange();
                                              // TextFieldVisible = !TextFieldVisible;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 40.0),
                                          child: Container(
                                              width: phoneWidth / 1.2,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('نوع فعالیت:'),
                                                  Visibility(
                                                    visible: !ActivityListVisible,
                                                    child: DisiredLists(
                                                      phoneWidth: phoneWidth,
                                                      ListSelected:
                                                      ActivityListSelected,
                                                      divide: 2.5,
                                                    ),
                                                  ),
                                                  ActivityListSelected.length >
                                                      2
                                                      ? Visibility(
                                                    visible:
                                                    !ActivityListVisible,
                                                    child: Icon(
                                                      Icons.more_horiz,
                                                      size: 20,
                                                    ),
                                                  )
                                                      : Container()
                                                ],
                                              )),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: ActivityListVisible,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height / 3,
                                      child: ListView.builder(
                                          itemCount: ActivityList.length,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Consumer<PlaceCheckBoxProvider>(
                                                  builder: (context,
                                                      ImageProvider,
                                                      child) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          ActivityListSelected
                                                              .contains(
                                                              ActivityList[index])
                                                              ? ActivityListSelected
                                                              .remove(
                                                              ActivityList[
                                                              index])
                                                              : ActivityListSelected
                                                              .add(ActivityList[
                                                          index]);
                                                          ImageProvider
                                                              .changeCheckBox();
                                                        },
                                                        child: Image.asset(
                                                          ActivityListSelected
                                                              .contains(
                                                              ActivityList[index])
                                                              ? 'assets/images/check1.png'
                                                              : 'assets/images/check2.png',
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Text(
                                                      ActivityList[index]),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: phoneheight / 2.5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        {
                                          ActivityVisibleChange();
                                          Waiting(1).then((value) {
                                            changeActivityOpacity();
                                          });
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/images/ContinueButton.png',
                                        height: phoneheight / 20,
                                        width: phoneWidth / 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: ImportingBrandVisible,
                                child: AnimatedOpacity(
                                  opacity: ImportingOpacity,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // selected1 = !selected1;
                                          if (MogheiatVisible == true) {
                                            changeImportBrandOpacity();
                                            Waiting(1).then((value) {
                                              ImportVisibleChange();
                                              // TextFieldVisible = !TextFieldVisible;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 35.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                          'وارد کننده برندهای :'),
                                                      Visibility(
                                                        visible:
                                                        !ImportingBrandListVisible,
                                                        child: DisiredLists(
                                                          phoneWidth: phoneWidth,
                                                          ListSelected:
                                                          SelectedBrandList,
                                                          divide:
                                                          ImportingBrandListVisible
                                                              ? 3.5
                                                              : 2.9,
                                                        ),
                                                      ),
                                                      SelectedBrandList.length >
                                                          2
                                                          ? Visibility(
                                                        visible:
                                                        !ImportingBrandListVisible,
                                                        child: Icon(
                                                          Icons.more_horiz,
                                                          size: 20,
                                                        ),
                                                      )
                                                          : Container()
                                                    ],
                                                  )),
                                              Visibility(
                                                  visible:
                                                  ImportingBrandListVisible,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/AddBrandPage');
                                                      },
                                                      child: Icon(Icons.add))),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: ImportingBrandListVisible,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height / 1.3,
                                      child: ListView.builder(
                                          itemCount: BrandsList.length,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return Row(
                                              children: [
                                                Consumer<PlaceCheckBoxProvider>(
                                                  builder: (context,
                                                      ImageProvider,
                                                      child) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          SelectedBrandList
                                                              .contains(
                                                              BrandsList[index]
                                                                  .persianName)
                                                              ? SelectedBrandList
                                                              .remove(
                                                              BrandsList[index]
                                                                  .persianName)
                                                              : SelectedBrandList
                                                              .add(
                                                              BrandsList[index]
                                                                  .persianName);
                                                          ImageProvider
                                                              .changeCheckBox();
                                                        },
                                                        child: Image.asset(
                                                          SelectedBrandList
                                                              .contains(
                                                              BrandsList[index]
                                                                  .persianName)
                                                              ? 'assets/images/check1.png'
                                                              : 'assets/images/check2.png',
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        vertical: 20.0),
                                                    child: Container(
                                                      width: phoneWidth / 1.7,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .only(
                                                            right: 10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text(
                                                                BrandsList[index]
                                                                    .persianName),
                                                            Text(
                                                                BrandsList[index]
                                                                    .madeInContry !=
                                                                    null
                                                                    ? BrandsList[index]
                                                                    .madeInContry
                                                                    : ''),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        {
                                          ImportVisibleChange();
                                          Waiting(1).then((value) {
                                            changeImportBrandOpacity();
                                          });
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/images/ContinueButton.png',
                                        height: phoneheight / 20,
                                        width: phoneWidth / 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !RasteListVisible &&
                                    !MogheiatListVisible &&
                                    !KhodroListVisible &&
                                    !ActivityListVisible &&
                                    !ImportingBrandListVisible,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: phoneheight / 5,
                                    ),
                                    Center(
                                      child: Container(
                                          width: phoneWidth / 3,
                                          height: phoneheight / 20,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/PasajSecondPage');
                                              // Navigator.push(
                                              //     context, MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         PasajTabagheWidget()));
                                            },
                                            child: Image.asset(
                                              'assets/images/SubmitButton.png',
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class DisiredLists extends StatelessWidget {
  const DisiredLists({
    Key key,
    @required this.phoneWidth,
    @required this.ListSelected,
    this.divide,
  }) : super(key: key);

  final double phoneWidth;
  final List<String> ListSelected;
  final double divide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: phoneWidth / divide,
      height: 40,
      child: ListView.builder(
          itemCount: ListSelected.length > 2 ? 2 : ListSelected.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(ListSelected[index]),
              ),
            );
          }),
    );
  }
}
