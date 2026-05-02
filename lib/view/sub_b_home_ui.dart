import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/call_hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  List<String> imgCall = [
    'assets/images/a1.jpg',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
    'assets/images/a5.png',
    'assets/images/a6.jpg',
    'assets/images/a7.png',
    'assets/images/a8.jpg',
  ];
  
  List<CallHotline> callHotlines = [
    CallHotline(
      name: 'เหตุด่วนเหตุร้าย',
      phone: '191',
      img1: 'assets/images/a1.jpg',
    ),
    CallHotline(
      name: 'แจ้งไฟไหม้ / สัตว์เข้าบ้าน',
      phone: '199',
      img1: 'assets/images/a2.png',
    ),
    CallHotline(
      name: 'สายด่วนรถหาย (ตำรวจแห่งชาติ)',
      phone: '1192',
      img1: 'assets/images/a1.jpg',
    ),
    CallHotline(
      name: 'อุบัติเหตุทางน้ำ',
      phone: '1196',
      img1: 'assets/images/a3.png',
    ),
    CallHotline(
      name: 'แจ้งคนหาย',
      phone: '1300',
      img1: 'assets/images/a4.png',
    ),
    CallHotline(
      name: 'ศูนย์ปลอดภัยคมนาคม',
      phone: '1356',
      img1: 'assets/images/a5.png',
    ),
    CallHotline(
      name: 'หน่วยแพทย์กู้ชีพ',
      phone: '1554',
      img1: 'assets/images/a6.jpg',
    ),
    CallHotline(
      name: 'ศูนย์เอราวัณ',
      phone: '1646',
      img1: 'assets/images/a7.png',
    ),
    CallHotline(
      name: 'เจ็บป่วยฉุกเฉิน',
      phone: '1669',
      img1: 'assets/images/a8.jpg',
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
      backgroundColor: Colors.white, // ปรับพื้นหลังให้ดูสะอาดตา
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
                  borderRadius: BorderRadius.circular(15), // เพิ่มขอบมน
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
                    fit: BoxFit.contain, // เปลี่ยนจาก cover เป็น contain เพื่อไม่ให้รูปแหว่ง
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
              viewportFraction: 0.35, // ปรับให้เห็นรูปชัดขึ้น
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
                        color: const Color(0xFF15803D).withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// รูปโลโก้หน่วยงาน
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0), // เพิ่มช่องว่างรอบโลโก้
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              hotline.img1!,
                              fit: BoxFit.contain, // โลโก้ไม่โดนตัด
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// ชื่อหน่วยงาน + เบอร์โทร
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

                      /// ปุ่มกดโทรออก
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