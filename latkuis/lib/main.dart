// Import package Flutter Material Design
import 'package:flutter/material.dart';

// Import halaman Login
import 'login_page.dart';


// ==========================================================
// PROGRAM UTAMA
// ==========================================================

void main() {
  // Menjalankan aplikasi Flutter
  runApp(const MyApp());
}


// ==========================================================
// MY APP
// ==========================================================
// MyApp adalah widget utama aplikasi
class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    // MaterialApp digunakan sebagai konfigurasi utama aplikasi
    return MaterialApp(

      // Menghilangkan tulisan DEBUG
      // di pojok kanan atas aplikasi
      debugShowCheckedModeBanner: false,


      // Judul aplikasi
      title: 'Resto Kita',


      // ====================================================
      // TEMA APLIKASI
      // ====================================================
      theme: ThemeData(

        // Membuat warna tema berdasarkan warna orange
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),

        // Menggunakan Material Design 3
        useMaterial3: true,
      ),


      // ====================================================
      // HALAMAN PERTAMA
      // ====================================================
      // Saat aplikasi dibuka,
      // halaman yang pertama muncul adalah LoginPage
      home: const LoginPage(),
    );
  }
}