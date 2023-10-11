import 'package:flutter/material.dart';
import 'package:kisilik_ozellikleri_uygulamasi/kisilik_detay.dart';
import 'package:kisilik_ozellikleri_uygulamasi/model/kisilik.dart';

class KisilikItem extends StatelessWidget {
  final Kisilik listelenenKisilik;
  const KisilikItem({required this.listelenenKisilik, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 16,
          child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => KisilikDetay(secilenKisilik: listelenenKisilik),
              ),
            );
          },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // ignore: prefer_interpolation_to_compose_strings
                "images/" + listelenenKisilik.kisilikKucukResim,
                width: 90, 
                height: 90, 
              ),
              const SizedBox(height: 4),
              Text(
                listelenenKisilik.kisilikAdi,
                style: myTextStyle.headlineSmall,
              ),
            ],
          ),
        ),
      ),
     ),
    );
  }
}