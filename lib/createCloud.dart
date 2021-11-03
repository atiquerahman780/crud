
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class createCloud extends StatefulWidget {
  const createCloud({Key? key}) : super(key: key);

  @override
  _createState createState() => _createState();
}

class _createState extends State<createCloud> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }
  CollectionReference users= FirebaseFirestore.instance.collection("users");
  var newDocRef = FirebaseFirestore.instance.collection('users').doc();
  late TextEditingController _nameController, _sectionController;

  //late DatabaseReference _reference;
  // late FirebaseFirestore _firestore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _sectionController=TextEditingController();
   // _reference =FirebaseDatabase.instance.reference().child('students');
    // _firestore = FirebaseFirestore.instance.collection("users") as FirebaseFirestore;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD"),),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
              InputDecoration(
                  hintText: 'Name',
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _sectionController,
              decoration:
              InputDecoration(
                  hintText: 'Section',
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('Save Data',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: ()async{
                  var newDocRef = FirebaseFirestore.instance.collection('users').doc();
                  print(newDocRef);
                  print("lllllllllllllllllll");
                  //var newDocRef = db.collection('users').doc();

                  String name = _nameController.text;
                  String section = _sectionController.text;
                  String id=newDocRef.id;
                  //print();
                  print(users.id);
                   Map<String,String> student={
                      'name' :name,
                       'section' :section,
                     'id':id
                     };


                  await users.add(student).then((value) => print('user added') );
                  Navigator.pop(context);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
