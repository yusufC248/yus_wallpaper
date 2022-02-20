import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;

class DetailScreen extends StatefulWidget {
  final String? url;
  final String? display;
  DetailScreen({Key? key, this.url, this.display}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}



class _DetailScreenState extends State<DetailScreen> {

  Future? _value;

  File? imageDownload;

  @override
  void initState() {
    super.initState();
    // _value = _imageUrl();

  }

  Future _imageUrl() async{
    var hasil = _getImage();
    return hasil;
  }

  Widget _getImage(){
    return Hero(
      tag: widget.display!,
      child: Image.network(widget.url!, fit: BoxFit.contain,)
    );
  }

  Future<void> _download(String linkImage) async{
  var status = await Permission.storage.request();
  if(status.isGranted){
    final response = await http.get(Uri.parse(linkImage));

    final imageName = path.basename("sample");

    final appDir = await pathProvider.getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, imageName);

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);

    setState(() {
      imageDownload = imageFile;
    });

    if(imageDownload != null){
      print("download succes");
    }else{
      print("failed");
    }
  }

  }



  _save() async{
    var status = await Permission.storage.request();
    if(status.isGranted){
      _toastInfo("Please wait.. Downloading Wallpaper");
      var response = await Dio()
          .get(widget.display!, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 80,
        name: 'wallpaper'
      );
      _toastInfo("wallpaper saved to galery");
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Yus Wallpaper", style: TextStyle(color: Colors.white),),
      ),
      body: _getImage(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _save();
        },
        child: const Icon(Icons.download,),
      ),
    );
  }
}
