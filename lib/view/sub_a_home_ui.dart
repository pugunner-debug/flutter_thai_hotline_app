import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/call_hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  List<String> imgCall = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
    'assets/images/image7.jpg',
    'assets/images/image8.png',
    'assets/images/image9.png',
  ];

  List<CallHotline> callHotlines = [
    CallHotline(
      name: 'กรมทางหลวงชนบท',
      phone: '1146',
      img1: 'assets/images/image1.png',
    ),
    CallHotline(
      name: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      img1: 'assets/images/image2.png',
    ),
    CallHotline(
      name: 'ตำรวจทางหลวง',
      phone: '1193',
      img1: 'assets/images/image3.png',
    ),
    CallHotline(
      name: 'ข้อมูลจราจร',
      phone: '1197',
      img1: 'assets/images/image4.png',
    ),
    CallHotline(
      name: 'ขสมก.',
      phone: '1348',
      img1: 'assets/images/image5.png',
    ),
    CallHotline(
      name: 'บขส.',
      phone: '1490',
      img1: 'assets/images/image6.png',
    ),
    CallHotline(
      name: 'เส้นทางบนทางด่วน',
      phone: '1543',
      img1: 'assets/images/image7.jpg',
    ),
    CallHotline(
      name: 'กรมทางหลวง',
      phone: '1586',
      img1: 'assets/images/image8.png',
    ),
    CallHotline(
      name: 'การไฟฟ้าแห่งประเทศไทย',
      phone: '1690',
      img1: 'assets/images/image9.png',
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
          
          /// --- ส่วนสไลด์รูปภาพด้านบน (Carousel) ---
          CarouselSlider.builder(
            itemCount: imgCall.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15), // เพิ่มขอบมนให้สไลด์
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imgCall[index],
                    fit: BoxFit.contain, // รูปจะไม่โดนตัด
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
              viewportFraction: 0.35, // ปรับขนาดมุมมองให้เห็นภาพตรงกลางชัดขึ้น
            ),
          ),

          const SizedBox(height: 20),

          /// --- ส่วนรายการเบอร์โทรด่วน (ListView) ---
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
                        color: const Color(0xFF15803D).withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// รูปโลโก้ในวงกลมขาว
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0), // ปรับระยะห่างให้พอดีขอบมากขึ้น
                          child: Image.asset(
                            hotline.img1!,
                            width: 48, // บังคับความกว้างของรูป
                            height: 48, // บังคับความสูงของรูปให้อยู่ในกรอบวงกลม
                            fit: BoxFit.contain, // โลโก้ไม่แหว่ง
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// ข้อความชื่อหน่วยงานและเบอร์โทร
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
                              overflow: TextOverflow.ellipsis, // กันชื่อยาวเกินแล้วทับปุ่มโทร
                            ),
                            const SizedBox(height: 4),
                            Text(
                              hotline.phone!,
                              style: const TextStyle(
                                color: Color(0xFF1E293B),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ปุ่มโทรสีขาว
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