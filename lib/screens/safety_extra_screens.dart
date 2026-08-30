import 'package:flutter/material.dart';

const Color safetyTeal = Color(0xFF087E8B);
const Color safetyDark = Color(0xFF12343B);
const Color safetyBackground = Color(0xFFF7FAFA);

// ═════════════════════════════════════════════
// GROUP TRACKER
// ═════════════════════════════════════════════

class GroupTrackerScreen extends StatelessWidget {
  const GroupTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Group Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: safetyBackground,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFD9F1EE),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.groups_rounded,
                  size: 42,
                  color: safetyTeal,
                ),
                SizedBox(height: 15),
                Text(
                  'Your Travel Group',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Stay connected with your group while exploring.',
                  style: TextStyle(color: safetyDark),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Group Members',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: safetyDark,
            ),
          ),

          const SizedBox(height: 12),

          _member(
            'You',
            'Current location',
            Icons.person,
            true,
          ),

          _member(
            'Priya',
            'Nearby • Active',
            Icons.person_outline,
            true,
          ),

          _member(
            'Rahul',
            '2 km away • Active',
            Icons.person_outline,
            true,
          ),

          _member(
            'Ananya',
            'Location unavailable',
            Icons.person_outline,
            false,
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: safetyTeal,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Group locations are shared only with your travel group.',
                    style: TextStyle(
                      color: Color(0xFF5F7073),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _member(
    String name,
    String status,
    IconData icon,
    bool active,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFD9F1EE),
            child: Icon(
              icon,
              color: safetyTeal,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF718386),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            active
                ? Icons.circle
                : Icons.location_off,
            size: 13,
            color: active
                ? Colors.green
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// SAFETY ALERTS
// ═════════════════════════════════════════════

class SafetyAlertsScreen extends StatelessWidget {
  const SafetyAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Safety Alerts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: safetyBackground,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Destination Safety Updates',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: safetyDark,
            ),
          ),

          const SizedBox(height: 15),

          _alertCard(
            Icons.info_outline,
            'Travel Advisory',
            'Stay aware of local conditions and follow official travel guidance.',
          ),

          _alertCard(
            Icons.wb_sunny_outlined,
            'Weather Awareness',
            'Check local weather conditions before planning outdoor activities.',
          ),

          _alertCard(
            Icons.location_on_outlined,
            'Stay Connected',
            'Keep your phone charged and let your group know when changing locations.',
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD9F1EE),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.notifications_active,
                  color: safetyTeal,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Safety alerts help you stay informed during your trip.',
                    style: TextStyle(
                      color: safetyDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _alertCard(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFD9F1EE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: safetyTeal,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF718386),
                    height: 1.4,
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

// ═════════════════════════════════════════════
// SAFETY TIPS
// ═════════════════════════════════════════════

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Safety Tips',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: safetyBackground,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Travel Safer',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: safetyDark,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Simple habits that can make your journey safer.',
            style: TextStyle(
              color: Color(0xFF718386),
            ),
          ),

          const SizedBox(height: 20),

          _tip(
            Icons.phone_android,
            'Keep your phone charged',
            'Carry a power bank and keep emergency contacts accessible.',
          ),

          _tip(
            Icons.people_outline,
            'Stay connected',
            'Keep your travel group updated about your location and plans.',
          ),

          _tip(
            Icons.lock_outline,
            'Protect your belongings',
            'Keep important documents, money and devices secure.',
          ),

          _tip(
            Icons.location_on_outlined,
            'Know your surroundings',
            'Save important locations and be aware of your route.',
          ),

          _tip(
            Icons.emergency,
            'Know how to get help',
            'Use the SOS and emergency services features when necessary.',
          ),

          _tip(
            Icons.verified_user_outlined,
            'Meet locals safely',
            'Use verified profiles and meet in public places.',
          ),
        ],
      ),
    );
  }

  Widget _tip(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: safetyTeal,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF718386),
                    height: 1.4,
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