import 'package:aqark/screens/data_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataItemsScreen extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> program;
  final List<String> details;
  final int price;
  final url;

  const DataItemsScreen({
    Key? key,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.program,
    required this.details,
    required this.price,
    required this.url,
  }) : super(key: key);

  void selectDetails(context) {
    Navigator.of(context).pushNamed('/data_detail_screen', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green.shade300),
      child: InkWell(
        onTap: () => selectDetails(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 7, //عشان اغير درجة الضل
          margin: const EdgeInsets.all(10), //مسافات خارجية
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ), //بستخدمها لحتى اغير شكل الشايلد الي بدنا نحدها بدخلها
                  Container(
                    height: 250,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                        //لتدريج اللون
                        gradient: LinearGradient(
                            begin: Alignment.topCenter, //بداية التدرج
                            end: Alignment.bottomCenter, //نهاية التدرج
                            colors: [
                          Colors.black.withOpacity(0), //الشفافية
                          Colors.black.withOpacity(0.8),
                        ],
                            stops: const [
                          //عشان احدد بداية التدرج
                          0.6, 1
                        ])),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Cairo-black.ttf'),

                      overflow: TextOverflow
                          .fade, //راح تخلي العنوان ازا كان طويل يختفي بشكل تدريجي
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children:  const[
                         Center(
                          child: SizedBox(
                            width: 100,
                          ),
                        ),
                        Text(
                          'عرض التفاصيل ',
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Tajawal',

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
