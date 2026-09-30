// Import Flutter Material Design
import 'package:flutter/material.dart';

// Import model FoodItem
import 'food_item.dart';


// ==========================================================
// DETAIL PAGE
// ==========================================================
// StatefulWidget digunakan karena quantity dapat berubah.
class DetailPage extends StatefulWidget {

  // Data makanan yang dikirim dari HomePage
  final FoodItem food;


  // Constructor DetailPage
  const DetailPage({
    super.key,

    // food wajib dikirim dari HomePage
    required this.food,
  });


  @override
  State<DetailPage> createState() => _DetailPageState();
}


// ==========================================================
// STATE DETAIL PAGE
// ==========================================================
class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {

    // Mengambil data makanan yang dikirim
    // dari HomePage
    final food = widget.food;


    return Scaffold(

      // ====================================================
      // APP BAR
      // ====================================================
      appBar: AppBar(

        // Judul halaman
        title: const Text('Detail Makanan'),

        centerTitle: true,
      ),


      // ====================================================
      // BODY
      // ====================================================
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // =================================================
            // GAMBAR MAKANAN
            // =================================================
            Image.network(
              food.imageUrl,

              // Lebar mengikuti layar
              width: double.infinity,

              // Tinggi gambar
              height: 250,

              // Gambar memenuhi area
              fit: BoxFit.cover,

              // Jika gambar gagal dimuat
              errorBuilder:
                  (context, error, stackTrace) {

                return Container(
                  width: double.infinity,
                  height: 250,

                  color: Colors.grey.shade300,

                  child: const Icon(
                    Icons.fastfood,
                    size: 80,
                  ),
                );
              },
            ),


            // =================================================
            // INFORMASI MAKANAN
            // =================================================
            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // Nama makanan
                  Text(
                    food.name,

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 8),


                  // Harga makanan
                  Text(
                    'Rp ${food.formattedPrice}',

                    style: const TextStyle(
                      fontSize: 21,
                      color: Colors.orange,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 20),


                  // Judul deskripsi
                  const Text(
                    'Deskripsi',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 6),


                  // Deskripsi makanan
                  Text(
                    food.description,

                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),


                  const SizedBox(height: 30),


                  // =================================================
                  // JUMLAH PESANAN
                  // =================================================
                  const Text(
                    'Jumlah Pesanan',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),


                  const SizedBox(height: 12),


                  // Baris tombol quantity
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      // =============================================
                      // TOMBOL KURANG
                      // =============================================
                      IconButton(
                        onPressed:
                            food.quantity > 0
                                ? () {

                                    // Mengurangi quantity
                                    setState(() {
                                      food.quantity--;
                                    });
                                  }
                                : null,

                        icon: const Icon(
                          Icons.remove_circle,
                        ),

                        iconSize: 45,
                      ),


                      // =============================================
                      // JUMLAH
                      // =============================================
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10),

                          color:
                              Colors.orange.shade50,
                        ),

                        child: Text(
                          '${food.quantity}',

                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),


                      // =============================================
                      // TOMBOL TAMBAH
                      // =============================================
                      IconButton(
                        onPressed: () {

                          // Menambah quantity
                          setState(() {
                            food.quantity++;
                          });
                        },

                        icon: const Icon(
                          Icons.add_circle,
                        ),

                        iconSize: 45,
                      ),
                    ],
                  ),


                  const SizedBox(height: 30),


                  // =================================================
                  // TOTAL HARGA
                  // =================================================
                  Container(
                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,

                      borderRadius:
                          BorderRadius.circular(12),
                    ),

                    child: Column(
                      children: [

                        const Text(
                          'Total Harga',

                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),


                        const SizedBox(height: 5),


                        Text(
                          'Rp ${food.formattedTotal}',

                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.orange,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 25),


                  // =================================================
                  // TOMBOL KEMBALI
                  // =================================================
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      onPressed: () {

                        // Kembali ke halaman Home
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                      ),

                      label: const Text(
                        'Kembali ke Home',
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.all(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}