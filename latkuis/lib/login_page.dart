// Import Flutter Material Design
import 'package:flutter/material.dart';

// Import halaman Home
import 'home_page.dart';


// ==========================================================
// LOGIN PAGE
// ==========================================================
// StatefulWidget digunakan karena isi TextField
// dan status password dapat berubah.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


// ==========================================================
// STATE LOGIN PAGE
// ==========================================================
class _LoginPageState extends State<LoginPage> {

  // Controller untuk mengambil isi username
  final TextEditingController usernameController =
      TextEditingController();

  // Controller untuk mengambil isi password
  final TextEditingController passwordController =
      TextEditingController();


  // Menentukan apakah password sedang ditampilkan
  bool isPasswordVisible = false;


  // ========================================================
  // FUNCTION LOGIN
  // ========================================================
  void login() {

    // Mengambil username dari TextField
    final username =
        usernameController.text.trim();

    // Mengambil password dari TextField
    final password =
        passwordController.text.trim();


    // Mengecek apakah username dan password kosong
    if (username.isEmpty || password.isEmpty) {

      // Menampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Username dan password harus diisi',
          ),
        ),
      );

      return;
    }


    // ======================================================
    // LOGIN BERHASIL
    // ======================================================
    // Untuk aplikasi latihan, semua username/password
    // yang diisi dianggap berhasil login.
    Navigator.pushReplacement(
      context,

      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ====================================================
      // BODY
      // ====================================================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 60),


              // =================================================
              // ICON / LOGO
              // =================================================
              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.restaurant,
                  size: 55,
                  color: Colors.orange,
                ),
              ),


              const SizedBox(height: 25),


              // =================================================
              // JUDUL
              // =================================================
              const Text(
                'Resto Kita',

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 8),


              // Subjudul
              const Text(
                'Silakan login untuk melanjutkan',

                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),


              const SizedBox(height: 40),


              // =================================================
              // USERNAME
              // =================================================
              TextField(
                controller: usernameController,

                decoration: InputDecoration(
                  labelText: 'Username',

                  hintText: 'Masukkan username',

                  prefixIcon: const Icon(
                    Icons.person,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),


              const SizedBox(height: 20),


              // =================================================
              // PASSWORD
              // =================================================
              TextField(
                controller: passwordController,

                // Menyembunyikan password
                obscureText: !isPasswordVisible,

                decoration: InputDecoration(
                  labelText: 'Password',

                  hintText: 'Masukkan password',

                  prefixIcon: const Icon(
                    Icons.lock,
                  ),

                  // Tombol untuk menampilkan /
                  // menyembunyikan password
                  suffixIcon: IconButton(
                    onPressed: () {

                      setState(() {
                        isPasswordVisible =
                            !isPasswordVisible;
                      });
                    },

                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
              ),


              const SizedBox(height: 30),


              // =================================================
              // TOMBOL LOGIN
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: login,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.orange,

                    foregroundColor:
                        Colors.white,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    'LOGIN',

                    style: TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 25),


              // =================================================
              // INFORMASI
              // =================================================
              const Text(
                'Masukkan username dan password\n'
                'untuk masuk ke aplikasi Resto Kita',

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // ========================================================
  // MEMBERSIHKAN CONTROLLER
  // ========================================================
  @override
  void dispose() {

    // Menghapus controller username
    usernameController.dispose();

    // Menghapus controller password
    passwordController.dispose();

    super.dispose();
  }
}