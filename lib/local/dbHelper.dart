import 'package:flutter_pro/local/dataSQL.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
static final DbHelper _instance = DbHelper.internal();
  factory DbHelper () => _instance ;
  DbHelper.internal();
  static  Database ? _db ;

  Future createDatabase () async {
    if(_db != null ){
      return _db ;
    }
    String path = join (await getDatabasesPath() , 'Details.db') ;
     _db = await openDatabase( path , version: 1 , onCreate: (Database db,  int version)async {

      await db.execute('''create table details (
        idSQL integer primary key autoincrement,
        id text not null ,
        title text not null,
        image text not null 
  )
      ''');
    },
    
     );
     return _db ;
     }
    Future <int> createFavourite (DataSQL data) async{
      Database db = await createDatabase() ;
      return db.insert('details', data.toMap() );
     }

     Future <List> allFavouriteList ()async{
      Database db = await createDatabase() ;
      return await db.query('details');
     }

     Future <int> update(DataSQL data) async {
      Database db = await createDatabase() ;
      return db.update('details' , data.toMap() , 
      where: 'idSQL = ?' , whereArgs: [data.id]
      );
     }

     Future <int> delete (int id) async{
      Database db = await createDatabase() ;
      return await db.delete('details' , where: 'idSQL = ?', whereArgs: [id]);
     }
}