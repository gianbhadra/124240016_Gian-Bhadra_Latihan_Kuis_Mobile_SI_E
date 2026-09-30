// Import Flutter Material Design
import 'package:flutter/material.dart';

// Import model/data makanan
import 'food_item.dart';

// Import halaman detail makanan
import 'detail_page.dart';

// Import halaman profile
import 'profile_page.dart';


// ==========================================================
// HOMEPAGE
// ==========================================================
// StatefulWidget digunakan karena quantity makanan dapat berubah.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


// ==========================================================
// STATE HOMEPAGE
// ==========================================================
class _HomePageState extends State<HomePage> {

  // Mengambil seluruh data makanan dari FoodItem
  final List<FoodItem> foods = FoodItem.sampleData;

  // Menyimpan halaman yang sedang aktif
  // 0 = Home
  // 1 = Profile
  int selectedIndex = 0;


  // ========================================================
  // MENGHITUNG TOTAL SEMUA PESANAN
  // ========================================================
  int get grandTotal {

    // fold digunakan untuk menjumlahkan
    // total harga dari seluruh makanan
    return foods.fold(
      0,
      (sum, food) => sum + food.totalPrice,
    );
  }


  // ========================================================
  // HALAMAN HOME
  // ========================================================
  Widget buildHome() {

    return Column(
      children: [

        // --------------------------------------------------
        // DAFTAR MAKANAN
        // --------------------------------------------------
        Expanded(
          child: ListView.builder(

            // Jumlah makanan yang ditampilkan
            itemCount: foods.length,

            // Membuat tampilan setiap makanan
            itemBuilder: (context, index) {

              // Mengambil data makanan berdasarkan index
              final food = foods[index];


              // ------------------------------------------------
              // CARD MAKANAN
              // ------------------------------------------------
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                // InkWell digunakan agar card dapat diklik
                child: InkWell(

                  // ============================================
                  // KETIKA CARD MAKANAN DIKLIK
                  // ============================================
                  onTap: () {

                    // Membuka halaman DetailPage
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) {

                          return DetailPage(
                            // Mengirim data makanan
                            // ke halaman DetailPage
                            food: food,
                          );
                        },
                      ),

                    // Setelah kembali dari DetailPage
                    ).then((_) {

                      // Memperbarui tampilan Home
                      // agar quantity dan total ikut berubah
                      setState(() {});
                    });
                  },


                  // Isi Card
                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [

                        // ======================================
                        // GAMBAR MAKANAN
                        // ======================================
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10),

                          child: Image.network(
                            food.imageUrl,

                            // Lebar gambar
                            width: 90,

                            // Tinggi gambar
                            height: 90,

                            // Gambar memenuhi area
                            fit: BoxFit.cover,

                            // Jika gambar gagal dimuat
                            errorBuilder:
                                (context, error, stackTrace) {

                              return Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey.shade300,

                                child: const Icon(
                                  Icons.fastfood,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),


                        const SizedBox(width: 12),


                        // ======================================
                        // INFORMASI MAKANAN
                        // ======================================
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // Nama makanan
                              Text(
                                food.name,

                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),


                              const SizedBox(height: 4),


                              // Deskripsi makanan
                              Text(
                                food.description,

                                maxLines: 2,

                                overflow:
                                    TextOverflow.ellipsis,
                              ),


                              const SizedBox(height: 6),


                              // Harga satuan
                              Text(
                                'Rp ${food.formattedPrice}',

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),


                              const SizedBox(height: 4),


                              // Total harga berdasarkan quantity
                              Text(
                                'Total: Rp ${food.formattedTotal}',

                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),


                        // ======================================
                        // TOMBOL KURANG
                        // ======================================
                        IconButton(
                          onPressed: food.quantity > 0
                              ? () {

                                  // Mengubah quantity
                                  setState(() {
                                    food.quantity--;
                                  });
                                }
                              : null,

                          icon: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),


                        // ======================================
                        // JUMLAH PESANAN
                        // ======================================
                        Text(
                          '${food.quantity}',

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),


                        // ======================================
                        // TOMBOL TAMBAH
                        // ======================================
                        IconButton(
                          onPressed: () {

                            // Menambah quantity
                            setState(() {
                              food.quantity++;
                            });
                          },

                          icon: const Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),


        // ==================================================
        // TOTAL SEMUA PESANAN
        // ==================================================
        Container(
          padding: const EdgeInsets.all(16),

          width: double.infinity,

          color: Colors.orange.shade50,

          child: Text(
            'Total Pesanan: Rp ${formatPrice(grandTotal)}',

            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }


  // ========================================================
  // BUILD UTAMA
  // ========================================================
  @override
  Widget build(BuildContext context) {

    // Daftar halaman yang tersedia
    final pages = [
      buildHome(),

      const ProfilePage(),
    ];


    return Scaffold(

      // ====================================================
      // APP BAR
      // ====================================================
      appBar: AppBar(
        title: const Text('Resto Kita'),

        centerTitle: true,
      ),


      // ====================================================
      // BODY
      // ====================================================
      // Menampilkan halaman berdasarkan selectedIndex
      body: pages[selectedIndex],


      // ====================================================
      // NAVIGASI BAWAH
      // ====================================================
      bottomNavigationBar:
          BottomNavigationBar(

        // Menentukan menu yang sedang aktif
        currentIndex: selectedIndex,

        // Ketika menu ditekan
        onTap: (index) {

          setState(() {
            selectedIndex = index;
          });
        },


        items: const [

          // Menu Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),


          // Menu Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}