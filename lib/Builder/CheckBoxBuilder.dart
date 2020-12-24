import 'package:flutter/material.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/ApiModels/KeyPair.dart';

class CheckBoxBuilder extends StatefulWidget {
  List<Brand> list = List<Brand>();

  CheckBoxBuilder({
    this.list,
  });

  @override
  _CheckBoxBuilderState createState() => _CheckBoxBuilderState();
}

class _CheckBoxBuilderState extends State<CheckBoxBuilder> {
  List<BoolianKeyPair> myChecks = List<BoolianKeyPair>();
  List<Brand> selectedItems = List<Brand>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myChecks = widget.list
        .map((e) => BoolianKeyPair(key: e.persianName, value: false))
        .toList();
  }

  Map<String, bool> values = {
    'foo': true,
    'bar': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //   itemCount: myChecks.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(myChecks[index].key),
      //     );
      //   },
      // ),


      body: ListView(
        children: [
          CheckboxListTile(
            title: Text("key.key"),
            value: false,
            onChanged: (bool value) {
              //setState(() {
              //values[key] = value;
              //});
            },
          ),
          CheckboxListTile(
            title: Text("key.key1"),
            value: true,
            onChanged: (bool value) {
              //setState(() {
              //values[key] = value;
              //});
            },
          ),
          CheckboxListTile(
            title: Text("key.key2"),
            value: false,
            onChanged: (bool value) {
              //setState(() {
              //values[key] = value;
              //});
            },
          ),
          CheckboxListTile(
            title: Text("key.key3"),
            value: true,
            onChanged: (bool value) {
              //setState(() {
              //values[key] = value;
              //});
            },
          ),
        ],
      ),
    );

    //   ListView(
    //   children: myChecks
    //       .map(
    //         (e) => CheckboxListTile(
    //           dense: true,
    //           activeColor: Color(0xFF8F111D),
    //           title: Text(e.key as String , style: TextStyle(fontSize: 15.0),),
    //           value: selectedItems.indexWhere((element) => element.persianName == e.key) >= 0 ? true : false,
    //           onChanged: (bool value) {
    //             //setState(() {
    //               var found = myChecks.indexWhere((element) => element.key == e.key);
    //               myChecks[found].value = value;
    //             //});
    //           },
    //         ),
    //       )
    //       .toList(),
    // );
  }
}
