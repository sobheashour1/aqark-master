import 'package:aqark/screens/models/address.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsStatus = false;
   String _selectedGender = 'M';
  int? _selectedExperienceIndex;


  final List<Address> _addresses = <Address>[
    Address(name: 'غزة'),
    Address(name: 'خانيونس'),
    Address(name: 'رفح'),
    Address(name: 'البريج'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //لتدريج اللون
          gradient: const LinearGradient(
              begin: Alignment.topCenter, //بداية التدرج
              end: Alignment.bottomCenter, //نهاية التدرج
              colors: [
                Colors.white, //الشفافية
                Colors.white70,
              ],
             )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('الاعدادات',style:Theme.of(context).textTheme.headline6,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
            padding: const EdgeInsets.only(left: 20, right: 40,top: 10),
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('الاشعارات'),
                subtitle: const Text('تشغيل/اطفاء الاشعارات'),
                value: _notificationsStatus,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsStatus = value;
                  });
                },
              ),
              const SizedBox(height: 10),
               Text(
                'الجنس',
                style:Theme.of(context).textTheme.headline5,
              ),
              RadioListTile<String>(
                title:  const Text('ذكر'),
                value: 'M',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  if(value != null) {
                    setState(() {
                    _selectedGender = value;
                  });
                  }
                },
              ),
              RadioListTile<String>(
                title:  const Text('انثى'),
                value: 'F',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  if(value != null) {
                    setState(() {
                      _selectedGender = value;
                    });
                  }

                },
              ),

              const SizedBox(height: 10),
              Text(
                'العنوان',
                style:Theme.of(context).textTheme.headline5,            ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_addresses[index].name),
                    value: _addresses[index].checked,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _addresses[index].checked = value;
                        });
                      }
                    },
                  );
                },
              ),

              const SizedBox(height: 10),
              Text(
                'الوظيفة',
                style:Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<int>(
                onTap: () {},
                value: _selectedExperienceIndex,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _selectedExperienceIndex = value;
                    });
                  }
                },
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                disabledHint: const Text('لاشيء محدد'),
                // selectedItemBuilder: (context) {
                //   return [
                //     Text('SELECTED ITEM')
                //   ];
                // },
                hint: const Text('حدد وظيفتك '),
                underline: Divider(
                  color: Colors.green.shade400,
                  height: 0,
                  thickness: 1,
                ),
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: const Text('مالك'),
                    onTap: () {},
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: const Text('سمسار'),
                    onTap: () {},
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: const Text('مشتري للعقار'),
                    onTap: () {},
                  ),
                ],
              ),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  Chip(
                    label: const Text('مستثمر'),
                    elevation: 3,
                    backgroundColor: Colors.green.shade400,
                    avatar: const Icon(Icons.laptop),
                    deleteIcon: const Icon(Icons.clear,size: 18,),
                    onDeleted: (){},
                    deleteIconColor: Colors.red,
                    deleteButtonTooltipMessage: 'Delete',
                    useDeleteButtonTooltip: false,
                  ),
                  const Chip(
                    label: Text('مالك العقار'),
                  ),
                  const Chip(
                    label: Text('مستأجر'),
                  ),
                  const Chip(
                    label: Text('سمسار'),
                  ),
                  const Chip(
                    label: Text('مستخدم '),
                  ),
                  const Chip(
                    label: Text('هاوي'),
                  ),
                ],
              ),
            ],

            ),
      ),
    );
  }
}
