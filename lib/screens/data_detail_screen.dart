import 'package:aqark/screens/app/vr.dart';
import 'package:flutter/material.dart';
import 'package:aqark/app_data.dart';

class DataDetailScreen extends StatelessWidget {
//صفحة تفاصيل الرحلة
  static const screenRoute = '/trip-detail';

  const DataDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    //فريبل سليكت عشان تخزن ونحصل على الرحلة الي تم اختيارها
    final selectTrip = Pass_data.firstWhere((trip) => trip.id == tripId);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
            Colors.green.shade200,
            Colors.green.shade800,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green.shade500,
          actions: [
            IconButton(
              padding: const EdgeInsets.only(left: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VrTour(
                      data: selectTrip,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.accessibility_sharp,
                size: 30,
              ),
            )
          ],
          elevation: 7,
          title: Text(selectTrip.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  selectTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                alignment: Alignment.topRight,
                child: Text('تفاصيل العقار',
                    style: Theme.of(context).textTheme.headline6),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)),
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemCount: selectTrip.details.length,
                      itemBuilder: (ctx, index) => Card(
                            elevation: 0.3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                selectTrip.details[index],
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          )),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                alignment: Alignment.topRight,
                child: Text(
                  'للتواصل',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade200, //لتغير اللون داخل البوكس
                      border: Border.all(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemCount: selectTrip.program.length,
                      itemBuilder: (ctx, index) => Card(
                            elevation: 0.3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                selectTrip.program[index],
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
