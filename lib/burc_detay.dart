import 'package:burc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;

  const BurcDetay({
    required this.secilenBurc,
    super.key,
  });

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _appBarRenginiBul());
  }

  Future<void> _appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secilenBurc.burcBuyukResim}'),
    );
    setState(() {
      appBarRengi = _generator.dominantColor?.color ?? Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: 200,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/${widget.secilenBurc.burcBuyukResim}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: AppConstants.paddingAll,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: appBarRengi.withOpacity(0.1),
                      padding: AppConstants.paddingAll,
                      child: Text(
                        '${widget.secilenBurc.burcAdi} Burcu ve Özellikleri',
                        style: TextStyle(
                          color: appBarRengi,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.secilenBurc.burcOzellikleri,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
