import 'package:flutter_pro/model.recipes/results.dart';

class AllData {

  int ? offset ;
  int ? number ;
  int ? totalResults ;
  List <Results> ? results ;

  AllData ({this.offset , this.number , this.totalResults , this.results });

  Map <String , dynamic> toJson(){
    return {
      'offset' : this.offset ,
      'number' : this.number ,
      'totalResults' : this.totalResults ,
      'results' : List<dynamic>.from(results!.map((x) => x.toJson()))
    };
   }

   factory AllData.fromJson (Map<String , dynamic> json){
    return AllData(
      offset: json['offset'],
      number: json['number'],
      totalResults: json['totalResults'],
      results: List<Results>.from(json['results'].map((x) => Results.fromJson(x)))
    );
   }

}