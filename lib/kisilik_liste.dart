import 'package:flutter/material.dart';
import 'package:kisilik_ozellikleri_uygulamasi/kisilik_item.dart';
import 'package:kisilik_ozellikleri_uygulamasi/data/strings.dart';
import 'package:kisilik_ozellikleri_uygulamasi/model/kisilik.dart';

class KisilikListesi extends StatefulWidget {
  const KisilikListesi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KisilikListesiState createState() => _KisilikListesiState();
}

class _KisilikListesiState extends State<KisilikListesi> {
  late final List<Kisilik> tumKisilikler;
  bool veriYukleniyor = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        tumKisilikler = veriKaynaginiHazirla();
        veriYukleniyor = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kişilik Özellikleri'),
      ),
      body: Center(
        child: veriYukleniyor
            ? const CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return KisilikItem(listelenenKisilik: tumKisilikler[index]);
                },
                itemCount: tumKisilikler.length,
              ),
      ),
    );
  }

  List<Kisilik> veriKaynaginiHazirla() {
    List<Kisilik> gecici = [];

    for (int i = 0; i < 16; i++) {
      var kisilikAdi = Strings.kisilik_adlari[i];
      var kisilikDetay = Strings.kisilik_ozellikleri[i];
      var kisilikKucukResim =
          '${Strings.kisilik_adlari[i].toLowerCase()}${i + 1}.png';
      var kisilikBuyukResim =
          '${Strings.kisilik_adlari[i].toLowerCase()}_buyuk${i + 1}.png';
      Kisilik eklenecekKisilik =
          Kisilik(kisilikAdi,kisilikDetay, kisilikKucukResim, kisilikBuyukResim);
      gecici.add(eklenecekKisilik);
    }
    return gecici;
  }
}
