class Pet {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final String description;
  final double rating;
  final int reviews;
  final String breed;
  final int age;
  final String size;
  final List<String> features;

  Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.breed,
    required this.age,
    required this.size,
    required this.features,
  });
}

final List<Pet> samplePets = [
  Pet(
    id: '1',
    name: 'Golden Buddy',
    category: 'Dogs',
    imageUrl: '🐕',
    price: 599.99,
    description: 'Beautiful Golden Retriever with perfect temperament',
    rating: 4.8,
    reviews: 24,
    breed: 'Golden Retriever',
    age: 2,
    size: 'Large',
    features: [
      'Friendly and loyal',
      'Great with kids',
      'Highly trainable',
      'Excellent health',
    ],
  ),
  Pet(
    id: '2',
    name: 'Whiskers',
    category: 'Cats',
    imageUrl: '🐈',
    price: 299.99,
    description: 'Adorable Persian cat with soft fur',
    rating: 4.6,
    reviews: 18,
    breed: 'Persian',
    age: 1,
    size: 'Small',
    features: [
      'Very affectionate',
      'Quiet and calm',
      'Clean and hygienic',
      'Perfect indoor pet',
    ],
  ),
  Pet(
    id: '3',
    name: 'Chirpy',
    category: 'Birds',
    imageUrl: '🦜',
    price: 199.99,
    description: 'Colorful parrot with amazing vocals',
    rating: 4.5,
    reviews: 15,
    breed: 'Macaw',
    age: 3,
    size: 'Medium',
    features: [
      'Can mimic words',
      'Long lifespan',
      'Beautiful colors',
      'Sociable bird',
    ],
  ),
  Pet(
    id: '4',
    name: 'Nemo',
    category: 'Fish',
    imageUrl: '🐠',
    price: 49.99,
    description: 'Vibrant clownfish for your aquarium',
    rating: 4.7,
    reviews: 32,
    breed: 'Clownfish',
    age: 1,
    size: 'Tiny',
    features: [
      'Colorful pattern',
      'Easy to care for',
      'Long-lived',
      'Peaceful fish',
    ],
  ),
];
