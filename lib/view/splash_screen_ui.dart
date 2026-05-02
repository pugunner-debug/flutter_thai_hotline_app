import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    super.initState();
    
    // หน่วงเวลา 4 วินาทีแล้วเปลี่ยนหน้าไปที่หน้า Home
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeUi(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // กำหนดให้ Container ขยายเต็มหน้าจอ
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.fill, // ปรับเป็น fill เพื่อให้เห็นภาพพื้นหลังครบทุกส่วน 
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดเนื้อหาให้อยู่กลางจอ
            children: [
              // เรียกใช้งาน Widget โลโก้ที่เราแยกไว้ด้านล่าง
              builderLogo(),
              
              const SizedBox(height: 30),
              
              // ชื่อแอปภาษาอังกฤษ (สีเขียวเข้มจัด)
              const Text(
                'THAI HOTLINE APP',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF064E3B),
                  letterSpacing: 1.2,
                ),
              ),
              
              // ชื่อแอปภาษาไทย (สีเทาเข้ม)
              const Text(
                'สายด่วนไทย',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF334155),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // ตัวโหลดหมุนๆ (สีเขียวสด)
              const CircularProgressIndicator(
                color: Color(0xFF22C55E),
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง Widget โลโก้วงกลม
  Widget builderLogo() {
    double avatarSize = 180;
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // ไล่เฉดสีเขียวที่ขอบนอก
        gradient: const LinearGradient(
          colors: [Color(0xFF86EFAC), Color(0xFF4ADE80), Color(0xFF22C55E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // ใส่เงาให้โลโก้ดูมีมิติ
        boxShadow: [
          BoxShadow(
            color: const Color(0x5915803D), // ✅ แก้ตรงนี้ เอาเส้นสีน้ำเงินเตือนออกแล้วค่ะ
            blurRadius: 25,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8), // ระยะห่างระหว่างขอบสีเขียวกับขอบขาว
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4), // ขอบสีขาวด้านใน
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logoapp.jpg',
              fit: BoxFit.cover, // ให้รูปโลโก้ขยายเต็มวงกลมพอดี
            ),
          ),
        ),
      ),
    );
  }
}