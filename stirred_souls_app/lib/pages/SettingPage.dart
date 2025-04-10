import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0DF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // 头像 + 名字
              Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/avatar_placeholder.png'), // 替换成你的头像
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Cornelia",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 基酒栏
              _buildSectionTitle("基酒"),
              const SizedBox(height: 12),
              StirredSettingItem(
                icon: FontAwesomeIcons.sitemap,
                label: "管理基酒大类",
                onTap: () => print("跳转到大类管理"),
              ),
              StirredSettingItem(
                icon: FontAwesomeIcons.bottleDroplet,
                label: "管理基酒",
                onTap: () => print("跳转到基酒管理"),
              ),

              const SizedBox(height: 28),

              // 数据栏
              _buildSectionTitle("数据"),
              const SizedBox(height: 12),
              StirredSettingItem(
                icon: FontAwesomeIcons.server,
                label: "设置后端URL",
                onTap: () => print("打开后端URL设置弹窗"),
              ),

              const Spacer(),

              // 作者&版本
              Column(
                children: const [
                  Text("Made with love by Cornelia", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text("Stirred Souls v0.1.0", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StirredSettingItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const StirredSettingItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: Center(
                child: FaIcon(icon, size: 20, color: const Color(0xFFB4866E)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }
}