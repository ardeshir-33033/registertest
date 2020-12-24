import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/Box/smallBox.dart';

class BrandListView extends StatefulWidget {
  List<Brand> selectedCheckBoxItems = List<Brand>();
  List<Brand> selectedItems = List<Brand>();
  // Function(String newVal) onImportedBrandCallBack;

  BrandListView(
      {this.selectedCheckBoxItems,
      this.selectedItems,
      ////this.onImportedBrandCallBack
      });

  @override
  _BrandListViewState createState() => _BrandListViewState();
}

class _BrandListViewState extends State<BrandListView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView.builder(
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: widget.selectedCheckBoxItems.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  widget.selectedCheckBoxItems.remove(index);
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: EdgeInsets.all(5.0),
                  height: 25.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        widget.selectedCheckBoxItems[index].persianName,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          child: GestureDetector(
            child: SvgPicture.asset('assets/images/plus.svg'),
            onTap: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: SmallBox(
                        personal: false,
                        OnAddCallback: (result) {
                          widget.selectedItems.add(result);
                          setState(() {});
                        },
                      ),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
