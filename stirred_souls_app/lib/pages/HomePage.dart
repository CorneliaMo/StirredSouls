import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<List<int>> fakeActivityData = List.generate(
    5,
    (_) => List.generate(7, (_) => Random().nextInt(3)),
  );

  final DateTime lastDate = DateTime.now().subtract(Duration(days: 3));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0DF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("今日你饮佐未？", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              _buildActivityGrid(),
              const SizedBox(height: 17),
              _buildLastCocktailCard(),
              const SizedBox(height: 20),
              _buildSuggestion(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityGrid() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // 星期缩写行
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                .map(
                  (d) => SizedBox(
                    width: 28,
                    child: Text(
                      d,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8),
          // 每周的格子行
          ...fakeActivityData.map(
            (week) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: week
                    .map(
                      (level) => Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: [
                            const Color(0xFFFFF4E8),
                            const Color(0xFFFFE0B2),
                            const Color(0xFFFFB74D),
                          ][level],
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastCocktailCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("最近一次微醺", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            "${DateTime.now().difference(lastDate).inDays}天前",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text("自由古巴", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("朗姆酒，可乐，柠檬汁"),
        ],
      ),
    );
  }

  Widget _buildSuggestion() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFf8d6a8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        "It looks like you haven’t made a cocktail in a while. Why not mix one up today?",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
