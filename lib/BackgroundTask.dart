// ignore_for_file: file_names

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:mechat/DatabaseHelper.dart';

class Background{

  List<Map<String, dynamic>> dbData = [];
  final dbHelper = DatabaseHelper.instance;

  String base64string;
  void loadNames(){

  }
  Widget loadImages(String b64Image){
    var image = Background().decodeBase64(b64Image);
      return CircleAvatar(
        backgroundImage: MemoryImage(image),
        radius: 70,       
        backgroundColor: Colors.white,
      );
  }

  Future<String> generateProPic() async {
    // Get image from Gallery using ImagePicker
    final ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    String encodedSTR = await encodeBase64(image);
    print(encodedSTR);
    return encodedSTR;
  }

  Future<String> encodeBase64(XFile imageFile) async {
    Uint8List bytes = await imageFile.readAsBytes();
    String encoded = base64.encode(bytes);
    return encoded;
  }
  Uint8List decodeBase64(String encoded) {
    return Uint8List.fromList(base64Decode(encoded));
  }

  void checkForFaceData(int index){
    
      // Decode base64 String to Memory image for displaying
      
  
    
  }


  Future<List<Map<String, dynamic>>> getData()async{
    return await dbHelper.queryAllRows();

  }
}