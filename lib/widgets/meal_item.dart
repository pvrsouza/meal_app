import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complextyText {
    const dictionary = {
      Complexity.Simple: 'Simple',
      Complexity.Hard: 'Hard',
      Complexity.Challenging: 'Challenging',
    };

    return dictionary[complexity];
  }

  String get affordabilityText {
    const dictionary = {
      Affordability.Affordable: 'Affordable',
      Affordability.Luxurious: 'Luxurious',
      Affordability.Pricey: 'Pricey',
    };

    return dictionary[affordability];
  }

  void selectMeal(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ///como o card tem bordas tem o 'BorderRadius.circular(15)'
                  ///vamos usar esse widget que basicamente é um widget que quando usado como filho
                  ///ele e forcado a ter o mesmo formato do Pai.
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  ///Esse Positioned só funciona dentro de um Stack.
                  /// Com ele podemos posicionar o objeto dentro da stack
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black38,
                      ),
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),

                        ///faz quebra de linha no texto se for muito grande
                        softWrap: true,

                        ///caso não tenha sido colocado o softWrap ou ele não funcione por algum motivo, faz o fade. Só pro segurança.
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ///Expanded deixa os items com os mesmos taamanhos
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.schedule,
                          ),

                          ///só para dar um espaco
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$duration min',
                          )
                        ],
                      ),
                    ),

                    ///Expanded deixa os items com os mesmos taamanhos
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.work,
                          ),

                          ///só para dar um espaco
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$complextyText',
                          )
                        ],
                      ),
                    ),

                    ///Expanded deixa os items com os mesmos taamanhos
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                          ),

                          ///só para dar um espaco
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$affordabilityText',
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
