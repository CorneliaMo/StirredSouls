import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> favoriteCocktails = [
    {
      'date': DateTime(2024, 4, 10),
      'rating': 4,
      'mood': 'Relaxed',
      'note': 'To have this drink and then a good night’s sleep.',
      'name': 'Velvet Dream',
    },
    {
      'date': DateTime(2024, 4, 6),
      'rating': 5,
      'mood': 'Happy',
      'note': 'A delightful cocktail on a spring evening.',
      'name': 'Spring Sparkle',
    },
    {
      'date': DateTime(2024, 3, 28),
      'rating': 5,
      'mood': 'Inspired',
      'note': 'Creative energy in every sip.',
      'name': 'Muse Bloom',
    },
  ];

  String _formatDate(DateTime date) {
    return "${_monthNames[date.month - 1]} ${date.day}, ${date.year}";
  }

  static const List<String> _monthNames = [
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0DF),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Text("最爱", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              ...favoriteCocktails.map(_buildFavoriteCard).toList(),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(Map<String, dynamic> cocktail) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 日期 + 收藏图标
          Row(
            children: [
              Text(
                _formatDate(cocktail['date']),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.favorite, color: Colors.brown),
            ],
          ),
          const SizedBox(height: 6),
          // Cocktail 名字（你起的名字）
          Text(
            cocktail['name'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // 评分
          Row(
            children: List.generate(
              cocktail['rating'],
              (_) => const Icon(Icons.star, size: 16, color: Color(0xFFF4A45F)),
            ),
          ),
          const SizedBox(height: 8),
          // 心情
          Text(
            cocktail['mood'],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          // 备注
          Text(cocktail['note']),
        ],
      ),
    );
  }
}
