import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models1/data.dart';

class VrTour extends StatelessWidget {
  late Data data;

  VrTour({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text(
          'صفحة التنقل',
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 30),
            child: Container(
              child: Text(
                'للتمتع بخدمة التجول الافتراضية داخل العقار الرجاء منك الضغط على الايقونة التي بالاسفل للانتقال مباشرة الى موقع العقار ....',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Image.asset(
              data.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 500, 25, 20),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade800,
                shadowColor: Colors.white,
                minimumSize: const Size(double.infinity, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              label: const Text(
                '             جولة بتقنية 360درجة         ',
              ),
              icon: const Icon(
                Icons.accessibility_sharp,
              ),
              onPressed: () async {
                var url = data.url;
                if (await canLaunch(url)) {
                  await launch(url,
                      forceSafariVC: false,
                      forceWebView: true,
                      enableJavaScript: true);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
