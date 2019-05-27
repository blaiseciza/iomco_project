import 'package:flutter/material.dart';
import 'package:iomco_project/identification.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff416391),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("IOMCO",style: TextStyle(fontSize: 30.0,color: Colors.white),),
              ),
              Text('Collect data become easier',style: TextStyle(fontSize: 18.0,color: Colors.white),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.directions_run,color: Color(0xff5FBED4),size: MediaQuery.of(context).size.height/2.0,),
              ),
              
              
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: Container(
                          
                          height: 55,
                          width: MediaQuery.of(context).size.width / 1.0,
                          decoration: BoxDecoration(
                              color: Color(0xffE06F4D),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => Identification()));
                              },
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.normal,fontSize:MediaQuery.of(context).size.height/14 ),
                              ),
                            ),
                          ),
                          
                        ),
              ),
            ],
          ),
        ),
      )
    );
  }
}