import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uas_apps/app/modules/home/views/home_view.dart';

import '../controllers/barang_masuk_controller.dart';

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
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('barang').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            // height: 55,
                            // width: 500,
                            // decoration: BoxDecoration(
                            //   color: Color(0xff002050),
                            //   borderRadius: BorderRadius.circular(8),
                            // ),
                            child: Center(
                              child: Row(
                                children: [
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

// class ItemBarang extends StatelessWidget {
//   final List<DocumentSnapshot> listBarang;

//   const ItemBarang({Key? key, this.listBarang}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {}
// }

// class BarangMasukView extends StatelessWidget {
//   final List<DocumentSnapshot> listBarang;

//   const BarangMasukView({super.key, required this.listBarang});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 0, 70, 128),
//           title: const Text('Barang Masuk'),
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {
//                 Get.to(() => HomeView(),
//                     transition: Transition.circularReveal,
//                     duration: Duration(seconds: 2));
//               },
//               icon: Icon(Icons.arrow_back)),
//         ),
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const SizedBox(
//               height: 20.0,
//             ),
//             Text(
//               'Masukkan Data Baru',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 31, 76, 155),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Nomor',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 229, 122, 0),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 50.0,
//                 ),
//                 Text(
//                   '122345',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 147, 147, 147),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Tanggal',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 229, 122, 0),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 41.0,
//                 ),
//                 Text(
//                   DateFormat('dd-MM-yyyy').format(DateTime.now()),
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 147, 147, 147),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Jam',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 229, 122, 0),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 73.0,
//                 ),
//                 Text(
//                   DateFormat('KK:mm:ss a').format(DateTime.now()),
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 147, 147, 147),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             ListView.builder(
//                 itemCount: listBarang == null ? 0 : listBarang.length,
//                 itemBuilder: (context, i) {
//                   String JenisBarang =
//                       listBarang[i].data['Jenis barang'].toString();
//                 })
//           ]),
//         )));
//   }
// }
