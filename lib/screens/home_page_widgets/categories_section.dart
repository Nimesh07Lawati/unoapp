import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.celebration, 'name': 'Party+Events'},
    {'icon': Icons.favorite, 'name': 'Wedding'},
    {'icon': Icons.directions_car, 'name': 'Automotive'},
    {'icon': Icons.water, 'name': 'Watersports'},
    {'icon': Icons.build, 'name': 'Tools'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 72,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle, // This makes it fully round
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        category['icon'] as IconData,
                        size: 28,
                        color: const Color(0xFFE67E22),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4A4A4A),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
