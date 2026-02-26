import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetDetailScreen extends StatefulWidget {
  final Pet pet;

  const PetDetailScreen({
    required this.pet,
    super.key,
  });

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isFavorite = false;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF6B4CE6)),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : const Color(0xFF6B4CE6),
                ),
                onPressed: () {
                  setState(() => _isFavorite = !_isFavorite);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isFavorite
                            ? '❤️ Added to favorites'
                            : '💔 Removed from favorites',
                      ),
                      duration: const Duration(milliseconds: 800),
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6B4CE6).withOpacity(0.2),
                      const Color(0xFF9C7FE8).withOpacity(0.1),
                    ],
                  ),
                ),
                child: Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.0),
                    duration: const Duration(milliseconds: 600),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Text(
                          widget.pet.imageUrl,
                          style: const TextStyle(fontSize: 100),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pet.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.pet.breed,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${widget.pet.price.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6B4CE6),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Rating
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < widget.pet.rating.toInt()
                                ? Icons.star
                                : Icons.star_border,
                            color: const Color(0xFFFFB800),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.pet.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.pet.reviews} reviews)',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Description
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.pet.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    // Pet Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoBox('Age', '${widget.pet.age} years'),
                        _buildInfoBox('Size', widget.pet.size),
                        _buildInfoBox('Breed', widget.pet.breed),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Features
                    Text(
                      'Features',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    ...widget.pet.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF6B4CE6),
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(feature),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Quantity
                    Row(
                      children: [
                        Text(
                          'Quantity:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: _quantity > 1
                                    ? () => setState(() => _quantity--)
                                    : null,
                                icon: const Icon(Icons.remove),
                                iconSize: 20,
                              ),
                              Text(
                                '$_quantity',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    setState(() => _quantity++),
                                icon: const Icon(Icons.add),
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$_quantity ${widget.pet.name}(s) added to cart! 🛒',
                      ),
                      duration: const Duration(milliseconds: 1500),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4CE6),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add to Cart (\$${(widget.pet.price * _quantity).toStringAsFixed(2)})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF6B4CE6)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Share this pet! 📤'),
                      duration: Duration(milliseconds: 800),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.share,
                  color: Color(0xFF6B4CE6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
