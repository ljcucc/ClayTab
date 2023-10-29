import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = MediaQuery.of(context).size.width >= 840;
    return SafeArea(
      minimum: EdgeInsets.only(top: 16),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: !isExpanded
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Symbols.arrow_back),
                )
              : null,
          actions: [
            if (!isExpanded)
              IconButton(
                icon: Icon(Symbols.settings),
                onPressed: () {},
              )
          ],
        ),
      ),
    );
  }
}
