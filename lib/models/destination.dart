class Destination {
  final String id;
  final String name;
  final String location;
  final String country;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final double startPrice;
  final String distance;
  final String description;
  final List<String> amenities;
  final List<String> highlights;
  bool isFavorite;

  Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.startPrice,
    required this.distance,
    required this.description,
    this.amenities = const [],
    this.highlights = const [],
    this.isFavorite = false,
  });
  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      id:          map['id'] as String,
      name:        map['name'] as String,
      location:    map['location'] as String,
      country:     map['country'] as String,
      imageUrl:    map['imageUrl'] as String,
      rating:      (map['rating'] as num).toDouble(),
      reviewCount: map['reviewCount'] as int,
      startPrice:  (map['startPrice'] as num).toDouble(),
      distance:    map['distance'] as String,
      description: map['description'] as String,
      amenities:  (map['amenities'] as String).split(','),
      highlights: (map['highlights'] as String).split(','),
    );
  }
}

class City {
  final String name;
  final String imageUrl;
  const City({required this.name, required this.imageUrl});
}

final List<City> popularCities = [
  City(
    name: 'Paris',
    imageUrl:
    'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=200&q=80',
  ),
  City(
    name: 'Kyoto',
    imageUrl:
    'https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=200&q=80',
  ),
  City(
    name: 'Machu',
    imageUrl:
    'https://images.unsplash.com/photo-1526392060635-9d6019884377?w=200&q=80',
  ),
  City(
    name: 'New York',
    imageUrl:
    'https://images.unsplash.com/photo-1546436836-07a91091f160?w=200&q=80',
  ),
  City(
    name: 'Bali',
    imageUrl:
    'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=200&q=80',
  ),
  City(
    name: 'Santorini',
    imageUrl:
    'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=200&q=80',
  ),
];

final List<Destination> allDestinations = [
  Destination(
    id: '1',
    name: 'Grand Canyon National Park',
    location: 'Grand Canyon National Park',
    country: 'Arizona, United States',
    imageUrl:
    'https://images.unsplash.com/photo-1474044159687-1ee9f3a51722?w=600&q=80',
    rating: 4.9,
    reviewCount: 455,
    startPrice: 240,
    distance: '277 miles away',
    description:
    'Grand Canyon National Park, located in Arizona, is one of the most awe-inspiring natural wonders on the planet. Carved by the Colorado River over millions of years, the Grand Canyon is a breathtaking geological masterpiece stretching 277 miles long, up to 18 miles wide, and over a mile deep.',
    amenities: [
      'Visitor Centers',
      'Campgrounds for overnight stays',
      'Lodges and hotels within the park',
      'Restaurants and cafes',
      'Gift shops for souvenirs',
      'Guided tours',
      'Hiking trails',
      'Shuttle services',
    ],
    highlights: [
      'The South Rim is the most visited area.',
      'Lodges & campgrounds inside the park.',
      'Best time: Spring & Fall.',
    ],
  ),
  Destination(
    id: '2',
    name: 'Yosemite Valley',
    location: 'Yosemite National Park',
    country: 'California, United States',
    imageUrl:
    'https://images.unsplash.com/photo-1562310503-a918c4c61e38?w=600&q=80',
    rating: 4.8,
    reviewCount: 392,
    startPrice: 180,
    distance: '180 miles away',
    description:
    'Yosemite Valley is a glacially carved valley in Yosemite National Park in the western Sierra Nevada mountains of California. Known for its towering granite cliffs, majestic waterfalls, and pristine wilderness.',
    amenities: [
      'Visitor Centers',
      'Campgrounds',
      'Lodges',
      'Restaurants',
      'Gift shops',
      'Rock climbing guides',
    ],
    highlights: [
      'El Capitan is world-famous for rock climbing.',
      'Yosemite Falls is one of the tallest in North America.',
      'Best visited May–September.',
    ],
  ),
  Destination(
    id: '3',
    name: 'Machu Picchu',
    location: 'Machu Picchu',
    country: 'Cusco Region, Peru',
    imageUrl:
    'https://images.unsplash.com/photo-1526392060635-9d6019884377?w=600&q=80',
    rating: 4.9,
    reviewCount: 611,
    startPrice: 890,
    distance: '2,841 miles away',
    description:
    'Machu Picchu is an Incan citadel set high in the Andes Mountains in Peru, above the Sacred Valley. Built in the 15th century and later abandoned, it\'s renowned for its sophisticated dry-stone walls and panoramic views.',
    amenities: [
      'Guided tours',
      'Restaurants nearby',
      'Visitor centers',
      'Lodges in Aguas Calientes',
    ],
    highlights: [
      'UNESCO World Heritage Site since 1983.',
      'Best reached by the iconic Inca Trail.',
      'Sunrise from Sun Gate is unmissable.',
    ],
  ),
  Destination(
    id: '4',
    name: 'Zion National Park',
    location: 'Zion National Park',
    country: 'Utah, United States',
    imageUrl:
    'https://images.unsplash.com/photo-1551632811-561732d1e306?w=600&q=80',
    rating: 4.7,
    reviewCount: 287,
    startPrice: 195,
    distance: '310 miles away',
    description:
    'Zion National Park is a southwest Utah nature preserve distinguished by Zion Canyon\'s steep red cliffs. Angels Landing, a rock formation, is reached via a series of switchbacks and chains.',
    amenities: [
      'Shuttle services',
      'Campgrounds',
      'Visitor Centers',
      'Restaurants',
      'Gift shops',
    ],
    highlights: [
      'Angels Landing offers iconic views.',
      'The Narrows is a must-do slot canyon hike.',
      'Best time: Spring and Fall.',
    ],
  ),
  Destination(
    id: '5',
    name: 'Santorini',
    location: 'Thira',
    country: 'Cyclades, Greece',
    imageUrl:
    'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=600&q=80',
    rating: 4.9,
    reviewCount: 723,
    startPrice: 1200,
    distance: '5,900 miles away',
    description:
    'Santorini is a volcanic island in the Cyclades group of the Greek islands. Famous for its white-washed houses, blue-domed churches, and spectacular sunsets over the caldera.',
    amenities: [
      'Luxury hotels',
      'Fine dining',
      'Wine tours',
      'Sailing excursions',
      'Beach clubs',
    ],
    highlights: [
      'Oia sunset is world-renowned.',
      'Volcanic beaches at Perissa.',
      'Best visited April–October.',
    ],
  ),
  Destination(
    id: '6',
    name: 'Kyoto Old Town',
    location: 'Kyoto',
    country: 'Kansai, Japan',
    imageUrl:
    'https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=600&q=80',
    rating: 4.8,
    reviewCount: 534,
    startPrice: 650,
    distance: '5,400 miles away',
    description:
    'Kyoto is a city on the island of Honshu, known for its numerous classical Buddhist temples, gardens, imperial palaces, Shinto shrines, and traditional wooden houses.',
    amenities: [
      'Traditional ryokans',
      'Tea ceremony houses',
      'Geisha districts',
      'Shrine tours',
      'Bullet train access',
    ],
    highlights: [
      'Fushimi Inari has 10,000 torii gates.',
      'Arashiyama bamboo grove is iconic.',
      'Cherry blossoms in March–April.',
    ],
  ),
];