import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uas_apps/app/modules/home/views/home_view.dart';

import '../controllers/barang_masuk_controller.dart';

// halaman untuk menampilkan data barang masuk

class BarangMasukView extends StatefulWidget {
  const BarangMasukView({Key? key}) : super(key: key);

  @override
  State<BarangMasukView> createState() => _BarangMasukViewState();
}

class _BarangMasukViewState extends State<BarangMasukView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 70, 128),
        title: const Text('Barang Masuk'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.to(() => HomeView(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 2));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          // stream untuk menampilkan data yang sudah diinput dan dipanggil dari firestore menggunakan firebase_storage
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('barang').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  //list builder untuk membuat widget sesuai data yang telah di input
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            child: Center(
                              // data akan ditampilkan dalam bentuk sejajar dan dipanggil sesuai isi collection 'barang'
                              child: Row(
                                children: [
                                  // kontraktor
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['ID Kontraktor'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  // jenis barang
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['Jenis barang'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  // no pol truk
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['No Pol Truk'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  // nomor kontak
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['Nomor Kontak'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}
