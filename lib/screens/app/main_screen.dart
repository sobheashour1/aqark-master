import 'package:flutter/material.dart';
import 'package:aqark/screens/app/bn_screens/add_screen.dart';
import 'package:aqark/screens/app/bn_screens/categories_screen.dart';
import 'package:aqark/screens/app/bn_screens/map_screen.dart';
import 'package:aqark/screens/models/bn_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(widget: CategoriesScreen(), title: 'التصنيفات'),
    const BnScreen(
      widget: AddScreen(),
      title: 'الاضافة',
    ),
    const BnScreen(
      widget: MapsScreen(),
      title: 'الخريطة',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:LinearGradient(
              begin:AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,

              colors: [
                Colors.green.shade200,
                Colors.green.shade800,
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          elevation: 0,
          title: Text(
            _bnScreens[_currentIndex].title,
            style:Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/login_screen');
              }, icon:const Icon(Icons.login_outlined),
            )
          ],
        ),

        drawer: Drawer(
          backgroundColor: Colors.green.shade400,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/setting_screen');
                },
                leading: const Icon(Icons.settings),
                title: const Text(
                  'الاعدادات',
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),

              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/faqs_screen');
                },
                leading: const Icon(Icons.question_answer),
                title: const Text('معلومات الدعم والتواصل',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                leading: const Icon(Icons.logout),
                title: const Text(
                  'تسجيل الخروج',
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        body: _bnScreens[_currentIndex].widget,
        bottomNavigationBar: BottomNavigationBar(

          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.orange),
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          selectedFontSize: 14,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w200),
          unselectedFontSize: 14,
          elevation: 16,

          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(
                Icons.category_outlined,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.category,
                size: 30,
                color: Colors.black,
              ),
              label: "التصنيفات",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
                size: 60,
              ),
              activeIcon: Icon(
                Icons.add_circle,
                size: 60,
                color: Colors.black,
              ),
              label: "اضافة",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.map_outlined,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.map,
                size: 30,
                color: Colors.black,
              ),
              label: 'خريطة',
            ),
          ],
        ),


      ),
    );
  }
}
