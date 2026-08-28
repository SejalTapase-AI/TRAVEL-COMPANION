import 'package:flutter/material.dart';
import 'find_local_screen.dart';
import 'trip_planner_screen.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> place;
  final String destination;

  const PlaceDetailsScreen({
    super.key,
    required this.place,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),

      body: CustomScrollView(
        slivers: [
          // ─────────────────────────────────
          // HERO SECTION
          // ─────────────────────────────────
          SliverAppBar(
            expandedHeight: 270,
            pinned: true,
            backgroundColor: const Color(0xFF087E8B),
            foregroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.9),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF12343B),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    color: Color(0xFF12343B),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF087E8B),
                      Color(0xFF62B9B2),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    place['icon'],
                    size: 100,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),

          // ─────────────────────────────────
          // CONTENT
          // ─────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9F1EE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      place['category'],
                      style: const TextStyle(
                        color: Color(0xFF087E8B),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Name
                  Text(
                    place['name'],
                    style: const TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 18,
                        color: Color(0xFF087E8B),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        destination,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF718386),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Rating + distance
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.star_rounded,
                        iconColor: const Color(0xFFFFB300),
                        text: '${place['rating']} rating',
                      ),
                      const SizedBox(width: 10),
                      _InfoChip(
                        icon: Icons.directions_walk_rounded,
                        iconColor: const Color(0xFF087E8B),
                        text: '${place['distance']} away',
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // About
                  const Text(
                    'About this place',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    place['description'],
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF617376),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Details
                  const Text(
                    'Good to know',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: const [
                      Expanded(
                        child: _DetailCard(
                          icon: Icons.schedule_rounded,
                          title: 'Best time',
                          value: 'Morning',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _DetailCard(
                          icon: Icons.payments_outlined,
                          title: 'Budget',
                          value: '₹ Low',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Row(
                    children: [
                      Expanded(
                        child: _DetailCard(
                          icon: Icons.photo_camera_outlined,
                          title: 'Photography',
                          value: 'Great',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _DetailCard(
                          icon: Icons.accessible_rounded,
                          title: 'Accessibility',
                          value: 'Available',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ─────────────────────────────────
                  // FIND A LOCAL
                  // ─────────────────────────────────
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindLocalScreen(
                            placeName: place['name'],
                            destination: destination,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F5F3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFC8E9E5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: Color(0xFF087E8B),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.people_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Want a local experience?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF12343B),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Connect with someone who knows this place.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF718386),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Color(0xFF087E8B),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ─────────────────────────────────
                  // ADD TO TRIP
                  // ─────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TripPlannerScreen(
                              destination: destination,
                              selectedPlace: place['name'],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_rounded),
                      label: const Text(
                        'Add to My Trip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF087E8B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// INFO CHIP
// ═════════════════════════════════════════════

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _InfoChip({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: iconColor,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF526568),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// DETAIL CARD
// ═════════════════════════════════════════════

class _DetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: const Color(0xFF087E8B),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF8A9A9D),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF526568),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}