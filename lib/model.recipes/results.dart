class Results {

  int ? id ;
  String ? title ;
  String ? image ;
  String ? imageType ;

  Results ({this.id , this.title , this.image , this.imageType});

  Map <String , dynamic> toJson(){
    return {
      'id' : this.id ,
      'title' : this.title ,
      'image' : this.image ,
      'imageType' : this.imageType
    };
   }

  factory Results.fromJson (Map<String , dynamic> json){
    return Results(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType']
    );
   }
}