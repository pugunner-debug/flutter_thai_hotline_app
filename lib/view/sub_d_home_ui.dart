import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/call_hotline.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  List<String> imgCall = [
    'assets/images/c1.png',
    'assets/images/c2.png',
    'assets/images/c3.jpg',
    'assets/images/c4.png',
    'assets/images/c5.png',
    'assets/images/c6.png',
    'assets/images/c7.png',
    'assets/images/c8.jpg',
    'assets/images/c9.jpg',
  ];
  
  List<CallHotline> callHotlines = [
    CallHotline(
      name: 'การไฟฟ้านครหลวง',
      phone: '1130',
      img1: 'assets/images/c1.png',
    ),
    CallHotline(
      name: 'การไฟฟ้าส่วนภูมิภาค',
      phone: '1129',
      img1: 'assets/images/c2.png',
    ),
    CallHotline(
      name: 'การไฟฟ้าฝ่ายผลิต',
      phone: '1416',
      img1: 'assets/images/c3.jpg',
    ),
    CallHotline(
      name: 'การประปานครหลวง',
      phone: '1125',
      img1: 'assets/images/c4.png',
    ),
    CallHotline(
      name: 'การประปาส่วนภูมิภาค',
      phone: '1662',
      img1: 'assets/images/c5.png',
    ),
    CallHotline(
      name: 'True',
      phone: '1242',
      img1: 'assets/images/c6.png',
    ),
    CallHotline(
      name: 'DTAC',
      phone: '1678',
      img1: 'assets/images/c7.png',
    ),
    CallHotline(
      name: 'AIS',
      phone: '1175',
      img1: 'assets/images/c8.jpg',
    ),
    CallHotline(
      name: 'TOT',
      phone: '1100',
      img1: 'assets/images/c9.jpg',
    ),
  ];

  Future<void> callPhone(String phone) async {
    final Uri url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // ไม่สามารถโทรได้
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          /// --- ส่วนสไลด์ภาพด้านบน (Carousel) ---
          CarouselSlider.builder(
            itemCount: imgCall.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imgCall[index],
                    fit: BoxFit.contain, // แก้ให้ภาพพอดีกรอบ ไม่โดนตัด
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.20,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 900),
              enlargeCenterPage: true,
              viewportFraction: 0.35,
            ),
          ),
          const SizedBox(height: 20),
          /// --- ส่วนรายการเบอร์โทร (ListView) ---
          Expanded(
            child: ListView.separated(
              itemCount: callHotlines.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final hotline = callHotlines[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF86EFAC),
                        Color(0xFF4ADE80),
                        Color(0xFF22C55E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF15803D).withOpacity(0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// รูปโลโก้
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0), // เว้นระยะไม่ให้ชิดขอบ
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              hotline.img1!,
                              width: 44,
                              height: 44,
                              fit: BoxFit.contain, // โลโก้ไม่โดนตัด
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// ชื่อ + เบอร์
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotline.name!,
                              style: const TextStyle(
                                color: Color(0xFF064E3B),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              hotline.phone!,
                              style: const TextStyle(
                                color: Color(0xFF1E293B),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ปุ่มโทร
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.call,
                            color: Color(0xFF22C55E),
                          ),
                          onPressed: () => callPhone(hotline.phone!),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}