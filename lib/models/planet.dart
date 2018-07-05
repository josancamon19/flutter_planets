import 'package:flutter/material.dart';
import 'package:plannets_app/ui/planet_detail.dart';
import 'package:plannets_app/utils/text_styles.dart';

class Planet extends StatelessWidget {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;
  final String picture;
  final bool horizontal;

  const Planet(
      {this.id,
      this.name,
      this.location,
      this.distance,
      this.gravity,
      this.description,
      this.image,
      this.picture,
      this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetailPage(context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 16.0, 8.0, 16.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 124.0,
              margin: EdgeInsets.only(left: 46.0, right: 24.0),
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
                  margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        name,
                        style: TextStyles.titleTextStyle,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        location,
                        style: TextStyles.subHeaderTextStyle,
                      ),
                      Container(
                          margin: new EdgeInsets.symmetric(vertical: 8.0),
                          height: 2.0,
                          width: 18.0,
                          color: new Color(0xff00c6ff)),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/ic_distance.png',
                                height: 12.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                distance,
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
                                gravity,
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
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,
              child: Hero(
                  tag: "planet-hero-${id}",
                  child: Image.asset(
                    image,
                    width: 92.0,
                    height: 92.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetailPage(BuildContext context) {
    Planet actualPlanet = Planet(
      id: this.id,
      name: this.name,
      image: this.image,
      description: this.description,
      location: this.location,
      distance: this.distance,
      gravity: this.gravity,
      picture: this.picture,
    );
    debugPrint(actualPlanet.name);
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => PlanetDetail(planet: actualPlanet,),
          transitionsBuilder: (context, animation, secondaryAnimation,
              child) =>
          new FadeTransition(opacity: animation, child: child),));
  }
}
