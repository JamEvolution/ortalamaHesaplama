import 'package:flutter/material.dart';
import 'package:yeap/constants/constants.dart';
import 'package:yeap/helper/data_helper.dart';
import 'package:yeap/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemenCikartildi;
  const DersListesi({Key? key, required this.onElemenCikartildi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (deger) {
                  onElemenCikartildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        tumDersler[index].ad,
                        style: Sabitler.dropDownButtonTextStyle,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri * tumDersler[index].krediDeger).toStringAsFixed(0),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      subtitle: Text(
                        "${tumDersler[index].krediDeger.toInt()} Kredili, Not çarpanı ${tumDersler[index].harfDegeri.toInt()}",
                        style: Sabitler.errorTextStyle,
                      ),
                    ),
                  ),
                ),
              );
            }))
        : Center(child: Text('Ders eklede ortalamanı görek ..', style: Sabitler.appBarStyle));
  }
}
