import 'package:flutter/material.dart';

import 'package:skeleton_app/ShimmerW.dart';
import 'package:skeleton_app/videogame.dart';
import 'package:skeleton_app/videogamesData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  List<Videogame> videogames = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2), (){});
    videogames = List.of(allVideogames);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton App'),
        actions: [
          IconButton(onPressed: loadData, icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
        itemCount: isLoading ? 5 : videogames.length,
        itemBuilder: (context, index) {
          if(isLoading) {
            return videogameShimmer();
          } else {
            final videogame = videogames[index];
            return buildVideogame(videogame);

          }
        }
        )
    );
  }
  Widget buildVideogame(Videogame videogame) => ListTile(
    leading: CircleAvatar(
      radius: 32,
      backgroundImage: NetworkImage(videogame.urlImage),
    ),
    title: Text(
      videogame.title,
      style: TextStyle(fontSize: 16),
    ),
    subtitle: Text(
      videogame.description,
      style: TextStyle(fontSize: 14),
      maxLines: 1,
    ),
  );

  Widget videogameShimmer() => ListTile(
      leading: ShimmerW.circular(width: 64, height: 64,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),),
      title: ShimmerW.rectangular(
        height: 16
      ),
      subtitle: ShimmerW.rectangular(height: 14),
  );

 
}
