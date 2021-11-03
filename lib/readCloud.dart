import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/updateCloude.dart';
import 'package:flutter/material.dart';

class readCloud extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("students"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                print("lllllllllllllll");
                print(doc.id);
                print("befor");
                print(doc.data() as Map);
                print("after");
                var l=doc.data() as Map;
                print(l['name']);
               // print()
                return Container(
                  //height: 200,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                              Text(l['name'],
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w600),),

                            ],

                          ),
                          Row(
                            children: [
                              Icon(Icons.price_check,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                              Text(l['section'],
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w600),),
                            ],
                          ),


                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> Edit(productKey: doc.id,  )));

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit,color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 7,),
                                    Text('Edit',
                                      style: TextStyle(fontSize: 16,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),),
                                    SizedBox(width: 19,),

                                  ],

                                ),

                              ),

                              GestureDetector(
                                onTap: (){
                                  final collection = FirebaseFirestore.instance.collection('users');
                                  collection
                                      .doc(doc.id) // <-- Doc ID to be deleted.
                                      .delete() // <-- Delete
                                      .then((_) => print('Deleted'))
                                      .catchError((error) => print('Delete failed: $error'));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.delete,color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 7,),
                                    Text('Delete',
                                      style: TextStyle(fontSize: 16,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),),
                                    SizedBox(width: 19,),

                                  ],
                                ),
                              )
                            ],
                          )
                          ,Divider(height: 20,)
                        ],
                      ),


                    ],
                  ),
                );

              }).toList(),
            );
        },
      ),
    );
  }
}