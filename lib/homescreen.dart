import 'package:flutter/material.dart';
import 'package:praktikum_flutter_hero/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              // Text Widget with Shadow
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Haigh Heels World!",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                    color: const Color.fromARGB(255, 237, 90, 250),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(225, 240, 77, 255),
                width: screenWidth,
                height: 3,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    item(
                      "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1554465296/rbeix30zxogj4chgypfd.jpg", 
                      "Pump Heels",
                      "Jenis heels ini biasa dipakai dalam suasana formal, apalagi jika dipadankan dengan blazer.",
                      "Pump heels ini menjadi favorit dari Meghan Markle karena memiliki heels yang menyerupai stiletto dan juga chunky flat heels di bagian sol depan sepatu."
                    ),
                    item(
                      "https://cdn.shopify.com/s/files/1/0305/2116/3913/files/DSC00993_480x480.jpg?v=1690170033", 
                      "Kitten Heels",
                      "Kitten Heels dinamakan demikian karena tinggi halnya yang lebih rendah dan kecil, yaitu sekitar 2,5 cm hingga 5 cm.",
                      "Kitten Heels pertama kali populer pada akhir tahun 1950-an hingga 1960-an dan dikenal sebagai alternatif sepatu hak tinggi yang nyaman dan santai, cocok untuk aktivitas sehari-hari maupun acara formal."
                    ),
                    item(
                      "https://cdn.shopify.com/s/files/1/0305/2116/3913/files/kalaloaferwhite2_480x480.jpg?v=1690170060", 
                      "Loafer Heels",
                      "Jenis Heels ini juga cukup populer di kalangan wanita, karena sepatu ini menggabungkan desain loafer yang klasik dengan hak yang lebih tinggi dan memberikan sentuhan chic dan edgy.",
                      "Loafer Heels paling cocok digunakan di situasi formal, seperti menghadiri acara peresmian kantor, bertemu klien, atau sebagai daily-use bagi kamu yang memang bekerja dengan dresscode formal."
                    ),
                    item(
                      "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1554521520/p3hcgzgbkicujosbndbk.jpg", 
                      "Platform Heels",
                      "Platform Heels memberikan pilihan untuk kenyamanan dengan rancangan perbandingan ketinggian tumit dengan ujung jari kaki tidak terlalu curam.",
                      "Ukuran tinggi Heels ini dibantu oleh platform yang diikuti dengan ukuran heels yang sebanding, alhasil kaki tidak mudah pegal ketimbang saat memakai heels dengan style chunky."
                    ),
                    item(
                      "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1554521286/n4prw3afltnuqhab3ckx.jpg", 
                      "Peep toe Heels",
                      "Serupa dengan high heels pada umumnya, peep toe heels memiliki hak yang cukup tinggi yang ramping.",
                      "Namun yang membuatnya sedikit berbeda adalah detail di bagian  ujung sepatu, jika heels pada umumnya bagian depannya tertututp. Peep toe heels memperlihatkan sebagian kecil dari jari kaki atau ibu jari Anda."
                    ),
                    item(
                      "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1554521520/k5iqo5vjrvicuysypkcb.png", 
                      "Wedges Heels",
                      "Wedges Heels ini saat digunakan akan merasa nyaman sekaligus tetap terlihat stylist saat memakainya.",
                      "Heels yang satu ini dikenal super nyaman karena wedges memiliki model hak sepatu yang tebal dan didesain sejajar dengan bentuk sepatu. Dengan model hal sepatu yang seperti ini bisa membuat pemakainya tetap stabil dan nyaman saat berjalan."
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String imageUrl, String title, String desc, String fullDesc) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              asset: imageUrl,
              tag: title,
              fullDesc: fullDesc,
            ),
          ),
        );
      },
      child: Container(
        height: screenWidth / 2.8,
        width: screenWidth,
        margin: EdgeInsets.only(
          bottom: screenWidth / 20,
        ),
        child: Row(
          children: [
            Hero(
              tag: title,
              child: Container(
                width: screenWidth / 2.8,
                height: screenWidth / 2.8,
                margin: EdgeInsets.only(
                  right: screenWidth / 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network( 
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(221, 30, 29, 29),
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "In-Stock",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 227, 121, 248),
                      fontSize: 20,
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