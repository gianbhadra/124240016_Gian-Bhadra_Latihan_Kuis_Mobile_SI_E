// Membuat class FoodItem sebagai model untuk menyimpan data makanan
class FoodItem {
  // Nama makanan
  final String name;

  // Deskripsi makanan
  final String description;

  // URL gambar makanan
  final String imageUrl;

  // Jumlah makanan yang dipesan
  // Tidak menggunakan final karena nilainya dapat berubah
  int quantity;

  // Harga satu porsi makanan
  final int price;

  // Constructor untuk membuat object FoodItem
  FoodItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  // Getter untuk menghitung total harga berdasarkan quantity
  // Contoh: quantity 2 x harga 15.000 = 30.000
  int get totalPrice => quantity * price;

  // Getter untuk menampilkan harga satuan dalam format rupiah
  String get formattedPrice => formatPrice(price);

  // Getter untuk menampilkan total harga dalam format rupiah
  String get formattedTotal => formatPrice(totalPrice);

  // Data contoh makanan yang digunakan dalam aplikasi
  static final List<FoodItem> sampleData = [
    FoodItem(
      name: 'Nasi Goreng',
      description: 'Nasi goreng dengan telur dan sayuran.',
      imageUrl:
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b',
      quantity: 0,
      price: 15000,
    ),

    FoodItem(
      name: 'Mie Goreng',
      description: 'Mie goreng dengan sayuran dan telur.',
      imageUrl:
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624',
      quantity: 0,
      price: 12000,
    ),

    FoodItem(
      name: 'Ayam Bakar',
      description: 'Ayam bakar dengan bumbu khas restoran.',
      imageUrl:
          'https://images.unsplash.com/photo-1532550907401-a500c9a57435',
      quantity: 0,
      price: 25000,
    ),

    FoodItem(
      name: 'Es Teh',
      description: 'Minuman teh manis dingin.',
      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc',
      quantity: 0,
      price: 5000,
    ),

    FoodItem(
      name: 'Es Jeruk',
      description: 'Minuman jeruk segar.',
      imageUrl:
          'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b',
      quantity: 0,
      price: 6000,
    ),
  ];
}

// Function untuk mengubah angka menjadi format harga
// Contoh:
// 15000 -> 15.000
// 250000 -> 250.000
String formatPrice(int value) {
  String number = value.toString();

  // List untuk menyimpan angka dari belakang
  List<String> result = [];

  // Mengambil angka setiap 3 digit dari belakang
  while (number.length > 3) {
    result.insert(0, number.substring(number.length - 3));
    number = number.substring(0, number.length - 3);
  }

  // Menambahkan angka yang tersisa
  result.insert(0, number);

  // Menggabungkan angka menggunakan tanda titik
  return result.join('.');
}