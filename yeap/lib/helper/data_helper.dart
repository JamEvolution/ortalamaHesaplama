import 'package:flutter/material.dart';
import 'package:yeap/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenecekDersler = [];

  static dersEkle(Ders ders) {
    tumEklenecekDersler.add(ders);
  }

  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'DF', 'FF'];
  }

  static double get ortalamaHesaplama {
    double toplamNot = 0;
    double toplamKredi = 0;
    for (var element in tumEklenecekDersler) {
      toplamNot = toplamNot + (element.krediDeger * element.harfDegeri);
      toplamKredi += element.krediDeger;
    }
    return toplamNot / toplamKredi;
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'CD':
        return 1.5;
      case 'DD':
        return 1;
      case 'DF':
        return 0.5;
      case 'FF':
        return 0.1;
      default:
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map((e) => DropdownMenuItem(
              value: _harfiNotaCevir(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(
              e.toString(),
            ),
          ),
        )
        .toList();
  }
}
