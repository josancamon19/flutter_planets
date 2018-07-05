import 'package:flutter/material.dart';
import 'package:plannets_app/models/planet.dart';
import 'package:plannets_app/ui/gradient_appbar.dart';
import 'package:plannets_app/utils/utils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar("TREVA"),
          Expanded(
            child: Container(
              color: new Color(0xFF736AB7),
              child:
                  ListView.builder(
                      itemCount: Utils.planets.length,
                      itemBuilder: (_, int index) {
                        return Utils.planets[index];
                      }),
            ),
          )
        ],
      ),
    );
  }
}
