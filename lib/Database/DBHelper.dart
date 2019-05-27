import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  //d
  static String provinceTable = 'province';
	static String colIdp = 'id';
	static String colAdm1Pcode = 'adm1_pcode';
	static String colPname = 'pname';

  static String territoireTable = 'territoire';
	static String colIdt = 'id';
	static String colAdm2pcode = 'adm2_pcode';
	static String colTname = 'tname';
  static String colAdm1pcodet = 'adm1_pcode';

  static String zonedesanteTable = 'zonedesante';
	static String colIdz = 'id';
	static String colAdm2pcodez = 'adm2_pcode';
	static String colCodezs = 'codezs';
  static String colNamezs = 'namezs';

  static String airedesanteTable = 'airedesante';
	static String colIda = 'id';
	static String colCodezsa = 'codezs';
	static String colNumOrdreAs = 'numordre_as';
  static String colCodeas = 'Codeas';
  static String colNameas = 'nameas';

  static String villageTable = 'village';
	static String colIdv = 'id';
	static String colcodeasv = 'Codeas';
	static String colNumordrevlg = 'numordrevlg';
  static String colCodevlg = 'Codevlg';
  static String colNamevlg = 'namevlg';
  static Database db_instance;

  Future<Database> get db async{
    if(db_instance==null)
    db_instance=await initDB();
    return db_instance;
  }

  initDB() async{
    io.Directory documentsDirectory= await getApplicationDocumentsDirectory();
    String path=join(documentsDirectory.path,"iomcoapp.db");
    var db=await openDatabase(path,version:1,onCreate: oncreateFunc);
        return db;
      }
    
      void oncreateFunc(Database db, int version) async {
        //create table
    await db.execute('CREATE TABLE $provinceTable ($colIdp INTEGER PRIMARY KEY AUTOINCREMENT, $colAdm1Pcode TEXT NOT NULL UNIQUE, $colPname TEXT NOT NULL)');
    await db.execute('CREATE TABLE $territoireTable ($colIdt INTEGER PRIMARY KEY AUTOINCREMENT, $colAdm2pcode TEXT NOT NULL UNIQUE, $colTname TEXT UNIQUE, $colAdm1pcodet TEXT NOT NULL)');
    await db.execute('CREATE TABLE $zonedesanteTable ($colIdz INTEGER PRIMARY KEY AUTOINCREMENT, $colAdm2pcodez TEXT NOT NULL, $colCodezs TEXT NOT NULL UNIQUE, $colNamezs TEXT NOT NULL UNIQUE)');
    await db.execute('CREATE TABLE $airedesanteTable ($colIda INTEGER PRIMARY KEY AUTOINCREMENT, $colCodezsa TEXT NOT NULL, $colNumOrdreAs TEXT NOT NULL, $colCodeas TEXT NOT NULL UNIQUE , $colNameas TEXT NOT NULL UNIQUE)');
    await db.execute('CREATE TABLE $villageTable ($colIdv INTEGER PRIMARY KEY AUTOINCREMENT, $colcodeasv TEXT NOT NULL, $colNumordrevlg TEXT NOT NULL, $colCodevlg TEXT NOT NULL UNIQUE , $colNamevlg TEXT NOT NULL UNIQUE)');
  }

    //generate code
  // Future<String> getCode(String countParam,String tblParam,String condition,String value) async {
  //   String code;
  //   try{
  //   var db_connection=await db;
  //       int compteur=Sqflite.firstIntValue(await db_connection.rawQuery('SELECT COUNT($countParam) as nombre FROM $tblParam WHERE $condition=\'$value\''));
  //       if(compteur.isNaN || compteur==null || compteur==0){
  //         code=value+'001';
  //       }else{
  //         if(compteur<10){code=value+'00'+'$compteur';}
  //         else if(compteur>=10 && compteur<100){code=value+'0'+'$compteur';}
  //         else if(compteur>=100 && compteur<1000){code=value+'$compteur';}
  //       }

  //   }catch(e){
  //     print(e);
  //   }
  //       return code;
  // }    
      
}