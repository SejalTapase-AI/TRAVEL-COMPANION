import 'package:flutter/material.dart';

import 'destination_search_screen.dart';
import 'trip_timeline_screen.dart';
import 'places_screen.dart';
import 'safety_home_screen.dart';
import 'place_details_screen.dart';
import 'find_local_screen.dart';
import 'connection_requests_screen.dart';
import 'ai_assistant_screen.dart';
import 'language_helper_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);
  static const Color softTeal = Color(0xFFD9F1EE);

  // -----------------------------------------------------------------------
  // NAVIGATION
  // -----------------------------------------------------------------------

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

  void openSafety(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SafetyHomeScreen(),
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

  void openRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionRequestsScreen(),
      ),
    );
  }

  void openAI(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AIAssistantScreen(),
      ),
    );
  }

  void openLanguage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LanguageHelperScreen(),
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
    String imageUrl,
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
            'imageUrl': imageUrl,
            'icon': icon,
          },
        ),
      ),
    );
  }

  // -----------------------------------------------------------------------
  // BUILD
  // -----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ================================================================
      // BOTTOM NAVIGATION
      // ================================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        backgroundColor: Colors.white,
        indicatorColor: softTeal,
        elevation: 3,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map_rounded),
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

      // ================================================================
      // BODY
      // ================================================================

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ============================================================
            // HEADER
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning 👋',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF718386),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Where are you going?',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () => openRequests(context),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 14,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: darkText,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // SEARCH
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                child: GestureDetector(
                  onTap: () => openExplore(context),
                  child: Container(
                    height: 58,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
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
                          'Search destinations, places...',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8A9A9D),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.tune_rounded,
                          color: Color(0xFF8A9A9D),
                          size: 21,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ============================================================
            // USP INTRO
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 14),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Travel smarter with us',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          color: darkText,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: softTeal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'YOUR COMPANION',
                        style: TextStyle(
                          color: teal,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // SAFETY USP
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: UspImageCard(
                  title: 'Travel Safety',
                  subtitle: 'Stay protected wherever you go',
                  description:
                      'SOS, emergency contacts and group safety in one place.',
                  label: 'SAFETY FIRST',
                  imageUrl:
                      'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=85',
                  icon: Icons.shield_rounded,
                  accent: const Color(0xFF087E8B),
                  onTap: () => openSafety(context),
                ),
              ),
            ),

            // ============================================================
            // MEET A LOCAL USP
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
                child: UspImageCard(
                  title: 'Meet a Local',
                  subtitle: 'Meet people, not just places',
                  description:
                      'Connect with locals and experience your destination differently.',
                  label: 'LOCAL CONNECTION',
                  imageUrl:
                      'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=1200&q=85',
                  icon: Icons.people_alt_rounded,
                  accent: const Color(0xFFE87935),
                  onTap: () => openFindLocal(context),
                ),
              ),
            ),

            // ============================================================
            // AI USP
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
                child: UspImageCard(
                  title: 'AI Travel Assistant',
                  subtitle: 'Your personal travel companion',
                  description:
                      'Get destination ideas, trip suggestions and travel help instantly.',
                  label: 'AI POWERED',
                  imageUrl:
                      'https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=1200&q=85',
                  icon: Icons.auto_awesome_rounded,
                  accent: const Color(0xFF7C4DFF),
                  onTap: () => openAI(context),
                ),
              ),
            ),

            // ============================================================
            // LANGUAGE USP
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
                child: UspImageCard(
                  title: 'Language Helper',
                  subtitle: 'Speak with confidence',
                  description:
                      'Useful local phrases for food, directions, shopping and emergencies.',
                  label: 'TRAVEL PHRASES',
                  imageUrl:
                      'https://images.unsplash.com/photo-1526772662000-3f88f10405ff?auto=format&fit=crop&w=1200&q=85',
                  icon: Icons.translate_rounded,
                  accent: const Color(0xFF00897B),
                  onTap: () => openLanguage(context),
                ),
              ),
            ),

            // ============================================================
            // DESTINATION HERO
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 32, 22, 0),
                child: DestinationHero(
                  destination: 'Goa',
                  imageUrl:
                      'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=1400&q=85',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlacesScreen(
                          destination: 'Goa',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ============================================================
            // POPULAR DESTINATIONS
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 32, 22, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Explore',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  children: [
                    DestinationImageCard(
                      name: 'Goa',
                      subtitle: 'Beaches & nightlife',
                      imageUrl:
                          'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=900&q=85',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(
                              destination: 'Goa',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationImageCard(
                      name: 'Jaipur',
                      subtitle: 'Culture & heritage',
                      imageUrl:
                          'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=900&q=85',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(
                              destination: 'Jaipur',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationImageCard(
                      name: 'Manali',
                      subtitle: 'Mountains & adventure',
                      imageUrl:
                          'https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=900&q=85',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(
                              destination: 'Manali',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationImageCard(
                      name: 'Kerala',
                      subtitle: 'Backwaters & nature',
                      imageUrl:
                          'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=900&q=85',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(
                              destination: 'Kerala',
                            ),
                          ),
                        );
                      },
                    ),
                    DestinationImageCard(
                      name: 'Udaipur',
                      subtitle: 'Lakes & palaces',
                      imageUrl:
                          'https://images.unsplash.com/photo-1602643163983-ed0babc39797?auto=format&fit=crop&w=900&q=85',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacesScreen(
                              destination: 'Udaipur',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // RECOMMENDED
            // ============================================================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 32, 22, 15),
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

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: RecommendedPlaceCard(
                  name: 'Fort Aguada',
                  subtitle: 'Goa • Historic landmark',
                  rating: '4.8',
                  description:
                      'A historic Portuguese fort overlooking the Arabian Sea.',
                  imageUrl:
                      'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=1000&q=85',
                  onTap: () {
                    openPlace(
                      context,
                      'Fort Aguada',
                      'Attractions',
                      '4.8',
                      '12 km',
                      'A historic Portuguese fort overlooking the Arabian Sea.',
                      'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=1200&q=85',
                      Icons.fort_rounded,
                    );
                  },
                ),
              ),
            ),

            // Bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 35),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================================================
// LARGE USP IMAGE CARD
// ========================================================================

class UspImageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String label;
  final String imageUrl;
  final IconData icon;
  final Color accent;
  final VoidCallback onTap;

  const UspImageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.label,
    required this.imageUrl,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // IMAGE
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: accent,
                  child: Icon(
                    icon,
                    size: 80,
                    color: Colors.white,
                  ),
                );
              },
            ),

            // DARK GRADIENT
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.12),
                    Colors.black.withValues(alpha: 0.28),
                    Colors.black.withValues(alpha: 0.78),
                  ],
                ),
              ),
            ),

            // ACCENT GLOW
            Positioned(
              right: -40,
              top: -45,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withValues(alpha: 0.35),
                ),
              ),
            ),

            // CONTENT
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: accent,
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.90),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          color: accent,
                          size: 23,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.4,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFE8F2F2),
                      fontSize: 11.5,
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Explore  →',
                          style: TextStyle(
                            color: accent,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
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
// DESTINATION HERO
// ========================================================================

class DestinationHero extends StatelessWidget {
  final String destination;
  final String imageUrl;
  final VoidCallback onTap;

  const DestinationHero({
    super.key,
    required this.destination,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF087E8B),
                  child: const Icon(
                    Icons.beach_access_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                );
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.78),
                  ],
                ),
              ),
            ),

            const Positioned(
              top: 17,
              left: 17,
              child: _WhiteBadge(
                text: '✦  FEATURED DESTINATION',
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              bottom: 19,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover Goa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Beaches • Culture • Local experiences',
                          style: TextStyle(
                            color: Color(0xFFE0F0EF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Explore →',
                      style: TextStyle(
                        color: Color(0xFF087E8B),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
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
// WHITE BADGE
// ========================================================================

class _WhiteBadge extends StatelessWidget {
  final String text;

  const _WhiteBadge({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        '✦  FEATURED DESTINATION',
        style: TextStyle(
          color: Color(0xFF087E8B),
          fontSize: 9,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ========================================================================
// DESTINATION IMAGE CARD
// ========================================================================

class DestinationImageCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const DestinationImageCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 165,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFD9F1EE),
                  child: const Icon(
                    Icons.travel_explore_rounded,
                    color: Color(0xFF087E8B),
                    size: 45,
                  ),
                );
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 14,
              right: 10,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10.5,
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
// RECOMMENDED PLACE CARD
// ========================================================================

class RecommendedPlaceCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String rating;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const RecommendedPlaceCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 175,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFD9F1EE),
                        child: const Icon(
                          Icons.fort_rounded,
                          color: Color(0xFF087E8B),
                          size: 60,
                        ),
                      );
                    },
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.42),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'RECOMMENDED',
                        style: TextStyle(
                          color: Color(0xFF087E8B),
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(17),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF12343B),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718386),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFB000),
                              size: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF718386),
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9F1EE),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF087E8B),
                      size: 16,
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