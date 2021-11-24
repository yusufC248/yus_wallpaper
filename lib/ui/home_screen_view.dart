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

  String query = "mountain";
  List<Results> data = [];
  bool isLoading = true;
  int page = 1;
  bool isFavorite = false;
  bool isSearch = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(controller.text.isNotEmpty){
      setState(() {
        query = controller.text;
        _getData(query);
      });
    }else{
      _getData(query);
    }
  }


  Future<void> _getData(String keyword) async{
   setState(() {
     isLoading = true;
   });
    page = 1;
    var _data = await ApiImage.fetchData(keyword, page);
    data = _data.results!;
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _nextData(String keyword) async{
    isLoading = true;
    page+=1;
    var _data = await ApiImage.fetchData(keyword, page);
    data = _data.results!;
    if(data.isEmpty){

    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose(){
    super.dispose();
    _getData(query);
    _nextData(query);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Yus Wallpaper", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        // leading: Text("haha", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context){
              //   return SearchPages();
              // }));
              isSearch = !isSearch;
              setState(() {
              });
            },
            icon: isSearch? Icon(Icons.clear_rounded): Icon(Icons.search)
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
            children: <Widget>[
              isSearch?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: TextField(
                  onSubmitted: _getData,
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Search here',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24))),
                ),
              ):
              SizedBox(height: 5,),
              // Visibility(
              //     visible: data.isEmpty,
              //     child: Center(child: Text("Query not found"))
              // ),
              Visibility(
                visible: data.isNotEmpty,
                child:  isLoading ? Center(child: const CircularProgressIndicator()) : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StaggeredGridView.countBuilder(
                      itemCount: data.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetailScreen(url: data[index].urls!.regular!, display: data[index].urls!.full! ,);

                        })),
                        child: Stack(
                          children:<Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2, top: 3, bottom: 3),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(data[index].urls!.small!),
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                right: 5,
                                child: FavoriteButton(),
                            )
                          ],
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
              if(controller.text.isNotEmpty){
               _nextData(controller.text);
              }else {
                _nextData(query);
              }
            });
          },
          label: Text("Next Page", style: TextStyle(color: Colors.white),),
          icon: Icon(Icons.navigate_next, color: Colors.white,),
          backgroundColor: Colors.black,
        ),
      ),

    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState(){
    super.initState();
    setState(() {
      isFavorite = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      iconSize: 32,
    );
  }
}
