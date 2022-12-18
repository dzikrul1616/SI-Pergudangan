import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_apps/app/modules/Daftar/views/daftar_view.dart';
import 'package:uas_apps/app/modules/home/views/home_view.dart';

import '../controllers/login_controller.dart';

// class yang pertama kali muncul ketika app dijalankan
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static Future<User?> loginUsingEmailPassword(
      //fungsi dibawah ini digunakan untuk autentication email yaitu membutuhkan email dan password
      // dengan type data string
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  // Untuk control teks yang ada di form
  final emailCotroller = TextEditingController();
  final passwordCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Widget untuk menambahkan shape menggunakan gambar
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
                  // tulisan selamat datang
                  Container(
                    height: 45,
                    child: Image.asset('assets/Selamat.png'),
                  ),
                  // sezed box adalah spasi, jika height kebawah, jika width spasi kesamping
                  const SizedBox(
                    height: 10.0,
                  ),
                  // box berwarna abu abu sebagai latar belakang form dan button
                  Container(
                    height: 500,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(155, 192, 192, 192),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // menggunakan collumn agar dapat disi widget kearah bawah
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        // judul
                        Center(
                            child: Text(
                          'Masuk ke akun anda',
                          style:
                              TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
                        )),
                        // spasi
                        const SizedBox(
                          height: 20.0,
                        ),
                        // pading untuk pemberian jarak untuk meratakan kanan kiri (symetric) secara horizontal
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            //menggunakan controller email text yang sudah dibuat diatas
                            controller: emailCotroller,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: Colors.white,
                              // untuk memberi warna text
                              filled: true,
                              // pemberian border pada form
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
                        // form untuk password terditi dari padding dan form sama sepereti yang diatas
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(),
                            child: TextFormField(
                              //menggunakan controller password text yang sudah dibuat diatas
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Digunakan klik pada teks agar dapat dinavigasi ke dalam page yang di inginkan
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Lupa Password?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Tombol untuk masuk dengan menggunakan akun auth dari firebase
                        ElevatedButton(
                          onPressed: () async {
                            //masukkan controller yang telah dibuaty dan validasi akun
                            User? user = await loginUsingEmailPassword(
                                email: emailCotroller.text,
                                password: passwordCotroller.text,
                                context: context);
                            print(user);
                            if (user != null) {
                              // ketika akun terdaftar akan menuju ke halaman home
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            }
                          },
                          // teks dari button masuk
                          child: Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            child: Text(
                              'Masuk',
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
                        // text lainnya
                        Center(
                            child: Text(
                          '-------- Atau masuk melalui --------',
                          style:
                              TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
                        )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // button untuk klik sebuah gambar untuk login google ( belum di set hanya login dengan email dan password)
                        FlatButton(
                          //nav masi kosong
                            onPressed: () {},
                            // assets gambar dari icon
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/google.png'),
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          // teks belum punya akun yang tanpa ada action
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun? ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 88, 88, 88)),
                            ),
                            // Teks daftar disini dapat di klik dan akan menuju ke halaman daftar menggunakan Gestur detector
                            GestureDetector(
                              onTap: () {
                                Get.to(() => DaftarView(),
                                    transition: Transition.circularReveal,
                                    duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Daftar disini",
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
