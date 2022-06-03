import 'package:flutter/material.dart';
import 'package:yeap/constants/constants.dart';
import 'package:yeap/helper/data_helper.dart';
import 'package:yeap/model/ders.dart';
import 'package:yeap/widgets/ders_listesi.dart';
import 'package:yeap/widgets/harf_dropdown_widget.dart';
import 'package:yeap/widgets/kredi_dropdown_widget.dart';
import 'package:yeap/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girelenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(Sabitler.appBarTitle, style: Sabitler.appBarStyle),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: _buildForm),
                Expanded(
                    flex: 1,
                    child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenecekDersler.length,
                      ortalama: DataHelper.ortalamaHesaplama,
                    )),
              ],
            ),
            Expanded(child: DersListesi(
              onElemenCikartildi: (index) {
                DataHelper.tumEklenecekDersler.removeAt(index);
                setState(() {});
                // print('Eleman çıkartıldı index $index');
              },
            )),
          ],
        ));
  }

  Widget get _buildForm {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Sabitler.yatayPadding8,
              child: _buildTextFormField,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Sabitler.yatayPadding8,
                    child: HarfDropDownWidget(onHarfSecildi: (harf) {
                      secilenHarfDeger = harf;
                    }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Sabitler.yatayPadding8,
                    child: KrediDropDownWidget(onKrediSecildi: (kredi) {
                      secilenKrediDeger = kredi;
                    }),
                  ),
                ),
                IconButton(
                  onPressed: _dersEklemeVeOrtalamaHesaplama,
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Sabitler.anaRenk,
                  iconSize: 30,
                )
              ],
            ),
          ],
        ));
  }

  Widget get _buildTextFormField {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girelenDersAdi = deger!;
        });
      },
      validator: (deger) {
        if (deger!.isEmpty) {
          return 'Korkma, ders gir hadi :))';
        } else {
          return null;
        }
      },
      cursorColor: Sabitler.anaRenk,
      cursorWidth: 2,
      cursorHeight: 30,
      style: Sabitler.dropDownButtonTextStyle,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        errorStyle: Sabitler.errorTextStyle,
        hintText: 'Hangi ders leo ?',
        hintStyle: Sabitler.textFormFieldHintStyle,
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  void _dersEklemeVeOrtalamaHesaplama() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girelenDersAdi,
        harfDegeri: secilenHarfDeger,
        krediDeger: secilenKrediDeger,
      );
      DataHelper.dersEkle(eklenecekDers);
      // print(DataHelper.ortalamaHesaplama);
      setState(() {});
    }
  }
}
