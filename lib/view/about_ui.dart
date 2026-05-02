import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    // กำหนดสีหลัก (เขียวเข้ม)
    const darkGreenText = Color(0xFF00695C);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 75, // เพิ่มความสูงให้แถบดูมีมิติและสวยงามขึ้น
        backgroundColor: Colors.transparent,
        elevation: 0,
        // 🟢 กำหนด Shape ให้ขอบล่างโค้งมนแบบสมบูรณ์
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40), // ความมนของขอบล่าง (ปรับเลขได้ตามชอบ)
          ),
        ),
        flexibleSpace: ClipRRect(
          // ตัดขอบ Gradient ด้านในให้โค้งรับกับ Shape ด้านนอก
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          child: Container(
            decoration: const BoxDecoration(
              // สีแถบให้เหมือนหน้า Sub A, B, C, D
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF86EFAC),
                  Color(0xFF4ADE80),
                  Color(0xFF22C55E),
                ],
              ),
            ),
          ),
        ),
        title: const Text(
          'สายด่วน Thailand',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // พื้นหลังเป็นรูปภาพ background.jpg
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(), // ล็อคหน้าจอไม่ให้เลื่อน
          padding: const EdgeInsets.only(top: 130, bottom: 20), // เพิ่ม top ให้หลบขอบโค้งด้านบน
          child: Column(
            children: [
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkGreenText,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              /// โลโก้มหาลัย
              Column(
                children: [
                  Image.asset(
                    'assets/images/logom.png',
                    width: 110,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'มหาวิทยาลัยเอเชียอาคเนย์',
                    style: TextStyle(
                      color: darkGreenText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// รูปถ่ายแบบสี่เหลี่ยมพร้อมกรอบ
              Container(
                width: 155,
                height: 155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25), 
                  border: Border.all(color: Colors.white, width: 4), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21), 
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// การ์ดข้อมูล สไตล์กระจกใส
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7), 
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.8), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _infoRow(
                        icon: Icons.badge, // ไอคอนบัตรประจำตัว
                        iconBg: const Color(0xFFDCEDC8),
                        label: 'รหัสนักศึกษา',
                        value: '6852C10003',
                        textColor: darkGreenText,
                      ),
                      _divider(),
                      _infoRow(
                        icon: Icons.person, // ไอคอนคน
                        iconBg: const Color(0xFFC8E6C9),
                        label: 'ชื่อ-นามสกุล',
                        value: 'นางสาว รชพร จรรยาพัฒน์',
                        textColor: darkGreenText,
                      ),
                      _divider(),
                      _infoRow(
                        icon: Icons.email, // ไอคอนอีเมล
                        iconBg: const Color(0xFFB2DFDB),
                        label: 'อีเมล',
                        value: '6852C10003@sau.ac.th',
                        small: true,
                        textColor: darkGreenText,
                      ),
                      _divider(),
                      _infoRow(
                        icon: Icons.devices, // ไอคอนอุปกรณ์ดิจิทัล
                        iconBg: const Color(0xFFE0F2F1),
                        label: 'สาขา',
                        value: 'ดิจิทัลเทคโนโลยีและนวัตกรรม',
                        textColor: darkGreenText,
                      ),
                      _divider(),
                      _infoRow(
                        icon: Icons.school, // ไอคอนมหาวิทยาลัย/การศึกษา
                        iconBg: const Color(0xFFDCEDC8),
                        label: 'คณะ',
                        value: 'ศิลปศาสตร์และวิทยาศาสตร์',
                        textColor: darkGreenText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow({
    required IconData icon, 
    required Color iconBg,
    required String label,
    required String value,
    required Color textColor,
    bool small = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, blurRadius: 4, offset: Offset(-2, -2))
              ],
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: textColor, size: 20), 
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 12, color: textColor.withOpacity(0.6))),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: small ? 13 : 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
    );
  }
}