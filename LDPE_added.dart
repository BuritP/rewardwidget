import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:recycle_project/Screen/Qrscan.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import '../Reward.dart';

class LDPE_addedWidget extends StatefulWidget {
  const LDPE_addedWidget(
      {Key? key,
      required this.trash,
      required this.value_image,
      required this.image_name,
      required this.image_file,
      required this.image_path})
      : super(key: key);
  final String trash;
  final value_image;
  final image_name;
  final image_path;
  final image_file;

  @override
  _LDPE_addedWidgetState createState() => _LDPE_addedWidgetState();
}

class _LDPE_addedWidgetState extends State<LDPE_addedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF107027),
        automaticallyImplyLeading: false,
        title: Text(
          'ขยะที่ต้องการรีไซเคิล',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRscanWidget()),
              );
            },
          )
        ],
        centerTitle: true,
        elevation: 2,
      ),
//--------------------------------------------------------------------------------------------------------
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Image.asset(
                          //ใส่รูปสัญลักษณ์
                          'assets/images/ldpe.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          //textข้างล่างรูปpete
                          'ขยะพลาสติกประเภท',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: Text(
                          //textข้างล่างรูปpete
                          '- พวกถุงพลาสติกใส -',
                          style: TextStyle(
                            color: Color(0xFF107027),
                          ),
                        ),
                      ),
                    ],
                  ),
//--------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Row(
                      //ใส่rowเพื่อใส่text
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          //ใส่text
                          'ขยะที่ต้องการรีไซเคิล',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    //line
                    thickness: 5,
                    indent: 15,
                    endIndent: 15,
                  ),
//--------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Container(
                      //ใส่containerเพื่อใส่รูปและข้อความข้างใน
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/image-from-rawpixel-id-6587639-png.png',
                          ).image,
                        ),
                        // boxShadow: [
                        //   BoxShadow(blurRadius: 4, offset: Offset(0, 2))
                        // ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(231, 168, 168, 168),
                        ),
                      ),
                      child: Column(
                        //ใส่rowในcontainer
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: 3, offset: Offset(0, 2))
                                ],
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color.fromARGB(231, 168, 168, 168),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  //ใส่รูปขยะ
                                  widget.value_image!,

                                  width: 120,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.image_name, //ชื่อขยะ
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
//--------------------------------------------------------------------------------------------------------
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Container(
                              width: 180,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Text(
                                      'จำนวน',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        110, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          child: Text(
                                            widget.trash, //จำนวนขยะ
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
//--------------------------------------------------------------------------------------------------------
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
//--------------------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: ElevatedButton(
                      //ปุ่มconfrim
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RewardWidget(),
                          ),
                        );

                        //   print('image = ${widget.value_image}');
                        //   print('value = ${widget.trash}');
                        //   print('path = ${widget.image_path}');
                        //   print('file = ${widget.image_file}');
                        //   print('name = ${widget.image_name}');
                        //   var uid = Uuid();
                        //   final uuid = uid.v1();
                        //   // //อัพโหลดรูปภาพลง storage
                        //   var image_url = await uploadImage(
                        //     gallery: widget.image_path,
                        //     image: widget.image_file,
                        //     img_name: widget.image_name,
                        //     uid: uuid,
                        //   );

                        //   final data = FirebaseFirestore.instance
                        //       .collection('trash')
                        //       .doc('52VV4yTV8NXiWz6P4X06')
                        //       .get()
                        //       .then((value) => print(value));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF107027),
                        fixedSize: Size(250, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage({gallery, image, img_name, uid}) async {
    // กำหนด _storage ให้เก็บ FirebaseStorage (สโตเลท)
    final _storage = FirebaseStorage.instance;
    // เอา path ที่เราเลือกจากเครื่องมาเเปลงเป็น File เพื่อเอาไปอัพโหลดลงใน Storage ใน Firebase
    var file = File(gallery);
    // เช็คว่ามีภาพที่เลือกไหม
    if (image != null) {
      //Upload to Firebase
      var snapshot = await _storage
          .ref()
          .child("trash/$uid") //แหล่งเก็บภาพนี้
          .putFile(file);
      //เอาลิ้ง url จากภาพที่เราได้อัปโหลดไป เอาออกมากเก็บไว้ใน downloadUrl
      var downloadURL = await snapshot.ref.getDownloadURL();
      //ส่ง URL ของรูปภาพที่อัพโหลดขึ้น stroge แล้วไปใช้ต่อ
      // print("downloadURL = ${downloadURL}");
      return downloadURL;
    } else {
      return Text("ไม่พบรูปภาพ");
    }
  }
}
