import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reportProvider.dart';

class issueTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String category;

  const issueTypeCard(  {
    super.key,
    required this.icon,
    required this.label,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.watch<reportProvider>();
    final isSelected = p.issue.category == category;

    return GestureDetector(
      onTap: () => p.setCategory(category),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon as IconData?,
              color: isSelected ? Colors.white : const Color(0xFF2C3E50),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
