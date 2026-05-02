import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/about_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_a_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_b_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_c_home_ui.dart';
import 'package:flutter_thai_hotline_app/view/sub_d_home_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int barItemIndex = 0;

  // ช่วยสร้างไอคอนที่ไล่สี (gradient) เมื่อเลือก
  Widget _navIcon(IconData icon, int index) {
    const gradient = LinearGradient(
      colors: [Color(0xFF86EFAC), Color(0xFF4ADE80), Color(0xFF22C55E)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final iconWidget = Icon(icon, size: 22, color: Colors.white);

    if (barItemIndex != index) {
      return Icon(icon, size: 22, color: const Color(0xFF828282));
    }

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: iconWidget,
    );
  }

  List showUI = [
    const SubAHomeUi(),
    const SubBHomeUi(),
    const SubCHomeUi(),
    const SubDHomeUi(),
    const AboutUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75, // เพิ่มความสูงให้แถบดูมีมิติ
        backgroundColor: Colors.transparent,
        elevation: 0,
        // กำหนด Shape ให้ขอบล่างโค้งมนแบบเดียวกับหน้า About
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        flexibleSpace: ClipRRect(
          // ตัดขอบ Gradient ด้านในให้โค้งรับกับ Shape ด้านนอก
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF86EFAC), Color(0xFF4ADE80), Color(0xFF22C55E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        title: const Text(
          'สายด่วน Thailand',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20, // ปรับฟอนต์ให้ใหญ่เท่ากับหน้า About
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'ข้อมูล',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutUi()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //แถบเมนูด้านล่าง
        onTap: (index) {
          setState(() {
            barItemIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF15803D),
        unselectedItemColor: const Color.fromARGB(255, 130, 130, 130),

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold, // ตัวหนา
        ),
        currentIndex: barItemIndex,
        items: [
          BottomNavigationBarItem(
            icon: _navIcon(FontAwesomeIcons.train, 0),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.local_hospital, 1),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(FontAwesomeIcons.buildingColumns, 2),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(FontAwesomeIcons.wifi, 3),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
      body: showUI[barItemIndex],
    );
  }
}