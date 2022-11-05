import 'package:flutter/material.dart';
import 'package:flutter_pro/local/data.dart';
import 'package:flutter_pro/local/dataSQL.dart';
import 'package:flutter_pro/local/dbHelper.dart';

class Favourite  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Favourite > {

late DbHelper helper  ;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }   

  @override
  Widget build(BuildContext context) {
    
    
    
    return Scaffold(
      body : 
             FutureBuilder(
                 future: helper.allFavouriteList(),
                builder: ((context,
                AsyncSnapshot snapshot) {
                  if(snapshot.hasError)
                    return Center(child: Text(snapshot.error.toString()),);
                  if (! snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else {
                    return Container(
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

                        Text('Favourite Recipes',
                        style: TextStyle(
                          fontSize: 25 , fontWeight: FontWeight.w600 , color: Colors.teal[400],
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
                children: List.generate(snapshot.data!.length, (index) {
                  DataSQL data =  DataSQL.fromMap(snapshot.data[index]);
                return
                   GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/details',
                      arguments: Data(id:data.id!) );
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(left:10 , right: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                             child: 
                             ClipRRect(
                              borderRadius: BorderRadius.circular (7),
                            child: Image.network('${data.image}',fit: BoxFit.fill,height: 150,width: 150,),
                                        ),  
                                        ),
                                        SizedBox(height: 10 ,),
                                        Center(
                                          child: Text('${data.title}',textAlign :TextAlign.center,
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
                    
                    

                  } } ) )
    );
  }
}