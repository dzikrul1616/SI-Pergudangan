import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_apps/app/modules/Login/views/login_view.dart';
import 'package:uas_apps/app/modules/home/views/home_view.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  // control text untuk form dan validasi
  final usernameCotroller = TextEditingController();
  final emailCotroller = TextEditingController();
  final passwordCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Vector.png'), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 150.0,
                  ),
                  Container(
                    height: 45,
                    child: Image.asset('assets/Selamat.png'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 450,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(155, 192, 192, 192),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        // teks buat akun
                        Center(
                            child: Text(
                          'Buat Akun Baru',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 17, 68, 177)),
                        )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // form username dengan controller
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            controller: usernameCotroller,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              labelText: 'Masukkan Username',
                              hintText: 'Masukkan Username',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // form email dengan controller
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            controller: emailCotroller,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              labelText: 'Masukkan Email',
                              hintText: 'Masukkan Email',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        // form password dengan controller beserta obs text agar tidak terlihat
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(),
                            child: TextFormField(
                              controller: passwordCotroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none)),
                                  labelText: 'Masukkan Password',
                                  prefixIconColor: Colors.black,
                                  prefixIcon: Icon(
                                    Icons.key_outlined,
                                  ),
                                  hintText: 'Masukkan Password'),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // tombol daftar 
                        ElevatedButton(
                          onPressed: () {
                            // melakukan pendaftaran menggunakan email sesuai dengan controller text
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailCotroller.text,
                                    password: passwordCotroller.text)
                                .then((value) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(value.user!.uid)
                                  .set({"email": value.user!.email});
                              // jika berhasil akan menuju halaman home
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          },
                          // style tombol
                          child: Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 70, 128),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //text statis
                            Text(
                              'Sudah punya akun? ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 88, 88, 88)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const LoginView(),
                                    transition: Transition.circularReveal,
                                    duration: Duration(seconds: 2));
                              },
                              // text yang dapat di klik menuju halaman lohin
                              child: Text(
                                "Masuk disini",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 70, 128),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
