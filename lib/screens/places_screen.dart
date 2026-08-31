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
  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);

  String selectedCategory = 'All';

  final Set<String> favouritePlaces = {};

  // ============================================================
  // DESTINATION-SPECIFIC PLACES
  // ============================================================

  List<PlaceItem> get allPlaces {
    switch (widget.destination.toLowerCase().trim()) {
      case 'jaipur':
        return jaipurPlaces;

      case 'manali':
        return manaliPlaces;

      case 'mumbai':
        return mumbaiPlaces;

      case 'kerala':
        return keralaPlaces;

      case 'goa':
      default:
        return goaPlaces;
    }
  }

  // ============================================================
  // GOA
  // ============================================================

  final List<PlaceItem> goaPlaces = [
    PlaceItem(
      name: 'Fort Aguada',
      category: 'Attractions',
      rating: '4.8',
      distance: '12 km',
      description:
          'A historic Portuguese fort overlooking the Arabian Sea.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/0a/Fort_Aguada%2C_Goa%2C_India.jpg',
      icon: Icons.fort_rounded,
    ),

    PlaceItem(
      name: 'Baga Beach',
      category: 'Nature',
      rating: '4.6',
      distance: '8 km',
      description:
          'A lively beach known for sunsets, water sports and nightlife.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/34/Baga_Beach_Goa.JPG',
      icon: Icons.beach_access_rounded,
    ),

    PlaceItem(
      name: 'Goan Fish Thali',
      category: 'Food',
      rating: '4.7',
      distance: '5 km',
      description:
          'Taste authentic coastal flavours with traditional Goan fish curry, rice and local sides.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/02/Goan_Special_Fish_Thali.jpg',
      icon: Icons.restaurant_rounded,
    ),

    PlaceItem(
      name: 'Dudhsagar Falls',
      category: 'Nature',
      rating: '4.9',
      distance: '60 km',
      description:
          'A spectacular four-tiered waterfall surrounded by the Western Ghats.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/04/Dudhsagar_Falls%2C_Goa.jpg',
      icon: Icons.waterfall_chart_rounded,
    ),

    PlaceItem(
      name: 'Fontainhas',
      category: 'Culture',
      rating: '4.7',
      distance: '10 km',
      description:
          'Explore colourful Portuguese-style streets in the heart of Panaji.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/0a/Fontainhas_Goa_vrvbgoa2k24_%287%29.jpg',
      icon: Icons.account_balance_rounded,
    ),

    PlaceItem(
      name: 'Palolem Beach',
      category: 'Nature',
      rating: '4.8',
      distance: '38 km',
      description:
          'A beautiful crescent-shaped beach surrounded by palm trees.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/6e/Palolem_Beach.jpg',
      icon: Icons.waves_rounded,
    ),
  ];

  // ============================================================
  // JAIPUR
  // ============================================================

  final List<PlaceItem> jaipurPlaces = [
    PlaceItem(
      name: 'Hawa Mahal',
      category: 'Attractions',
      rating: '4.8',
      distance: '2 km',
      description:
          'Jaipur’s iconic Palace of Winds, famous for its pink sandstone facade.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/fb/Hawa_Mahal_in_Jaipur%2C_India.jpg',
      icon: Icons.account_balance_rounded,
    ),

    PlaceItem(
      name: 'Amber Fort',
      category: 'Culture',
      rating: '4.8',
      distance: '11 km',
      description:
          'A magnificent hilltop fort combining Rajput and Mughal architecture.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/7/7a/Amber_Fort_Jaipur_Rajasthan_India_%285%29.JPG',
      icon: Icons.castle_rounded,
    ),

    PlaceItem(
      name: 'City Palace',
      category: 'Attractions',
      rating: '4.7',
      distance: '3 km',
      description:
          'A royal palace complex filled with courtyards, museums and historic architecture.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/16/Jaipur_City_Palace%2C_Rajasthan.jpg',
      icon: Icons.location_city_rounded,
    ),

    PlaceItem(
      name: 'Jaipur Local Food',
      category: 'Food',
      rating: '4.6',
      distance: '3 km',
      description:
          'Discover Rajasthan’s famous flavours including dal baati churma and local street food.',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.restaurant_rounded,
    ),

    PlaceItem(
      name: 'Jal Mahal',
      category: 'Nature',
      rating: '4.6',
      distance: '6 km',
      description:
          'A beautiful palace appearing to float in the middle of Man Sagar Lake.',
      imageUrl:
          'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.water_rounded,
    ),
  ];

  // ============================================================
  // MANALI
  // ============================================================

  final List<PlaceItem> manaliPlaces = [
    PlaceItem(
      name: 'Hadimba Temple',
      category: 'Culture',
      rating: '4.8',
      distance: '2 km',
      description:
          'A distinctive wooden temple surrounded by the cedar forests of Old Manali.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/37/Hadimba_temple_manali.jpg',
      icon: Icons.temple_hindu_rounded,
    ),

    PlaceItem(
      name: 'Solang Valley',
      category: 'Nature',
      rating: '4.7',
      distance: '13 km',
      description:
          'A scenic mountain valley popular for adventure activities and breathtaking views.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/1b/Solang_valley_in_manali.jpg',
      icon: Icons.terrain_rounded,
    ),

    PlaceItem(
      name: 'Rohtang Pass',
      category: 'Nature',
      rating: '4.8',
      distance: '51 km',
      description:
          'A spectacular high mountain pass surrounded by snow-covered Himalayan landscapes.',
      imageUrl:
          'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.landscape_rounded,
    ),

    PlaceItem(
      name: 'Old Manali',
      category: 'Culture',
      rating: '4.6',
      distance: '3 km',
      description:
          'A relaxed mountain neighbourhood filled with cafes, shops and local experiences.',
      imageUrl:
          'https://images.unsplash.com/photo-1597074866923-dc0589150358?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.storefront_rounded,
    ),

    PlaceItem(
      name: 'Himalayan Food',
      category: 'Food',
      rating: '4.7',
      distance: '2 km',
      description:
          'Try warm Himalayan favourites and local mountain cuisine in Manali.',
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.restaurant_rounded,
    ),
  ];

  // ============================================================
  // MUMBAI
  // ============================================================

  final List<PlaceItem> mumbaiPlaces = [
    PlaceItem(
      name: 'Gateway of India',
      category: 'Attractions',
      rating: '4.7',
      distance: '4 km',
      description:
          'Mumbai’s iconic waterfront monument overlooking the Arabian Sea.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/37/Gateway_of_India%2C_Mumbai%2C_India.jpg',
      icon: Icons.account_balance_rounded,
    ),

    PlaceItem(
      name: 'Marine Drive',
      category: 'Nature',
      rating: '4.8',
      distance: '5 km',
      description:
          'A famous seaside promenade known for sunsets and Mumbai’s skyline.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/84/Marine_Drive_Mumbai_India.jpg',
      icon: Icons.waves_rounded,
    ),

    PlaceItem(
      name: 'Vada Pav',
      category: 'Food',
      rating: '4.7',
      distance: '3 km',
      description:
          'Try Mumbai’s iconic street-food snack, loved by locals across the city.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/29/Vada_Pav_of_Mumbai.jpg',
      icon: Icons.fastfood_rounded,
    ),

    PlaceItem(
      name: 'Elephanta Caves',
      category: 'Culture',
      rating: '4.6',
      distance: '10 km',
      description:
          'Ancient rock-cut cave temples located on Elephanta Island.',
      imageUrl:
          'https://images.unsplash.com/photo-1595658658481-d53d3f999875?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.account_balance_rounded,
    ),

    PlaceItem(
      name: 'Colaba',
      category: 'Attractions',
      rating: '4.6',
      distance: '4 km',
      description:
          'A lively South Mumbai neighbourhood filled with heritage buildings, shops and cafes.',
      imageUrl:
          'https://images.unsplash.com/photo-1570168007204-dfb528c6958f?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.location_city_rounded,
    ),
  ];

  // ============================================================
  // KERALA
  // ============================================================

  final List<PlaceItem> keralaPlaces = [
    PlaceItem(
      name: 'Alleppey Backwaters',
      category: 'Nature',
      rating: '4.9',
      distance: '15 km',
      description:
          'Cruise through Kerala’s peaceful backwaters surrounded by palms and villages.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/1c/Alleppey_backwaters_in_Kerala.jpg',
      icon: Icons.water_rounded,
    ),

    PlaceItem(
      name: 'Varkala Beach',
      category: 'Nature',
      rating: '4.8',
      distance: '8 km',
      description:
          'A scenic cliffside beach famous for sunsets, sea views and relaxed coastal life.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/88/Varkala_Beach%2C_Varkala%2C_Kerala.jpg',
      icon: Icons.beach_access_rounded,
    ),

    PlaceItem(
      name: 'Kathakali Experience',
      category: 'Culture',
      rating: '4.8',
      distance: '5 km',
      description:
          'Experience Kerala’s traditional dance-drama, colourful costumes and storytelling.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/cd/%27Kathakali%27-The_cultural_soul_of_Kerala.jpg',
      icon: Icons.theater_comedy_rounded,
    ),

    PlaceItem(
      name: 'Kerala Sadya',
      category: 'Food',
      rating: '4.7',
      distance: '4 km',
      description:
          'Enjoy a traditional Kerala vegetarian feast served with rice and local dishes.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/4a/Simple_Kerala_sadya.jpg',
      icon: Icons.restaurant_rounded,
    ),

    PlaceItem(
      name: 'Kerala Houseboat',
      category: 'Attractions',
      rating: '4.9',
      distance: '16 km',
      description:
          'Relax aboard a traditional houseboat while exploring the peaceful backwaters.',
      imageUrl:
          'https://images.unsplash.com/photo-1593693411515-c20261bcad6e?auto=format&fit=crop&w=1200&q=85',
      icon: Icons.directions_boat_rounded,
    ),
  ];

  // ============================================================
  // FILTER
  // ============================================================

  List<PlaceItem> get filteredPlaces {
    if (selectedCategory == 'All') {
      return allPlaces;
    }

    return allPlaces
        .where((place) => place.category == selectedCategory)
        .toList();
  }

  // ============================================================
  // FAVOURITES
  // ============================================================

  void toggleFavourite(String placeName) {
    setState(() {
      if (favouritePlaces.contains(placeName)) {
        favouritePlaces.remove(placeName);
      } else {
        favouritePlaces.add(placeName);
      }
    });
  }

  // ============================================================
  // PLACE DETAILS
  // ============================================================

  void openPlace(PlaceItem place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailsScreen(
          destination: widget.destination,
          place: {
            'name': place.name,
            'category': place.category,
            'rating': place.rating,
            'distance': place.distance,
            'description': place.description,
            'icon': place.icon,
            'imageUrl': place.imageUrl,
          },
        ),
      ),
    );
  }

  // ============================================================
  // RESET FILTER WHEN DESTINATION CHANGES
  // ============================================================

  @override
  void didUpdateWidget(covariant PlacesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.destination != widget.destination) {
      setState(() {
        selectedCategory = 'All';
      });
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ============================================================
            // HEADER
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: darkText,
                          size: 25,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF718386),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.destination,
                            style: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: teal,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // SUBTITLE
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 18),
                child: Text(
                  'Places you might love',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF718386),
                  ),
                ),
              ),
            ),

            // ============================================================
            // FILTERS
            // ============================================================

            SliverToBoxAdapter(
              child: SizedBox(
                height: 57,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  children: [
                    _CategoryChip(
                      label: 'All',
                      selected: selectedCategory == 'All',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'All';
                        });
                      },
                    ),
                    _CategoryChip(
                      label: 'Attractions',
                      selected: selectedCategory == 'Attractions',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Attractions';
                        });
                      },
                    ),
                    _CategoryChip(
                      label: 'Food',
                      selected: selectedCategory == 'Food',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Food';
                        });
                      },
                    ),
                    _CategoryChip(
                      label: 'Nature',
                      selected: selectedCategory == 'Nature',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Nature';
                        });
                      },
                    ),
                    _CategoryChip(
                      label: 'Culture',
                      selected: selectedCategory == 'Culture',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Culture';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // PLACE CARDS
            // ============================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 23, 22, 35),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final place = filteredPlaces[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: _ColourfulPlaceCard(
                        place: place,
                        isFavourite:
                            favouritePlaces.contains(place.name),
                        onFavourite: () {
                          toggleFavourite(place.name);
                        },
                        onTap: () {
                          openPlace(place);
                        },
                      ),
                    );
                  },
                  childCount: filteredPlaces.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================================================
// CATEGORY CHIP
// ========================================================================

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  static const Color teal = Color(0xFF087E8B);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: selected ? teal : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? teal
                : const Color(0xFFDCE6E7),
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: teal.withValues(alpha: 0.18),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Colors.white
                : const Color(0xFF53676A),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ========================================================================
// COLOURFUL PLACE CARD
// ========================================================================

class _ColourfulPlaceCard extends StatelessWidget {
  final PlaceItem place;
  final bool isFavourite;
  final VoidCallback onFavourite;
  final VoidCallback onTap;

  const _ColourfulPlaceCard({
    required this.place,
    required this.isFavourite,
    required this.onFavourite,
    required this.onTap,
  });

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);

  Color get categoryColor {
    switch (place.category) {
      case 'Food':
        return const Color(0xFFE87935);

      case 'Nature':
        return const Color(0xFF2E8B57);

      case 'Culture':
        return const Color(0xFF8B5CF6);

      case 'Attractions':
        return teal;

      default:
        return teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================================
            // IMAGE
            // ============================================================

            SizedBox(
              height: 235,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    place.imageUrl,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return _ImageFallback(
                        icon: place.icon,
                        categoryColor: categoryColor,
                      );
                    },
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return Container(
                        color: const Color(0xFFE7F6F3),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: categoryColor,
                          ),
                        ),
                      );
                    },
                  ),

                  // Image gradient
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.15),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.35),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Category
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        place.category.toUpperCase(),
                        style: TextStyle(
                          color: categoryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),

                  // Favourite
                  Positioned(
                    top: 14,
                    right: 14,
                    child: GestureDetector(
                      onTap: onFavourite,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.95),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavourite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavourite
                              ? Colors.redAccent
                              : darkText,
                          size: 25,
                        ),
                      ),
                    ),
                  ),

                  // Distance
                  Positioned(
                    left: 16,
                    bottom: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.48),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            place.distance,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ============================================================
            // DETAILS
            // ============================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                18,
                19,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: darkText,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFB000),
                              size: 19,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              place.rating,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: darkText,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: Color(0xFF9AA8AA),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF718386),
                              size: 18,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              place.distance,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF718386),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 9),

                        Text(
                          place.description,
                          style: const TextStyle(
                            fontSize: 12.5,
                            height: 1.45,
                            color: Color(0xFF718386),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9F1EE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: teal,
                      size: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================================================
// IMAGE FALLBACK
// ========================================================================

class _ImageFallback extends StatelessWidget {
  final IconData icon;
  final Color categoryColor;

  const _ImageFallback({
    required this.icon,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            categoryColor.withValues(alpha: 0.18),
            categoryColor.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 70,
          color: categoryColor,
        ),
      ),
    );
  }
}

// ========================================================================
// PLACE MODEL
// ========================================================================

class PlaceItem {
  final String name;
  final String category;
  final String rating;
  final String distance;
  final String description;
  final String imageUrl;
  final IconData icon;

  const PlaceItem({
    required this.name,
    required this.category,
    required this.rating,
    required this.distance,
    required this.description,
    required this.imageUrl,
    required this.icon,
  });
}