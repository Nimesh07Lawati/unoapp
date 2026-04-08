import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search for items, stores...',
            hintStyle: TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Color(0xFFB0B0B0)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}
