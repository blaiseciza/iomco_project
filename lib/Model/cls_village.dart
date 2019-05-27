import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomco_project/Database/DBHelper.dart';

class Village {
  int colIdv;
  String colcodeasv;
  String colNumordrevlg;
  String colCodevlg;
  String colNamevlg;

  Village();

  //CRUD FUNCTIONS
  Future<List<Village>> getVillages(String codeAs) async {
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    List<Map> list =
        await db_connection.rawQuery('SELECT * FROM ${DBHelper.villageTable} WHERE ${DBHelper.colcodeasv}=\'$codeAs\'');
    List<Village> villages = new List();
    for (int i = 0; i < list.length; i++) {
      Village village = new Village();
      village.colIdv = list[i]['${DBHelper.colIdv}'];
      village.colcodeasv = list[i]['${DBHelper.colcodeasv}'];
      village.colCodevlg = list[i]['${DBHelper.colCodevlg}'];
      village.colNamevlg = list[i]['${DBHelper.colNamevlg}'];
      village.colNumordrevlg = list[i]['${DBHelper.colNumordrevlg}'];

      villages.add(village);
    }
    return villages;
  }

  //Add new Contact
  void addNewVillage(Village vlg) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'INSERT INTO ${DBHelper.villageTable}(${DBHelper.colcodeasv},${DBHelper.colCodevlg},${DBHelper.colNamevlg},${DBHelper.colNumordrevlg}) VALUES(\'${vlg.colcodeasv}\',\'${vlg.colCodevlg}\',\'${vlg.colNamevlg}\',\'${vlg.colNumordrevlg}\')';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
    Fluttertoast.showToast(msg:'Village was saved',toastLength:Toast.LENGTH_SHORT,
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
  void updateVillage(Village vlg) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'UPDATE ${DBHelper.villageTable} SET ${DBHelper.colcodeasv}=\'${vlg.colcodeasv}\',${DBHelper.colCodevlg}=\'${vlg.colCodevlg}\',${DBHelper.colNamevlg}=\'${vlg.colNamevlg}\',${DBHelper.colNumordrevlg}=\'${vlg.colNumordrevlg}\' WHERE ${DBHelper.colIdv}=${vlg.colIdv}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
      Fluttertoast.showToast(msg:'Village was updated',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
     }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }

  //delete contacts
  void deleteContact(Village vlg) async {
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query = 'DELETE FROM ${DBHelper.villageTable} WHERE id=${vlg.colIdv}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
  }
}
