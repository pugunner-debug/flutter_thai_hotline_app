import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/call_hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});

  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  List<String> imgCall = [
    'assets/images/b1.png',
    'assets/images/b2.png',
    'assets/images/b3.png',
    'assets/images/b4.jpg',
    'assets/images/b5.png',
    'assets/images/b6.png',
    'assets/images/b7.png',
    'assets/images/b8.png',
    'assets/images/b9.png',
    'assets/images/b10.png',
    'assets/images/b11.png',
    'assets/images/b12.jpeg',
    'assets/images/b13.png',
    'assets/images/b14.png',
    'assets/images/b15.jpg',
    'assets/images/b16.png',
  ];

  List<CallHotline> callHotlines = [
    CallHotline(
      name: 'ธนาคารกรุงเทพ',
      phone: '1333',
      img1: 'assets/images/b1.png',
    ),
    CallHotline(
      name: 'ธนาคารออมสิน',
      phone: '1115',
      img1: 'assets/images/b2.png',
    ),
    CallHotline(
      name: 'ธนาคารกสิกรไทย',
      phone: '02 888 8888',
      img1: 'assets/images/b3.png',
    ),
    CallHotline(
      name: 'ธนาคารกรุงไทย',
      phone: '02 111 1111',
      img1: 'assets/images/b4.jpg',
    ),
    CallHotline(
      name: 'ธนาคารกรุงศรีอยุธยา',
      phone: '1572',
      img1: 'assets/images/b5.png',
    ),
    CallHotline(
      name: 'ธนาคารทหารไทยธนชาต (TTB)',
      phone: '1428',
      img1: 'assets/images/b6.png',
    ),
    CallHotline(
      name: 'Citibank',
      phone: '1588',
      img1: 'assets/images/b7.png',
    ),
    CallHotline(
      name: 'LH Bank',
      phone: '1327',
      img1: 'assets/images/b8.png',
    ),
    CallHotline(
      name: 'ธนาคารอาคารสงเคราะห์',
      phone: '02 645 9000',
      img1: 'assets/images/b9.png',
    ),
    CallHotline(
      name: 'SCB ไทยพาณิชย์',
      phone: '02 777 7777',
      img1: 'assets/images/b10.png',
    ),
    CallHotline(
      name: 'เกียรตินาคินภัทร',
      phone: '02 165 5555',
      img1: 'assets/images/b11.png',
    ),
    CallHotline(
      name: 'ธนาคารไทยเครดิต',
      phone: '02 697 5454',
      img1: 'assets/images/b12.jpeg',
    ),
    CallHotline(
      name: 'UOB',
      phone: '02 285 1555',
      img1: 'assets/images/b13.png',
    ),
    CallHotline(
      name: 'TISCO',
      phone: '02 633 6000',
      img1: 'assets/images/b14.png',
    ),
    CallHotline(
      name: 'ธนาคารอิสลามแห่งประเทศไทย',
      phone: '02 204 2766',
      img1: 'assets/images/b15.jpg',
    ),
    CallHotline(
      name: 'CIMB Thai',
      phone: '02 626 7777',
      img1: 'assets/images/b16.png',
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
      backgroundColor: Colors.white, // ปรับพื้นหลังแอปให้ดูสะอาดตา
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
                  borderRadius: BorderRadius.circular(16), // เพิ่มขอบมน
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
                    fit: BoxFit.contain, //แก้ให้ภาพพอดีกรอบไม่โดนตัด
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
              enlargeFactor: 0.35, // ทำให้รูปที่อยู่ตรงกลางเด้งป๊อปอัพขยายใหญ่ขึ้น
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
                      /// รูปโลโก้ธนาคาร
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0), //ปรับระยะห่างให้พอดีขอบวงกลม
                          child: Image.asset(
                            hotline.img1!,
                            width: 48, // บังคับความกว้างของรูป
                            height: 48, // บังคับความสูงของรูปให้อยู่ในกรอบเป๊ะๆ
                            fit: BoxFit.contain, // โลโก้ไม่โดนตัดขอบ
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
                                fontSize: 18, // ปรับให้ตัวเลขใหญ่ขึ้น
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2, // จัดระยะห่างให้อ่านง่าย
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