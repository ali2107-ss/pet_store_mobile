import 'package:flutter/material.dart';

class PetCategory {
  final String id;
  final String name;
  final String emoji;
  final IconData icon;
  final Color color;
  final String description;

  PetCategory({
    required this.id,
    required this.name,
    required this.emoji,
    required this.icon,
    required this.color,
    required this.description,
  });
}

final List<PetCategory> petCategories = [
  PetCategory(
    id: 'dogs',
    name: 'Dogs',
    emoji: '🐕',
    icon: Icons.pets,
    color: const Color(0xFFFF8C42),
    description: 'Loyal companions',
  ),
  PetCategory(
    id: 'cats',
    name: 'Cats',
    emoji: '🐈',
    icon: Icons.favorite,
    color: const Color(0xFFFF6B6B),
    description: 'Independent friends',
  ),
  PetCategory(
    id: 'birds',
    name: 'Birds',
    emoji: '🦜',
    icon: Icons.flutter_dash,
    color: const Color(0xFF4ECDC4),
    description: 'Colorful singers',
  ),
  PetCategory(
    id: 'fish',
    name: 'Fish',
    emoji: '🐠',
    icon: Icons.water,
    color: const Color(0xFF45B7D1),
    description: 'Aquatic friends',
  ),
  PetCategory(
    id: 'rabbits',
    name: 'Rabbits',
    emoji: '🐰',
    icon: Icons.agriculture,
    color: const Color(0xFFF7B731),
    description: 'Cute hoppers',
  ),
  PetCategory(
    id: 'hamsters',
    name: 'Hamsters',
    emoji: '🐹',
    icon: Icons.miscellaneous_services,
    color: const Color(0xFFB19CD9),
    description: 'Tiny treasures',
  ),
];
