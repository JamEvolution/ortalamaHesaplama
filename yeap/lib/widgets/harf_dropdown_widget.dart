import 'package:flutter/material.dart';
import 'package:yeap/constants/constants.dart';
import 'package:yeap/helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({Key? key, required this.onHarfSecildi}) : super(key: key);

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.yatayPadding8,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
          elevation: 16,
          value: secilenHarfDeger,
          iconEnabledColor: Sabitler.anaRenk,
          iconSize: 30,
          style: Sabitler.dropDownButtonTextStyle,
          items: DataHelper.tumDerslerinHarfleri(),
          onChanged: (deger) {
            print(deger);
            setState(() {
              secilenHarfDeger = deger!;
              widget.onHarfSecildi(secilenHarfDeger);
            });
          },
          underline: Container()),
    );
  }
}
