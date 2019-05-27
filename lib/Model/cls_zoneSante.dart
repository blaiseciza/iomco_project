import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomco_project/Database/DBHelper.dart';

class ZoneSante {
  int colIdz;
  String colAdm2pcodez;
  String colCodezs;
  String colNamezs;

  ZoneSante();

  //CRUD FUNCTIONS
  Future<List<ZoneSante>> getZoneSantes(String codeTerritoire) async {
    List<ZoneSante> zSantes;
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    List<Map> list =
        await db_connection.rawQuery('SELECT * FROM ${DBHelper.zonedesanteTable} WHERE ${DBHelper.colAdm2pcodez}=\'$codeTerritoire\'');
    zSantes = new List();
    for (int i = 0; i < list.length; i++) {
      ZoneSante zs = new ZoneSante();
      zs.colIdz = list[i]['${DBHelper.colIdz}'];
      zs.colCodezs = list[i]['${DBHelper.colCodezs}'];
      zs.colNamezs = list[i]['${DBHelper.colNamezs}'];
      zs.colAdm2pcodez = list[i]['${DBHelper.colAdm2pcodez}'];

      zSantes.add(zs);
    }
    
    }catch(e){

    }
    return zSantes;
  }

  //Add new Contact
  void addNewZoneSante(ZoneSante zs) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'INSERT INTO ${DBHelper.zonedesanteTable}(${DBHelper.colCodezs},${DBHelper.colNamezs},${DBHelper.colAdm2pcodez}) VALUES(\'${zs.colCodezs}\',\'${zs.colNamezs}\',\'${zs.colAdm2pcodez}\')';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
    Fluttertoast.showToast(msg:'Zone de Santé Enregistrée',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
    }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }

  //update contacts
  void updateZoneSante(ZoneSante zs) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'UPDATE ${DBHelper.zonedesanteTable} SET ${DBHelper.colCodezs}=\'${zs.colCodezs}\',${DBHelper.colNamezs}=\'${zs.colNamezs}\',${DBHelper.colAdm2pcodez}=\'${zs.colAdm2pcodez}\' WHERE ${DBHelper.colIdz}=${zs.colIdz}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
      Fluttertoast.showToast(msg:'Zone de Santé modifiée',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
     }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }
}
