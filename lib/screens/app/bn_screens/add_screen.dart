import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // final double? _progressValue = 0;
  XFile? _imageFile;
  final ImagePicker _imagePicker =ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: _imageFile != null
                    ? Image.file(File(_imageFile!.path),height:554,width: double.infinity,)
                    : TextButton(
                  onPressed: () async => await pickImage(),
                  style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 554)),
                  child: Text(
                    'رفع الصور',
                    style:Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
    Future<Void?> pickImage() async{
    XFile? _pickedImageFile =await _imagePicker.pickImage(source: ImageSource.gallery);
    if(_pickedImageFile != null){
      setState(() {
        _imageFile=_pickedImageFile;
      });
    }
    return null;
    }


}
