import 'package:crud/read.dart';
import 'package:crud/readCloud.dart';
import 'package:flutter/material.dart';
import 'create.dart';
import 'createCloud.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD"),),
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('create',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => create(),));

                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('read,update,delete',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => read(),));

                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('create clude',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => createCloud(),));

                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('read,update,delete Cloud',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => readCloud(),));

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
