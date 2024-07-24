import 'package:burc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'burc_item.dart';
import 'data/strings.dart';
import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  final List<Burc> tumBurclar;

  BurcListesi({super.key}) : tumBurclar = verileriHazirla();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Burç Listesi',
          style: AppConstants.appbarText,
        ),
        backgroundColor: AppConstants.background,
      ),
      backgroundColor: AppConstants.background,
      body: ListView.builder(
        itemCount: tumBurclar.length,
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc: tumBurclar[index]);
        },
      ),
    );
  }

  static List<Burc> verileriHazirla() {
    return List.generate(12, (i) {
      final burcAdi = Strings.burcAdlari[i];
      final burcTarihi = Strings.burcTarihleri[i];
      final burcOzellikleri = Strings.burcGenelOzellikleri[i];
      final burcKucukResim = '${burcAdi.toLowerCase()}${i + 1}.png';
      final burcBuyukResim = '${burcAdi.toLowerCase()}_buyuk${i + 1}.png';
      
      return Burc(burcAdi, burcTarihi, burcOzellikleri, burcKucukResim, burcBuyukResim);
    });
  }
}
