import 'package:flutter/material.dart';
import 'package:flutter_pro/local/data.dart';
import 'package:flutter_pro/local/dataSQL.dart';
import 'package:flutter_pro/local/dbHelper.dart';
import 'package:flutter_pro/model.details/details_recipe.dart';
import 'package:flutter_pro/network/api_details.dart';

class Details  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Details > {

late DbHelper helper  ;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Data ;

    return Scaffold(
      body: FutureBuilder <Details_Recipe>
      (future: API_Details.getRecipesDetails(args.id),
        builder: ((context, snapshot) {
          if (snapshot.hasData){
            print(snapshot.data) ;
            
            return SingleChildScrollView (
              child: Container(
                      child: 
              Center(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
            
                    SizedBox(height: 15,),
            
                    Padding(
                      padding: const EdgeInsets.only(left : 10 , right: 10 ,top: 10 ,bottom: 5 ),
                      child: 
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon : Icon(Icons.arrow_back , size: 30, color: Colors.teal[400],),
                            onPressed: (){
                              Navigator.pop(context);
                            },),
            
                          SizedBox(width: 150,),
            
                          IconButton(
                            icon: Icon(Icons.favorite , size: 25 , color: Colors.pink,) ,
            
                            onPressed: () async {
                              DataSQL dataSQL = DataSQL({'title': snapshot.data!.title  ,
                               'image' : snapshot.data!.image , 'id' : args.id  });
                                                int id = await helper.createFavourite(dataSQL);
                              Navigator.pushNamed(context, '/favourite');
                            }, 
                            
                            ),
                          SizedBox(width: 15,),
            
                          Icon(Icons.play_arrow_outlined , size: 30, color:Colors.black ,),
            
                          SizedBox(width: 18,),
            
                          Icon(Icons.shopping_cart_outlined , size: 20, color: Colors.black,),
            
                          SizedBox(width: 18,),
            
                          Icon(Icons.share , size: 20, color: Colors.black,),
            
                        ],
                        ),
                        ),
            
                      Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Container( child: ClipRRect(
                        child: Image.network('${snapshot.data!.image}',fit: BoxFit.fill,),
                      ),  
                        ),
                      ),
            
                      SizedBox(height: 20,), 
            
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child:
                         Text('${snapshot.data!.title}',
                        style: TextStyle(
                           fontSize: 25 , fontWeight: FontWeight.w600 , color: Colors.teal[400],
                        ),
                        ),
                      ),
            
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Container(
                          width: double.infinity, height: 55,
                          child:
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                                 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.access_time_rounded , size: 20 , color: Colors.teal[400],),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data!.readyInMinutes} mins', 
                                  style: TextStyle(
                                    fontSize: 18 , fontWeight: FontWeight.w400 , color: Colors.black ,
                                  ),),
                              ],
                              ),
                              VerticalDivider(
                                thickness: 1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('${snapshot.data!.extendedIngredients!.length}' , 
                                  style: TextStyle(
                                    fontSize: 18 , fontWeight: FontWeight.w400 , color: Colors.black ,
                                  ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text('ingredients', 
                                  style: TextStyle(
                                    fontSize: 18 , fontWeight: FontWeight.w400 , color: Colors.black ,
                                  ),
                                  ),
                              ],
                              ),
                             ],
                              ),
                           
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Divider(),
                      ),
                          SizedBox(height: 15,),
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 10 , right: 10),
                            child: Container(
                              child: Text('${snapshot.data!.instructions}', 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15 , fontWeight: FontWeight.w400 , color: Colors.black ,
                              ),
                              ),
                            ),
                          ),
                          Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Divider(),
                      ),
                            SizedBox(height: 15) ,

                          Padding(
                            padding: const EdgeInsets.only(left: 10 , right: 10),
                            child: Container(
                              width: double.infinity, height: 30,
                              child:
                               Padding(
                                 padding: const EdgeInsets.only(left: 10),
                                 child: Text('Ingredient\'s' ,
                                 style: TextStyle(
                                  fontSize: 20 , fontWeight: FontWeight.w600 , color: Colors.teal[400],
                                 ),
                                 ),
                               ),
                            ),
                          ),
                          Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Divider(),
                      ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10 , right: 10),
                            child: Container(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                      
                                    },
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.extendedIngredients!.length,
                                    itemBuilder: ((context, index) {
                                      return Row (children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Container(
                                              width: 10, height: 10,
                                              decoration: BoxDecoration(color :Colors.teal[400] ,borderRadius: BorderRadius.circular(10)),
                                            ),
                                          ),
                                          SizedBox(width: 15,), 
                                          Text('${snapshot.data!.extendedIngredients!.elementAt(index).amount} ${snapshot.data!.extendedIngredients!.elementAt(index).unit} ${snapshot.data!.extendedIngredients!.elementAt(index).name}',
                                          style: TextStyle(
                                            fontSize: 18 , fontWeight: FontWeight.w400 , color: Colors.black ,
                                          ),
                                          ),
                                        ],
                                        );
                                    }
                                    ),
                                    ),
                            ),
                          )
                        ],
                        ),
                        ),
                  ),
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