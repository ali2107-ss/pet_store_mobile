import 'package:flutter/material.dart';

// --- 1. Создаем простую модель данных для категорий ---
class PetCategory {
  final String name;
  final IconData icon;

  const PetCategory({required this.name, required this.icon});
}

// --- 2. Список наших категорий ---
final List<PetCategory> categories = [
  const PetCategory(name: 'Собаки', icon: Icons.pets),
  const PetCategory(name: 'Кошки', icon: Icons.cruelty_free),
  const PetCategory(name: 'Рыбки', icon: Icons.set_meal),
  const PetCategory(name: 'Птицы', icon: Icons.flutter_dash),
  const PetCategory(name: 'Грызуны', icon: Icons.mouse),
  const PetCategory(name: 'Аксессуары', icon: Icons.shopping_basket),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Store',
      theme: ThemeData(
        // --- 3. Обновляем тему для более приятного вида ---
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          primary: Colors.brown[600],
          secondary: Colors.amber[700],
          background: Colors.grey[100],
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[600],
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomeScreen(), // --- 4. Меняем стартовый экран ---
    );
  }
}

// --- 5. Новый главный экран ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зоомагазин "Пушистик"'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Корзина',
            onPressed: () {
              // TODO: Реализовать переход в корзину
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Наши категории',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            // --- 6. Используем GridView для отображения разделов ---
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Две колонки
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2, // Соотношение сторон карточки
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(category: category);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 7. Отдельный виджет для карточки категории ---
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final PetCategory category;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // чтобы InkWell не выходил за скругленные углы
      child: InkWell(
        onTap: () {
          // TODO: Реализовать переход на экран списка товаров для этой категории
          print('Нажата категория: ${category.name}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Вы выбрали категорию: ${category.name}'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
