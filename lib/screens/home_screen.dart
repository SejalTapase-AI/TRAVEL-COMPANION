import 'package:flutter/material.dart';

import 'destination_search_screen.dart';
import 'trip_timeline_screen.dart';
import 'places_screen.dart';
import 'safety_home_screen.dart';
import 'place_details_screen.dart';
import 'find_local_screen.dart';
import 'connection_requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color lightBackground = Color(0xFFF7FAFA);

  void openExplore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DestinationSearchScreen(),
      ),
    );
  }

  void openTrip(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TripTimelineScreen(
          destination: 'Goa',
          selectedPlace: 'Fort Aguada',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(
            const Duration(days: 2),
          ),
          travellers: 2,
          activities: const [
            'Explore local attractions',
            'Try local food',
            'Meet a local',
          ],
        ),
      ),
    );
  }

  void openPlace(
    BuildContext context,
    String name,
    String category,
    String rating,
    String distance,
    String description,
    IconData icon,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailsScreen(
          destination: 'Goa',
          place: {
            'name': name,
            'category': category,
            'rating': rating,
            'distance': distance,
            'description': description,
            'icon': icon,
          },
        ),
      ),
    );
  }

  void openFindLocal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FindLocalScreen(
          placeName: 'Fort Aguada',
          destination: 'Goa',
        ),
      ),
    );
  }

  void openConnectionRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionRequestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,

      // ─────────────────────────────────────
      // BOTTOM NAVIGATION
      // ─────────────────────────────────────
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD9F1EE),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'My Trip',
          ),
        ],
        onDestinationSelected: (index) {
          if (index == 1) {
            openExplore(context);
          } else if (index == 2) {
            openTrip(context);
          }
        },
      ),

      // ─────────────────────────────────────
      // BODY
      // ─────────────────────────────────────
      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            // ─────────────────────────────────
            // HEADER
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  24,
                  22,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good morning 👋',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7F82),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Where are you going?',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: darkText,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: darkText,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ─────────────────────────────────
            // SEARCH BAR
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  24,
                  22,
                  0,
                ),
                child: GestureDetector(
                  onTap: () => openExplore(context),
                  child: Container(
                    height: 58,
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: teal,
                          size: 25,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Search a destination...',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8A9A9D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ─────────────────────────────────
            // POPULAR DESTINATIONS
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  30,
                  22,
                  15,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Popular destinations',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ─────────────────────────────────
            // DESTINATION CARDS
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: SizedBox(
                height: 175,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  children: [
                    DestinationCard(
                      name: 'Goa',
                      subtitle: 'Beaches & nightlife',
                      icon: Icons.beach_access_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PlacesScreen(
                              destination: 'Goa',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationCard(
                      name: 'Jaipur',
                      subtitle: 'Culture & heritage',
                      icon: Icons.account_balance_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PlacesScreen(
                              destination: 'Jaipur',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationCard(
                      name: 'Manali',
                      subtitle:
                          'Mountains & adventure',
                      icon: Icons.terrain_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PlacesScreen(
                              destination: 'Manali',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ─────────────────────────────────
            // RECOMMENDED
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  30,
                  22,
                  15,
                ),
                child: const Text(
                  'Recommended for you',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
            ),

            // ─────────────────────────────────
            // FORT AGUADA
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: GestureDetector(
                  onTap: () {
                    openPlace(
                      context,
                      'Fort Aguada',
                      'Attractions',
                      '4.8',
                      '12 km',
                      'A historic Portuguese fort overlooking the Arabian Sea.',
                      Icons.fort_rounded,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFFD9F1EE),
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.fort_rounded,
                            size: 40,
                            color: teal,
                          ),
                        ),

                        const SizedBox(width: 15),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fort Aguada',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                  color: darkText,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Goa • Historic landmark',
                                style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      Color(0xFF718386),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 17,
                                    color:
                                        Color(0xFFFFB300),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Color(0xFF8A9A9D),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ─────────────────────────────────
            // QUICK ACTIONS
            // ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  30,
                  22,
                  30,
                ),
                child: Column(
                  children: [

                    // ROW 1
                    Row(
                      children: [
                        Expanded(
                          child: QuickActionCard(
                            icon: Icons.explore_rounded,
                            title: 'Explore',
                            subtitle: 'Discover places',
                            onTap: () =>
                                openExplore(context),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: QuickActionCard(
                            icon:
                                Icons.people_alt_rounded,
                            title: 'Find a Local',
                            subtitle:
                                'Meet someone local',
                            onTap: () =>
                                openFindLocal(context),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // SAFETY CENTER
                    QuickActionCard(
                      icon: Icons.shield_rounded,
                      title: 'Safety Center',
                      subtitle:
                          'SOS & emergency help',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SafetyHomeScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    // CONNECTION REQUESTS
                    QuickActionCard(
                      icon:
                          Icons.person_add_alt_1_rounded,
                      title: 'Connection Requests',
                      subtitle:
                          'View traveller requests',
                      onTap: () =>
                          openConnectionRequests(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// DESTINATION CARD
// ═════════════════════════════════════════════

class DestinationCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const DestinationCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color:
                    const Color(0xFFD9F1EE),
                borderRadius:
                    BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF087E8B),
                size: 26,
              ),
            ),

            const Spacer(),

            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),

            const SizedBox(height: 3),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF718386),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// QUICK ACTION CARD
// ═════════════════════════════════════════════

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF087E8B),
          borderRadius:
              BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),

            const SizedBox(height: 18),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFFD8F2F0),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}