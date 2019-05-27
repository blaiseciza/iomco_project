import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomco_project/Database/DBHelper.dart';

class AirSante {
  int colIda;
  String colcodezsa;
  String colNumordreAs;
  String colCodeAs;
  String colNameAs;

  AirSante();

  //CRUD FUNCTIONS
  //get contacts
  Future<List<AirSante>> getAirSante(String codeZone) async {
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    List<Map> list =
        await db_connection.rawQuery('SELECT * FROM ${DBHelper.airedesanteTable} WHERE ${DBHelper.colCodezsa}=\'$codeZone\'');
    List<AirSante> airSantes = new List();
    for (int i = 0; i < list.length; i++) {
      AirSante airS = new AirSante();
      airS.colIda = list[i]['${DBHelper.colIda}'];
      airS.colcodezsa = list[i]['${DBHelper.colCodezsa}'];
      airS.colCodeAs = list[i]['${DBHelper.colCodeas}'];
      airS.colNameAs = list[i]['${DBHelper.colNameas}'];
      airS.colNumordreAs = list[i]['${DBHelper.colNumOrdreAs}'];

      airSantes.add(airS);
    }
    return airSantes;
  }

  //Add new Contact
  void addNewAirSante(AirSante asante,String codeZone) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'INSERT INTO ${DBHelper.airedesanteTable}(${DBHelper.colCodezsa},${DBHelper.colCodeas},${DBHelper.colNameas},${DBHelper.colNumOrdreAs}) VALUES(\'${asante.colcodezsa}\',\'${asante.colCodeAs}\',\'${asante.colNameAs}\',\'${asante.colNumordreAs}\')';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
    Fluttertoast.showToast(msg:'Air de Santé enregistré',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
    }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }

  void updateAirSante(AirSante asante) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'UPDATE ${DBHelper.airedesanteTable} SET ${DBHelper.colCodezsa}=\'${asante.colcodezsa}\',${DBHelper.colCodeas}=\'${asante.colCodeAs}\',${DBHelper.colNameas}=\'${asante.colNameAs}\',${DBHelper.colNumOrdreAs}=\'${asante.colNumordreAs}\' WHERE ${DBHelper.colIda}=${asante.colIda}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
      Fluttertoast.showToast(msg:'Air de santé modifié',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
     }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }}