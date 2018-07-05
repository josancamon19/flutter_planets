import 'package:flutter/material.dart';
import 'package:plannets_app/models/planet.dart';
import 'package:plannets_app/utils/text_styles.dart';

class PlanetDetail extends StatelessWidget {
  final Planet planet;

  PlanetDetail({this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getTopContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [new Color(0x00736AB7), new Color(0xFF736AB7)],
        stops: [0.0, 0.9],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
      )),
    );
  }

  Widget _getTopContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 160.0,
              margin: EdgeInsets.only(left: 46.0, right: 46.0, top: 80.0),
              decoration: BoxDecoration(
                  color: new Color(0xFF333366),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0))
                  ]),
              child: Container(
                child: Container(
                  margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        planet.name,
                        style: TextStyles.titleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        planet.location,
                        style: TextStyles.subHeaderTextStyle,
                      ),
                      Container(
                          margin: new EdgeInsets.symmetric(vertical: 8.0),
                          height: 2.0,
                          width: 18.0,
                          color: new Color(0xff00c6ff)),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/ic_distance.png',
                                height: 12.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                planet.distance,
                                style: TextStyles.smallTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 24.0,
                          ),
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/ic_gravity.png',
                                height: 12.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                planet.gravity,
                                style: TextStyles.smallTextStyle,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              alignment: FractionalOffset.center,
              child: Image.asset(
                planet.image,
                height: 92.0,
                width: 92.0,
              ),
            ),
          ],
        ),
        _getContent(),
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(
        color: Colors.white,
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      margin: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _overviewTitle,
            style: TextStyles.headerTextStyle,
          ),
          Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          Text(
            planet.description,
            style: TextStyles.commonTextStyle,
          )
        ],
      ),
    );
  }
}
