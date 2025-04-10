import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StirredBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const StirredBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xffffffff), // ✨温柔背景替换掉默认灰
      elevation: 4,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab(FontAwesomeIcons.house, "首页", 0),
            _buildTab(FontAwesomeIcons.book, "记录", 1),
            const SizedBox(width: 48), // 中间空位
            _buildTab(FontAwesomeIcons.heart, "收藏", 2),
            _buildTab(FontAwesomeIcons.gear, "设置", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, String label, int index) {
    final bool selected = currentIndex == index;
    final color = selected ? const Color(0xFFB4866E) : Colors.grey;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, color: color, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
