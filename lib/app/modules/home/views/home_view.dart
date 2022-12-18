import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_apps/app/modules/BarangKeluar/controllers/barang_keluar_controller.dart';
import 'package:uas_apps/app/modules/BarangKeluar/views/barang_keluar_view.dart';
import 'package:uas_apps/app/modules/BarangMasuk/views/barang_masuk_view.dart';
import 'package:uas_apps/app/modules/JenisBarang/views/jenis_barang_view.dart';
import 'package:uas_apps/app/modules/Keluar/views/keluar_view.dart';
import 'package:uas_apps/app/modules/Kontraktor/views/kontraktor_view.dart';
import 'package:uas_apps/app/modules/Login/views/login_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // final user ini digunakan untuk memanggil nama user akun 
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 76, 155),
        drawer: Drawer(
          child: ListView(
              // slide dari kanan ke kiri berisikan profil, email akun
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user.displayName ?? ''),
                accountEmail: Text(user.email!),
                currentAccountPicture: const CircleAvatar(),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 32, 80),
                ),
              ),
              // tombol logout
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text("Logout"),
                onTap: () {
                  // tombol logout menggunakan firebase out mengarah ke halaman login apabila berhasil
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  });
                },
              )
            ],
          ),
        ),
        // isi dari halaman home
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // tombol keluar
                  IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed Out");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      });
                    },
                    icon: Icon(Icons.logout),
                    color: Colors.white,
                    iconSize: 30,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // text statis
            Text(
              'SISTEM INFORMASI PERGUDANGAN',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // icon barang masuk navigasi kearah barang masuk
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => BarangMasukView(),
                                transition: Transition.circularReveal,
                                duration: Duration(seconds: 2));
                          },
                          icon: Icon(Icons.download),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // judul icon
                      Text(
                        'Barang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      // icon barang kelaur navigasi kearah barang keluar
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => KeluarView(),
                                transition: Transition.circularReveal,
                                duration: Duration(seconds: 2));
                          },
                          icon: Icon(Icons.upload),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // judul icon
                      Text(
                        'Barang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Keluar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      // icon jenis barang navigasi kearah jenis barang 
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => JenisBarangView(),
                                transition: Transition.circularReveal,
                                duration: Duration(seconds: 2));
                          },
                          icon: Icon(Icons.card_travel),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // judul icon
                      Text(
                        'Jenis',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Barang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      // icon data kontraktor navigasi kearah data kontraktor
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => KontraktorView(),
                                transition: Transition.circularReveal,
                                duration: Duration(seconds: 2));
                          },
                          icon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // icon judul
                      Text(
                        'Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Kontraktor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            // gambar assets 
            Container(
              height: 200,
              child: Image.asset('assets/home.png'),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              // tombol masukkan data yang akan menuju ke barang keluar yang fungsinya sebagai menambahkan data
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => BarangKeluarView(),
                      transition: Transition.circularReveal,
                      duration: Duration(seconds: 2));
                },
                // button stylenya 
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Masukkan Data Baru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(248, 31, 76, 155),
                      ),
                    ),
                  ),
                ),
                // warna button
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              // tombol data barang masuk navigasi kearah barang masuk
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => BarangMasukView(),
                      transition: Transition.circularReveal,
                      duration: Duration(seconds: 2));
                },
                // style dari tombol
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Data Barang Masuk',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // warna tombol
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 32, 80),
                ),
              ),
            ),
          ],
        )));
  }
}
