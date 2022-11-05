class ExtendedIngredients {
  String ? name ;
   double ? amount ; 
   String ? unit ;

  ExtendedIngredients({this.name , this.amount , this.unit});

  Map <String , dynamic> toJson(){
    return {
      'name' : this.name ,
      'amount' : this.amount ,
      'unit' : this.unit 
    };
   }

  factory ExtendedIngredients.fromJson (Map<String , dynamic> json){
    return ExtendedIngredients(
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
   }

}