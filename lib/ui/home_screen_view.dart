import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yus_wallpaper/ui/detail_screen.dart';
import '/api/api_image.dart';
import '/api/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String query = "";
  List<Results> data = [];
  bool isLoading = true;
  int page = 1;

  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(controller.text.isNotEmpty){
      _getData();
    }
  }


  Future<void> _getData() async{
    isLoading = true;
    query = controller.text;
    var _data = await ApiImage.fetchData(controller.text, page);
    data = _data.results!;
    setState(() {
      isLoading = false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TextField(
                onEditingComplete: _getData,
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Search here',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Visibility(
              visible: data.isNotEmpty,
              child:  isLoading ? CircularProgressIndicator() : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StaggeredGridView.countBuilder(
                      itemCount: data.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetailScreen(url: data[index].urls!.full!,);

                        })),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(data[index].urls!.small!),
                        ),
                      ),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                  )
                ),
              ),
            ),
            Visibility(
              visible: data.isNotEmpty,
              child: OutlinedButton(
                  onPressed: (){
                    page += 1;
                    setState(() {
                      _getData();
                    });
                  }, child: Text("Next Page")),
            )
          ],
        ),
      ),
    );
  }
}
