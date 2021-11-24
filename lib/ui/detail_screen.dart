import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';


class DetailScreen extends StatefulWidget {
  final String? url;
  final String? display;
  const DetailScreen({Key? key, this.url, this.display}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}



class _DetailScreenState extends State<DetailScreen> {

  Future? _value;

  @override
  void initState() {
    super.initState();
    _value = _imageUrl();

  }

  Future _imageUrl() async{
    var hasil = _getImage();
    return hasil;
  }

  Widget _getImage(){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.url!),
              fit: BoxFit.cover
          )
      ),
    );
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
      body: FutureBuilder(
        future: _value,
        builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
        ){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return snapshot.data;
            } else {
              return const Text('Empty data');
            }
          }else{
            return Text('State: ${snapshot.connectionState}');
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        child: const Icon(Icons.download,),
      ),
    );
  }
}
