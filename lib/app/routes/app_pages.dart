import 'package:get/get.dart';

import '../modules/BarangKeluar/bindings/barang_keluar_binding.dart';
import '../modules/BarangKeluar/views/barang_keluar_view.dart';
import '../modules/BarangMasuk/bindings/barang_masuk_binding.dart';
import '../modules/BarangMasuk/views/barang_masuk_view.dart';
import '../modules/Daftar/bindings/daftar_binding.dart';
import '../modules/Daftar/views/daftar_view.dart';
import '../modules/JenisBarang/bindings/jenis_barang_binding.dart';
import '../modules/JenisBarang/views/jenis_barang_view.dart';
import '../modules/Keluar/bindings/keluar_binding.dart';
import '../modules/Keluar/views/keluar_view.dart';
import '../modules/Kontraktor/bindings/kontraktor_binding.dart';
import '../modules/Kontraktor/views/kontraktor_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  //route (alamat) yang digunakan ketika ingin melakukan perpindahan page
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.BARANG_KELUAR,
      page: () => BarangKeluarView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: _Paths.JENIS_BARANG,
      page: () => const JenisBarangView(),
      binding: JenisBarangBinding(),
    ),
    GetPage(
      name: _Paths.BARANG_MASUK,
      page: () => const BarangMasukView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: _Paths.KONTRAKTOR,
      page: () => const KontraktorView(),
      binding: KontraktorBinding(),
    ),
    GetPage(
      name: _Paths.KELUAR,
      page: () => const KeluarView(),
      binding: KeluarBinding(),
    ),
  ];
}
