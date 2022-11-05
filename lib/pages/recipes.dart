import 'package:flutter/material.dart';
import 'package:flutter_pro/local/data.dart';
import 'package:flutter_pro/network/api_recipes.dart';
import 'package:flutter_pro/model.recipes/allData.dart';

class Recipes  extends StatefulWidget {

 static int ? id ;
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Recipes > {
int currentIndex = 0 ;


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder <AllData>
      (future: API.getRecipes(),
        builder: ((context, snapshot) {
          if (snapshot.hasData){
            print(snapshot.data) ;
            
            return  Container(
         width:double.infinity , height: double.infinity,
          child:
            Center(
               child: Column(
                children: <Widget>[

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu , size: 35, color: Colors.teal[400],),

                        Text('Recipes',
                        style: TextStyle(
                          fontSize: 30 , fontWeight: FontWeight.w600 , color: Colors.teal[400],
                        ),)
                        ,

                        Icon(Icons.search , size: 35, color: Colors.teal[400],),

                  
                      ],),
                  ),

                  SizedBox(height: 10,),

                  Expanded ( 
            child: GridView.count(
                crossAxisCount: 2, 
                scrollDirection: Axis.vertical, 
                mainAxisSpacing: 10,
                children: List.generate(snapshot.data!.results!.length, (index) {
                return
                   GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/details',
                      arguments: Data(id:snapshot.data!.results!.elementAt(index).id!) );
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(left:10 , right: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                             child: 
                             ClipRRect(
                              borderRadius: BorderRadius.circular (7),
                            child: Image.network('${snapshot.data!.results!.elementAt(index).image}',fit: BoxFit.fill,height: 150,width: 150,),
                                        ),  
                                        ),
                                        SizedBox(height: 10 ,),
                                        Center(
                                          child: Text('${snapshot.data!.results!.elementAt(index).title}',textAlign :TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12 , fontWeight: FontWeight.w500,
                                          ),),
                                        )
                          ],
                        ),
                      ),
                    );
                  
                },
                ), 
                ),
             
              ),   

              ],
               ),
                )
                );
          }
          else if (snapshot.hasError){
            print(snapshot.error);
            return Center(child: Container(child: Text('${snapshot.error}'),));
          }
          return Center(child: CircularProgressIndicator(),);
        })),
    );
  }
}