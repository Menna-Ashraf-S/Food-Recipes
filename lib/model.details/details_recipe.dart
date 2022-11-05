import 'package:flutter_pro/model.details/extendedIngredients.dart';

class Details_Recipe {
  
List <ExtendedIngredients> ? extendedIngredients ;
String ? title ;
int ? readyInMinutes ;
String ? image ;
String ? instructions ;

Details_Recipe ({this.extendedIngredients , this.title , this.readyInMinutes , this.image , this.instructions});

Map <String , dynamic> toJson(){
    return {
      'instructions' : this.instructions ,
      'image' : this.image ,
      'readyInMinutes' : this.readyInMinutes ,
      'title' : this.title ,
      'extendedIngredients' : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson()))
    };
   }

   factory Details_Recipe.fromJson (Map<String , dynamic> json){
    return Details_Recipe(
      instructions: json['instructions'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
      title: json['title'],
      extendedIngredients: List<ExtendedIngredients>.from(json['extendedIngredients'].map((x) => ExtendedIngredients.fromJson(x)))
    );
   }

}