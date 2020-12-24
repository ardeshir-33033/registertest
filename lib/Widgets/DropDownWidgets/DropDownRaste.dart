import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/Business/RegisterBusiness.dart';

class DropDownRaste extends StatefulWidget {
  Function(String newVal) onRasteCallBack;

  DropDownRaste({ this.onRasteCallBack});

  @override
  _DropDownRasteState createState() => _DropDownRasteState();
}

class _DropDownRasteState extends State<DropDownRaste> {
  String dropdownValue7;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Text(
            "رسته",
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue7,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color,
                  fontFamily: 'IRANSans'),
              icon: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SvgPicture.string(_svg_m7ofv4),
                  ),
                ],
              ),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue7 = newValue;
                });
                widget.onRasteCallBack(newValue);
              },
              items: RegisterBusiness()
                  .getVehicleTypes()
                  .map((e) => e.name)
                  .toList()
                  .map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
const String _svg_m7ofv4 =
    '<svg viewBox="8.3 20.0 13.4 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 21.66, 29.0)" d="M 5.901299953460693 1.076775193214417 C 6.301180839538574 0.5398858189582825 7.105405807495117 0.5398857593536377 7.505286693572998 1.076775074005127 L 12.21687698364258 7.402667045593262 C 12.70819091796875 8.062315940856934 12.23739624023438 9 11.41488361358643 9 L 1.991703510284424 9 C 1.169191122055054 9.000000953674316 0.6983963847160339 8.062315940856934 1.189710140228271 7.402667045593262 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
