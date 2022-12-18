import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uas_apps/app/modules/BarangMasuk/views/barang_masuk_view.dart';
import 'package:uas_apps/app/modules/home/views/home_view.dart';

import '../controllers/barang_keluar_controller.dart';

// Nama class barang keluar tapi fungsinya untuk tambah data
class BarangKeluarView extends StatefulWidget {
  const BarangKeluarView({Key? key}) : super(key: key);

  @override
  State<BarangKeluarView> createState() => _BarangKeluarViewState();
}

class _BarangKeluarViewState extends State<BarangKeluarView> {
  //controller text untuk CRUD
  final jenisController = TextEditingController();
  final nomorController = TextEditingController();
  final kontraktorController = TextEditingController();
  final trukController = TextEditingController();
  final timbanganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection('barang');
    return Scaffold(
      // bar aplikasi 
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 70, 128),
        title: const Text('Tambah Barang Masuk'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.to(() => HomeView(),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 2));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      // safe area agar tidak nabrak dengan kerai notifikasi 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // teks 
              Text(
                'Masukkan Data Baru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 31, 76, 155),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // row teks dengan data statis
              Row(
                children: [
                  Text(
                    'Nomor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 229, 122, 0),
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    '122345',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 147, 147),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  // tanggal data static
                  Text(
                    'Tanggal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 229, 122, 0),
                    ),
                  ),
                  const SizedBox(
                    width: 41.0,
                  ),
                  // format teks hari berdasarkan waktu saat ini menggunakan package intl dari Pubsc
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 147, 147),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    'Jam',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 229, 122, 0),
                    ),
                  ),
                  const SizedBox(
                    width: 73.0,
                  ),
                  // format teks hari berdasarkan waktu saat ini menggunakan package intl dari Pubsc
                  Text(
                    DateFormat('KK:mm:ss a').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 147, 147),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      //jenis teks barang
                      child: Text(
                        'Jenis Barang',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 76, 155),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    // menggunakan flexible agar form dapat muncul ketika dijadikan row
                    Flexible(
                        child: TextField(
                      controller: jenisController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(190, 212, 212, 212),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                                color: Color.fromARGB(255, 201, 201, 201))),
                      ),
                    )),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //form nomor kotnak
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Nomor Kontak',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 76, 155),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                        child: TextField(
                      controller: nomorController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(190, 212, 212, 212),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                                color: Color.fromARGB(255, 201, 201, 201))),
                      ),
                    )),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // form id kotnraktor
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'ID Kontraktor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 76, 155),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Flexible(
                        child: TextField(
                      controller: kontraktorController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(190, 212, 212, 212),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                                color: Color.fromARGB(255, 201, 201, 201))),
                      ),
                    )),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // form no pol truk
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'No. Pol. Truk',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 76, 155),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    Flexible(
                        child: TextField(
                      controller: trukController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(190, 212, 212, 212),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                                color: Color.fromARGB(255, 201, 201, 201))),
                      ),
                    )),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
               // form timbangan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Timbangan',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 76, 155),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 43.0,
                    ),
                    Flexible(
                        child: TextField(
                      controller: timbanganController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(190, 212, 212, 212),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 10,
                                style: BorderStyle.none,
                                color: Color.fromARGB(255, 201, 201, 201))),
                      ),
                    )),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // save button 
                    ElevatedButton(
                      onPressed: () {
                        // menggunakan controller untuk menambahkan data yang terdiri dari data berikut :
                        barang.add({
                          'Tanggal': DateFormat('dd-MM-yyyy KK:mm:ss a')
                              .format(DateTime.now()),
                          'Jenis barang': jenisController.text,
                          'Nomor Kontak': nomorController.text,
                          'ID Kontraktor': kontraktorController.text,
                          'No Pol Truk': trukController.text,
                          'Timbangan':
                              int.tryParse(timbanganController.text) ?? 0
                        });

                        jenisController.text = '';
                        nomorController.text = '';
                        trukController.text = '';
                        kontraktorController.text = '';
                        timbanganController.text = '';
                        // dengan navigasi kearah barang masuk
                        Get.to(() => BarangMasukView(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 2));
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // warna button
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 70, 128),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
