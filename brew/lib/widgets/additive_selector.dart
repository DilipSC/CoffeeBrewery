import 'package:flutter/material.dart';

class AdditiveSelector extends StatelessWidget {
  final List<String> additives;
  final List<String> selectedAdditives;
  final Function(String) onAdditiveToggled;

  const AdditiveSelector({
    super.key,
    required this.additives,
    required this.selectedAdditives,
    required this.onAdditiveToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: additives.map((additive) {
        final isSelected = selectedAdditives.contains(additive);
        return GestureDetector(
          onTap: () => onAdditiveToggled(additive),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF6F4E37) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? const Color(0xFF6F4E37) : Colors.grey.shade300,
              ),
            ),
            child: Text(
              additive,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF3E2723),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
