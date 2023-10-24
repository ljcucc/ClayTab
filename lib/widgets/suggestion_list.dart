import 'dart:ui';

import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: MaterialContainer(
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 300,
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++)
                        ListTile(
                          onTap: () {},
                          leading: Icon(Symbols.deployed_code),
                          title: Text(
                            "helloworld()",
                            style:
                                GoogleFonts.robotoMono().copyWith(fontSize: 14),
                          ),
                        ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialContainer(
                            elevation: 0,
                            backgroundColor:
                                colorScheme.surface.withOpacity(.75),
                            borderRadius: BorderRadius.circular(24).copyWith(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "This is a demo of how to use a method that is selected.",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
