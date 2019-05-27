import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomco_project/Database/DBHelper.dart';

class Province {
  int colIdp;
  String colAdm1Pcode;
  String colPname;


  Province();

  //CRUD FUNCTIONS
  Future<List<Province>> getProvince() async {
    List<Province> provinces;
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    List<Map> list =
        await db_connection.rawQuery('SELECT * FROM ${DBHelper.provinceTable}');
    provinces = new List();
    for (int i = 0; i < list.length; i++) {
      Province p = new Province();
      p.colIdp = list[i]['${DBHelper.colIdp}'];
      p.colAdm1Pcode = list[i]['${DBHelper.colAdm1Pcode}'];
      p.colPname = list[i]['${DBHelper.colPname}'];

      provinces.add(p);
    }
    
    }catch(e){

    }
    return provinces;
  }

  void addNewProvince(Province p) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'INSERT INTO ${DBHelper.provinceTable}(${DBHelper.colAdm1Pcode},${DBHelper.colPname}) VALUES(\'${p.colAdm1Pcode}\',\'${p.colPname}\')';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
    Fluttertoast.showToast(msg:'Province Enregistrée',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
    }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }

  void updateProvince(Province p) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'UPDATE ${DBHelper.provinceTable} SET ${DBHelper.colAdm1Pcode}=\'${p.colAdm1Pcode}\',${DBHelper.colPname}=\'${p.colPname}\' WHERE ${DBHelper.colIdp}=${p.colIdp}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
      Fluttertoast.showToast(msg:'Province modifiée',toastLength:Toast.LENGTH_SHORT,
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
