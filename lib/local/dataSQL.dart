class DataSQL {
  int ? idSQL ; 
  int ? id ;
  String ? title ;
  String ? image ;

DataSQL (dynamic obj){
     if (obj['idSQL']!= null) {
      id = obj['idSQL'];
     }
  id = obj['id'];
  title = obj['title'];
  image = obj['image'];
  }

  DataSQL.fromMap (Map <String , dynamic> data ){
  if (data['idSQL']!= null){
    id = data['idSQL'];
  }
  id = int.parse(data['id']);
  title = data['title'];
  image = data['image'];
 }

  Map <String , dynamic> toMap () {
 Map <String , dynamic> Data = { 
  'id': id ,
  'title' : title  ,
  'image': image ,
    };
 if (idSQL != null){
  Data ['idSQL'] = idSQL ;
 }
 return Data ; 
 } 

}