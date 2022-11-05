import 'package:flutter/material.dart';
import 'package:flutter_pro/pages/details.dart';
import 'package:flutter_pro/pages/favourite.dart';
import 'package:flutter_pro/pages/recipes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/' :(context) => Home() ,
        '/details' :(context) => Details(),
        '/favourite' :(context) => Favourite(),
      },
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {
int currentIndex = 0 ;
final screens = [
  Recipes() ,
  Favourite () 
]; 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal[400],
        unselectedItemColor: Colors.black,
        showSelectedLabels: false ,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap:(value) {
          setState(() {
            currentIndex = value ;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined , size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border , size: 30,),
            label: 'Favourite',
          ),
        ]),
      body: IndexedStack(
        index: currentIndex ,
        children: screens,
      )
    );

  }
  
  }
  

  
	