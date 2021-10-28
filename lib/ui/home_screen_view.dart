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
      _getData(query);
    }
  }


  Future<void> _getData(String keyword) async{
    isLoading = true;
    keyword = controller.text;
    page = 1;
    var _data = await ApiImage.fetchData(controller.text, page);
    data = _data.results!;
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _nextData() async{
    isLoading = true;
    query = controller.text;
    page+=1;
    var _data = await ApiImage.fetchData(controller.text, page);
    data = _data.results!;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose(){
    super.dispose();
    _getData(query);
    _nextData();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: TextField(
                  onSubmitted: _getData,
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Search here',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
              ),
              Visibility(
                visible: data.isNotEmpty,
                child:  isLoading ? const CircularProgressIndicator() : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StaggeredGridView.countBuilder(
                      itemCount: data.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetailScreen(url: data[index].urls!.regular!, display: data[index].urls!.full! ,);

                        })),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(data[index].urls!.small!),
                        ),
                      ),
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                     )
                   ),
                ),
              ),
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: data.isNotEmpty,
        child: FloatingActionButton.extended(
          elevation: 24,
          onPressed: (){
            setState(() {
              _nextData();
            });
          },
          label: Text("Next Page", style: TextStyle(color: Colors.redAccent),),
          icon: Icon(Icons.navigate_next, color: Colors.redAccent,),
          backgroundColor: Colors.white70,
        ),
      ),

    );
  }
}
