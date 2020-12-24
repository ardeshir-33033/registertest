import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/ApiModels/ApiRegisterModel.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/ApiModels/MalToRegister.dart';
import 'package:register/ApiModels/Mall.dart';
import 'package:register/ApiModels/MallPost.dart';
import 'package:register/Business/RegisterBusiness.dart';
import 'package:register/Models/BrandModel.dart';

class PasajBox extends StatefulWidget {
  Function(Mall result) OnAddMallCallback;

  PasajBox({
    @required this.OnAddMallCallback,
  });

  @override
  _PasajBoxState createState() => _PasajBoxState();
}

class _PasajBoxState extends State<PasajBox> {
  MallToRegister model = MallToRegister();

  //String mallName;
  //String neighborhood;
  //String floorNo;

  String searchText = "";
  List<Mall> selectedMalls = List<Mall>();
  List<Mall> selectMallsList = List<Mall>();
  List<Mall> selectedCheckBoxItems1 = List<Mall>();

  // List<M> selectedItems = List<Brand>();

  ApiRegisterModel _register = ApiRegisterModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (RegisterBusiness().getMalls().length == 0) {
      RegisterBusiness().initialDataAsync().then((value) {
        selectMallsList = RegisterBusiness().getMalls();
        setState(() {});
      });
    } else {
      selectMallsList = RegisterBusiness().getMalls();
    }
  }

  void setSelectedCheckBox1(Mall _b, bool _c) {
    if (_c) {
      var index = selectedCheckBoxItems1
          .indexWhere((element) => element.mallName == _b.mallName);
      if (index < 0) {
        selectedCheckBoxItems1.add(_b);
      }
    } else {
      var index = selectedCheckBoxItems1
          .indexWhere((element) => element.mallName == _b.mallName);
      if (index >= 0) {
        selectedCheckBoxItems1.removeAt(index);
      }
    }
    setState(() {});
  }

  void Search(String _text) {
    if (_text.isEmpty) {
      selectMallsList = RegisterBusiness().getMalls().map((e) => e).toList();
    } else {
      selectMallsList = RegisterBusiness()
          .getMalls()
          .where((element) => element.mallName.contains(_text))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [Center(child: Text('پاساژ'))],
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'نام پاساژ',
                    ),
                    onChanged: (String value) {
                      model.nameOFMall = value;
                    },
                  ),
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'محدوده',
                    ),
                    onChanged: (String value) {
                      model.address = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'تعداد طبقات',
                    ),
                    onChanged: (String value) {
                      model.maxFloorOfMall = value;
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red)),
                color: Color(0xffeb5151),
                onPressed: () async {
                  // _register.malls = selectedMalls
                  //     .map((e) => MallToRegister(
                  //           maxFloorOfMall: e.maxFloor,
                  //           nameOFMall: e.mallName,
                  //           address: e.neighbor,
                  //         ))
                  //     .toList();

                  model.locationOfRegisterId =
                      RegisterBusiness().getSelectedLocation().id;

                  var result =
                      await RegisterBusiness().RegisterMallAsync(model);

                  if (result != null) {
                    Mall ml = Mall(
                      mallName: result.nameOFMall,
                      neighbor: result.address,
                      maxFloor: result.maxFloorOfMall,
                    );
                    RegisterBusiness.malls.add(ml);
                    if (widget.OnAddMallCallback != null) {
                      widget.OnAddMallCallback(ml);
                      Navigator.pop(context);
                    }
                    setState(() {});
                  }

                  // Mall2Register(
                  //       mall: MallPost(
                  //           mallName: e.mallName,
                  //           neighbor: e.neighbor,
                  //           maxFloor: e.maxFloor),
                  //       mallId: e.id,
                  //     ))
                  // .toList();
                },
                textColor: Colors.white,
                child: Text(
                  "ثبت",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 38,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.only(right: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.grey,
                              onChanged: (value) {
                                searchText = value;
                                Search(value);
                              },
                              cursorRadius: Radius.circular(5),
                              //controller: _controller5,
                            ),
                          ),
                          SvgPicture.string(
                            _svg_8sw3lm,
                            alignment: Alignment.bottomLeft,
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Scrollbar(
                        thickness: 5,
                        isAlwaysShown: false,
                        radius: Radius.circular(5),
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.grey,
                              //   width: 1.0,
                              // ),
                              ),
                          height: 200.0,
                          child: ListView(
                            children: selectMallsList
                                .map(
                                  (e) => CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Color(0xFFeb5151),
                                    value: selectedCheckBoxItems1.indexWhere(
                                                (element) =>
                                                    element.mallName ==
                                                    e.mallName) >=
                                            0
                                        ? true
                                        : false,
                                    title: Align(
                                        alignment: Alignment(1.2, 0),
                                        child: e.mallName == null
                                            ? Text('')
                                            : Text(e.mallName)),
                                    onChanged: (value) {
                                      setSelectedCheckBox1(e, value);
                                      setState(() {});
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const String _svg_8sw3lm =
    '<svg viewBox="9.8 6.0 19.4 19.4" ><path transform="translate(1333.79, 90.46)" d="M -1305.815185546875 -65.26988220214844 L -1310.534423828125 -69.98625946044922 C -1311.9599609375 -68.78908538818359 -1313.797729492188 -68.06724548339844 -1315.800415039063 -68.06724548339844 C -1320.321044921875 -68.06724548339844 -1324 -71.74378204345703 -1324 -76.26252746582031 C -1324 -80.78226470947266 -1320.322021484375 -84.45780181884766 -1315.800415039063 -84.45780181884766 C -1311.279663085938 -84.45780181884766 -1307.601806640625 -80.78126525878906 -1307.601806640625 -76.26252746582031 C -1307.601806640625 -74.26240539550781 -1308.322509765625 -72.42717742919922 -1309.51806640625 -71.00285339355469 L -1304.802001953125 -66.28892517089844 C -1304.546875 -66.04415893554688 -1304.520629882813 -65.61956024169922 -1304.743774414063 -65.33982086181641 C -1304.761962890625 -65.31684112548828 -1304.78125 -65.29486083984375 -1304.802001953125 -65.27487945556641 C -1304.941528320313 -65.13901519775391 -1305.122802734375 -65.06407928466797 -1305.309448242188 -65.06607818603516 L -1305.30859375 -65.06008148193359 C -1305.311157226563 -65.06005096435547 -1305.3134765625 -65.06004333496094 -1305.31591796875 -65.06004333496094 C -1305.5 -65.06004333496094 -1305.677734375 -65.13479614257813 -1305.815185546875 -65.26988220214844 Z M -1322.566040039063 -76.26252746582031 C -1322.566040039063 -72.53403472900391 -1319.53125 -69.50090026855469 -1315.800415039063 -69.50090026855469 C -1313.9873046875 -69.50090026855469 -1312.338745117188 -70.21758270263672 -1311.123413085938 -71.38240814208984 C -1311.113037109375 -71.39763641357422 -1311.102416992188 -71.41256713867188 -1311.091186523438 -71.42707824707031 C -1311.071166992188 -71.45205688476563 -1311.049194335938 -71.47502899169922 -1311.026489257813 -71.49701690673828 C -1310.99462890625 -71.52769470214844 -1310.961181640625 -71.55502319335938 -1310.92626953125 -71.57897186279297 C -1309.756713867188 -72.79499053955078 -1309.036743164063 -74.44629669189453 -1309.036743164063 -76.26252746582031 C -1309.036743164063 -79.99100494384766 -1312.0712890625 -83.02415466308594 -1315.800415039063 -83.02415466308594 C -1319.5302734375 -83.02415466308594 -1322.566040039063 -79.99100494384766 -1322.566040039063 -76.26252746582031 Z M -1321.056396484375 -75.37835693359375 C -1321.2021484375 -76.87294769287109 -1320.680053710938 -78.35155487060547 -1319.6552734375 -79.34961700439453 C -1319.365356445313 -79.62934875488281 -1318.931762695313 -79.62934875488281 -1318.641235351563 -79.34961700439453 C -1318.386108398438 -79.10485076904297 -1318.359619140625 -78.68024444580078 -1318.582885742188 -78.40050506591797 C -1318.60107421875 -78.37752532958984 -1318.620239257813 -78.35555267333984 -1318.641235351563 -78.3355712890625 C -1319.366333007813 -77.62824249267578 -1319.735229492188 -76.57923126220703 -1319.630615234375 -75.52122497558594 C -1319.605834960938 -75.11460113525391 -1319.886474609375 -74.76393890380859 -1320.25732421875 -74.73795318603516 L -1320.272705078125 -74.73596954345703 L -1320.3447265625 -74.73596954345703 L -1320.343872070313 -74.73297119140625 C -1320.352416992188 -74.73262786865234 -1320.361206054688 -74.73246002197266 -1320.369506835938 -74.73246002197266 C -1320.711303710938 -74.73245239257813 -1321.003784179688 -75.00498962402344 -1321.056396484375 -75.37835693359375 Z" fill="#7b7b7b" stroke="#000000" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
