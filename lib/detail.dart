import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/model/product.dart';

import 'model/ingredients.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}
class ClipPathClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.product.image),
                  fit: BoxFit.cover
                )
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: black.withOpacity(0.5),
                      ),
                      child: Icon(Icons.arrow_back_rounded, color: white,),
                    ),
                  ),
                  Icon(Icons.more_vert, color: black,)
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height *0.55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                  color: grey.shade200
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(widget.product.user.image),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.name, maxLines: 1, style: roboto.copyWith(
                                  color: black, fontSize: 16
                                ),),
                                SizedBox(height: 5,),
                                Text("12 Recipes Shared", style: roboto.copyWith(
                                  fontSize: 12, color: black.withOpacity(0.6)
                                ),),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text("${widget.product.rate}", style: roboto.copyWith(fontSize: 12),),
                                  SizedBox(width: 5,),
                                  RatingBar.builder(
                                    initialRating: widget.product.rate,
                                    allowHalfRating: true,
                                    unratedColor: grey.shade300,
                                    itemSize: 14,
                                      itemBuilder: (context, index) =>
                                          Icon(Icons.star_rounded, color: orange.shade300,),
                                      onRatingUpdate: (value) {}),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Text('(24 Reviwes)', style: roboto.copyWith(fontSize: 12, color: black.withOpacity(0.6)),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.name, style: roboto.copyWith(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),),
                              Text('1 Bowl (${widget.product.weight} g )', style: roboto.copyWith(
                                color: black.withOpacity(0.6),
                                fontSize: 12
                              ),)
                            ],
                          ),
                          Spacer(),
                          Text("See detail", style: roboto.copyWith(
                            color: green,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCircular(
                            color: green,
                            header: 'Carbs',
                            footer: '${widget.product.carb} g',
                            footer_: '(56%)',
                            data: 0.4,
                          ),
                          MyCircular(
                            color: red,
                            header: 'Fat',
                            footer: '${widget.product.fat} g',
                            footer_: '(72%)',
                            data: 0.6,
                          ),
                          MyCircular(
                            color: orange,
                            header: 'Protein',
                            footer: '${widget.product.protein} g',
                            footer_: '(8%)',
                            data: 0.16,
                          ),
                          MyCircular(
                            color: green,
                            header: 'Calories',
                            footer: '${widget.product.calorie} kkal',
                            footer_: '(8%)',
                            data: 0.16,
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Text("Ingredient", style: roboto.copyWith(fontSize: 16, color: black),),
                          Spacer(),
                          Text("See details", style: roboto.copyWith(fontSize: 12, color: green, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(ingredients.length, (index) =>
                            IngredientItem(
                              ingredients: ingredients[index],
                            )
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height *0.55,
                child: ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: grey.shade200
                    ),
                  ),
                )
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.5 + 20,
              right: 50,
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.product.fav ? red : grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      spreadRadius: 7,
                      blurRadius: 0,
                      color: grey.shade300
                    )
                  ]
                ),
                child: Icon(Icons.favorite_border_rounded, color: white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  final Ingredients ingredients;
  const IngredientItem({
    super.key, required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ingredients.color
          ),
          child: Image.asset(ingredients.image),
        ),
        SizedBox(height: 5,),
        Text(ingredients.name, style: roboto.copyWith(
          fontSize: 12,
          color: black.withOpacity(0.6)
        ),)
      ],
    );
  }
}

class MyCircular extends StatelessWidget {
  final String header, footer, footer_;
  final Color color;
  final double data;
  const MyCircular({
    super.key, required this.header, required this.footer, required this.footer_, required this.color, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      animation: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      lineWidth: 7,
      reverse: true,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Text(header, style: roboto.copyWith(color: black.withOpacity(0.6), fontSize: 12),),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: RichText(
            text: TextSpan(
              children:[
                TextSpan(text: "$footer", style: roboto.copyWith(color: black, fontSize: 12)),
                TextSpan(text: '$footer_', style: roboto.copyWith(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
              ]
            )
        ),
      ),
    );
  }
}
