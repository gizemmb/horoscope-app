import 'package:burc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcItem extends StatefulWidget {
  final Burc listelenenBurc;

  const BurcItem({
    required this.listelenenBurc,
    super.key,
  });

  @override
  State<BurcItem> createState() => _BurcItemState();
}

class _BurcItemState extends State<BurcItem> with TickerProviderStateMixin {
  late Color appBarRengi;
  late PaletteGenerator _generator;

  late final AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    appBarRengi = Colors.transparent; // Initialize appBarRengi
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) => _appBarRenginiBul());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.listelenenBurc.burcBuyukResim}'),
    );
    setState(() {
      appBarRengi = _generator.dominantColor?.color ?? Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;

    return DecoratedBoxTransition(
      decoration: _decorationTween.animate(_controller),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: AppConstants.paddingAll,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/burcDetay',
                arguments: widget.listelenenBurc,
              );
            },
            leading: Image.asset('images/${widget.listelenenBurc.burcKucukResim}'),
            title: Text(
              widget.listelenenBurc.burcAdi,
              style: myTextStyle.headlineSmall,
            ),
            subtitle: Text(widget.listelenenBurc.burcTarihi),
            trailing: Icon(
              Icons.arrow_right,
              size: 40,
              color: appBarRengi,
            ),
          ),
        ),
      ),
    );
  }

  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: AppConstants.backgroundAnimation,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(100),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: AppConstants.backgroundOtherAnimation,
          blurRadius: 10.0,
        ),
      ],
    ),
    end: BoxDecoration(
      color: AppConstants.backgroundAnimation,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
    ),
  );
}
