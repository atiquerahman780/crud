import 'package:crud/update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

//import 'edit.dart';

class read extends StatefulWidget {
  const read({Key? key}) : super(key: key);

  @override
  _readState createState() => _readState();
}

class _readState extends State<read> {

  late Query _ref;
  DatabaseReference reference=FirebaseDatabase.instance.reference().child('students');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('students').orderByChild('name');
  }
  Widget _buildPrductItem({required Map students}){

    /* GridView.count(
      crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Container(*/

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
                  Text(students['name'],
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
                  Text(students['section'],
                    style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w600),),
                ],
              ),


              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Edit(productKey: students['key'],  )));

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
                      _showDeleteDialog(productKey: students['key']);
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

  }
  _showDeleteDialog({required String productKey}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Delete '),
        content: Text('Are you sure to Delete'),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(context);
          },
              child: Text('cancel')),

          FlatButton(onPressed: (){
            reference.child(productKey).remove().whenComplete(() => Navigator.pop(context));
          },
              child: Text('delete')),

        ],

      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('students'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,itemBuilder: (BuildContext context,
            DataSnapshot snapshot,
            Animation<double>animation,int index){
          Map students=snapshot.value;
          students['key'] = snapshot.key;
          return _buildPrductItem(students: students);
        },),

      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return AddProducts();
          }));

        },
        child: Icon(Icons.add,color: Colors.white,),
      ),*/

    );
  }
}
