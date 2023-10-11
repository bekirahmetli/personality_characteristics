import 'package:flutter/material.dart';
import 'package:kisilik_ozellikleri_uygulamasi/model/kisilik.dart';

class KisilikDetay extends StatefulWidget {
  final Kisilik secilenKisilik;
  const KisilikDetay({required this.secilenKisilik, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KisilikDetayState createState() => _KisilikDetayState();
}

class _KisilikDetayState extends State<KisilikDetay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenKisilik.kisilikAdi + " Kişiliği ve Özellikleri"),
            centerTitle: true,
            background: Image.asset(
              // ignore: prefer_interpolation_to_compose_strings
              'images/' + widget.secilenKisilik.kisilikBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenKisilik.kisilikDetayi,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
