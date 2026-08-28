import 'package:flutter/material.dart';
import 'place_details_screen.dart';

class PlacesScreen extends StatefulWidget {
  final String destination;

  const PlacesScreen({
    super.key,
    required this.destination,
  });

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Attractions',
    'Food',
    'Nature',
    'Culture',
  ];

  final Map<String, List<Map<String, dynamic>>> placesByDestination = {
    'Goa': [
      {
        'name': 'Fort Aguada',
        'category': 'Attractions',
        'rating': '4.8',
        'distance': '12 km',
        'description':
            'A historic Portuguese fort overlooking the Arabian Sea.',
        'icon': Icons.fort_rounded,
      },
      {
        'name': 'Baga Beach',
        'category': 'Nature',
        'rating': '4.6',
        'distance': '8 km',
        'description':
            'A lively beach known for sunsets, water sports and nightlife.',
        'icon': Icons.beach_access_rounded,
      },
      {
        'name': 'Fontainhas',
        'category': 'Culture',
        'rating': '4.7',
        'distance': '5 km',
        'description':
            'A colourful Latin quarter filled with Portuguese architecture.',
        'icon': Icons.location_city_rounded,
      },
      {
        'name': 'Viva Panjim',
        'category': 'Food',
        'rating': '4.5',
        'distance': '6 km',
        'description':
            'A cosy spot to experience authentic Goan cuisine.',
        'icon': Icons.restaurant_rounded,
      },
    ],
    'Jaipur': [
      {
        'name': 'Amber Fort',
        'category': 'Attractions',
        'rating': '4.8',
        'distance': '11 km',
        'description':
            'A magnificent hilltop fort showcasing Rajput architecture.',
        'icon': Icons.account_balance_rounded,
      },
      {
        'name': 'Hawa Mahal',
        'category': 'Culture',
        'rating': '4.7',
        'distance': '4 km',
        'description':
            'The iconic Palace of Winds in the heart of Jaipur.',
        'icon': Icons.castle_rounded,
      },
      {
        'name': 'Jal Mahal',
        'category': 'Nature',
        'rating': '4.6',
        'distance': '7 km',
        'description':
            'A beautiful palace appearing to float in Man Sagar Lake.',
        'icon': Icons.water_rounded,
      },
    ],
    'Manali': [
      {
        'name': 'Solang Valley',
        'category': 'Nature',
        'rating': '4.8',
        'distance': '14 km',
        'description':
            'A scenic valley famous for adventure activities and mountain views.',
        'icon': Icons.terrain_rounded,
      },
      {
        'name': 'Hadimba Temple',
        'category': 'Culture',
        'rating': '4.7',
        'distance': '3 km',
        'description':
            'An ancient wooden temple surrounded by cedar forests.',
        'icon': Icons.temple_hindu_rounded,
      },
      {
        'name': 'Mall Road',
        'category': 'Attractions',
        'rating': '4.5',
        'distance': '1 km',
        'description':
            'The lively centre for shopping, food and local experiences.',
        'icon': Icons.storefront_rounded,
      },
    ],
    'Mumbai': [
      {
        'name': 'Gateway of India',
        'category': 'Attractions',
        'rating': '4.7',
        'distance': '3 km',
        'description':
            'Mumbai’s iconic waterfront monument overlooking the Arabian Sea.',
        'icon': Icons.account_balance_rounded,
      },
      {
        'name': 'Marine Drive',
        'category': 'Nature',
        'rating': '4.8',
        'distance': '5 km',
        'description':
            'A scenic coastal boulevard famous for sunset views.',
        'icon': Icons.waves_rounded,
      },
      {
        'name': 'Colaba',
        'category': 'Culture',
        'rating': '4.6',
        'distance': '2 km',
        'description':
            'A vibrant neighbourhood filled with cafés, shops and heritage.',
        'icon': Icons.storefront_rounded,
      },
    ],
    'Kerala': [
      {
        'name': 'Alleppey Backwaters',
        'category': 'Nature',
        'rating': '4.9',
        'distance': '8 km',
        'description':
            'Peaceful waterways surrounded by lush tropical landscapes.',
        'icon': Icons.water_rounded,
      },
      {
        'name': 'Fort Kochi',
        'category': 'Culture',
        'rating': '4.7',
        'distance': '4 km',
        'description':
            'A historic neighbourhood blending Indian and colonial influences.',
        'icon': Icons.location_city_rounded,
      },
    ],
  };

  List<Map<String, dynamic>> get currentPlaces {
    return placesByDestination[widget.destination] ??
        placesByDestination['Goa']!;
  }

  List<Map<String, dynamic>> get filteredPlaces {
    if (selectedCategory == 0) {
      return currentPlaces;
    }

    final category = categories[selectedCategory];

    return currentPlaces
        .where((place) => place['category'] == category)
        .toList();
  }

  void openPlaceDetails(Map<String, dynamic> place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailsScreen(
          place: place,
          destination: widget.destination,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF12343B),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF718386),
              ),
            ),
            Text(
              widget.destination,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // ─────────────────────────────────
          // INTRO
          // ─────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(22, 8, 22, 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Places you might love',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF718386),
                ),
              ),
            ),
          ),

          // ─────────────────────────────────
          // CATEGORY FILTERS
          // ─────────────────────────────────
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF087E8B)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF087E8B)
                            : const Color(0xFFE1EAEA),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF526568),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 18),

          // ─────────────────────────────────
          // PLACE LIST
          // ─────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 30),
              itemCount: filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];

                return GestureDetector(
                  onTap: () => openPlaceDetails(place),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 14,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // IMAGE / HERO AREA
                        Container(
                          height: 145,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9F1EE),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(22),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  place['icon'],
                                  size: 64,
                                  color: const Color(0xFF087E8B),
                                ),
                              ),

                              // Category badge
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.92),
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    place['category'],
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF087E8B),
                                    ),
                                  ),
                                ),
                              ),

                              // Favourite
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.92),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border_rounded,
                                    size: 19,
                                    color: Color(0xFF12343B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // DETAILS
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF12343B),
                                      ),
                                    ),

                                    const SizedBox(height: 7),

                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          size: 17,
                                          color: Color(0xFFFFB300),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          place['rating'],
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 16,
                                          color: Color(0xFF718386),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          place['distance'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF718386),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      place['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        height: 1.4,
                                        color: Color(0xFF718386),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 10),

                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9F1EE),
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                  color: Color(0xFF087E8B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}