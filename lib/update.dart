import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  //const Edit({Key? key}) : super(key: key);
  String productKey;
  Edit({required this.productKey});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController _nameController, _sectionController;

  late DatabaseReference _reference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _sectionController=TextEditingController();
    _reference =FirebaseDatabase.instance.reference().child('students');
    getProductDetail();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text('Update Data'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
              InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.production_quantity_limits_outlined,size: 30,) ,
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
                  prefixIcon: Icon(Icons.price_check,size: 30,) ,
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('Update Data',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                  saveProduct();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getProductDetail()async{
    DataSnapshot snapshot= await _reference.child(widget.productKey).once();
    Map product =snapshot.value;
    _nameController.text =product['name'];
    _sectionController.text =product['price'];
  }



  void saveProduct(){
    String name = _nameController.text;
    String section = _sectionController.text;
    Map<String,String> students={
      'name' :name,
      'section' :section,
    };
    _reference.child(widget.productKey).update(students).then((value) {
      Navigator.pop(context);
    });

  }
}


