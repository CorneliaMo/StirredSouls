import 'package:flutter/material.dart';
import 'dart:math';

class JournalPage extends StatelessWidget {
  JournalPage({Key? key}) : super(key: key);

  final List<List<int>> fakeActivity = List.generate(
    5,
    (_) => List.generate(7, (_) => Random().nextInt(3)),
  );

  final List<Map<String, dynamic>> fakeJournalEntries = [
    {
      'date': DateTime(2024, 4, 10),
      'rating': 4,
      'mood': 'Relaxed',
      'note': 'To have this drink and then a good night’s sleep.',
      'favorite': true,
    },
    {
      'date': DateTime(2024, 4, 6),
      'rating': 5,
      'mood': 'Happy',
      'note': 'A delightful cocktail on a spring evening.',
      'favorite': true,
    },
    {
      'date': DateTime(2024, 4, 1),
      'rating': 5,
      'mood': 'Melancholy',
      'note': 'A calming drink after a long day.',
      'favorite': false,
    },
    {
      'date': DateTime(2024, 3, 28),
      'rating': 3,
      'mood': 'Tired',
      'note': 'Simple and effective.',
      'favorite': false,
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
              const Text("记录", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              ...fakeJournalEntries.map(_buildEntryCard).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityGrid() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: fakeActivity.map(
          (week) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: week.map(
                (level) {
                  final colors = [
                    const Color(0xFFFFF4E8),
                    const Color(0xFFFFE0B2),
                    const Color(0xFFFFB74D),
                  ];
                  return Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: colors[level],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ).toList(),
      )
    );
  }

  Widget _buildEntryCard(Map<String, dynamic> entry) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _formatDate(entry['date']),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                entry['favorite'] ? Icons.favorite : Icons.favorite_border,
                color: entry['favorite'] ? Colors.brown : Colors.grey,
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              entry['rating'],
              (_) => const Icon(Icons.star, size: 16, color: Color(0xFFF4A45F)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            entry['mood'],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(entry['note']),
        ],
      ),
    );
  }
}
