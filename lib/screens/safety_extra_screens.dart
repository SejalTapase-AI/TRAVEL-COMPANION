import 'package:flutter/material.dart';

const Color safetyTeal = Color(0xFF087E8B);
const Color safetyDark = Color(0xFF12343B);
const Color safetyBackground = Color(0xFFF7FAFA);

// ============================================================
// GROUP TRACKER
// ============================================================

class GroupTrackerScreen extends StatelessWidget {
  const GroupTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      {
        'name': 'You',
        'location': 'Fort Aguada',
        'status': 'You',
        'icon': Icons.person,
      },
      {
        'name': 'Sejal',
        'location': 'Candolim Beach',
        'status': 'Active',
        'icon': Icons.person,
      },
      {
        'name': 'Ashwini',
        'location': 'Calangute',
        'status': 'Active',
        'icon': Icons.person,
      },
    ];

    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Group Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: safetyDark,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: safetyDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F4F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: safetyTeal,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'Your travel group',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Keep track of trusted group members during your journey.',
                  style: TextStyle(
                    color: Color(0xFF617376),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Group members',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: safetyDark,
            ),
          ),

          const SizedBox(height: 14),

          ...members.map(
            (member) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9F1EE),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      member['icon'] as IconData,
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
                          member['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: safetyDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          member['location'] as String,
                          style: const TextStyle(
                            color: Color(0xFF718386),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F5EA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      member['status'] as String,
                      style: const TextStyle(
                        color: Color(0xFF27834D),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: safetyTeal,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Location sharing is limited to your trusted travel group.',
                    style: TextStyle(
                      color: safetyDark,
                      fontSize: 13,
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
}

// ============================================================
// SAFETY ALERTS
// ============================================================

class SafetyAlertsScreen extends StatelessWidget {
  const SafetyAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alerts = [
      {
        'title': 'Weather advisory',
        'message':
            'Heavy rain may affect some coastal areas today.',
        'icon': Icons.cloud_rounded,
      },
      {
        'title': 'Stay aware',
        'message':
            'Keep your belongings secure in crowded tourist areas.',
        'icon': Icons.warning_amber_rounded,
      },
      {
        'title': 'Travel reminder',
        'message':
            'Keep emergency contacts accessible during your trip.',
        'icon': Icons.shield_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Safety Alerts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: safetyDark,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: safetyDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3D9),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.notifications_active_rounded,
                  color: Color(0xFFE59A00),
                  size: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Important safety information for your journey.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: safetyDark,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          ...alerts.map(
            (alert) => Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F4F5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      alert['icon'] as IconData,
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
                          alert['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: safetyDark,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          alert['message'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: Color(0xFF617376),
                          ),
                        ),
                      ],
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

// ============================================================
// SAFETY TIPS
// ============================================================

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'Keep your emergency contacts easily accessible.',
      'Share your location only with people you trust.',
      'Stay with your travel group in unfamiliar areas.',
      'Keep your phone charged during long journeys.',
      'Be aware of local weather and travel conditions.',
      'Save important safety information before travelling.',
    ];

    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Safety Tips',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: safetyDark,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: safetyDark,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9F1EE),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: safetyTeal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    tips[index],
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: safetyDark,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// PRIVACY CONTROLS
// ============================================================

class PrivacyControlsScreen extends StatefulWidget {
  const PrivacyControlsScreen({super.key});

  @override
  State<PrivacyControlsScreen> createState() =>
      _PrivacyControlsScreenState();
}

class _PrivacyControlsScreenState
    extends State<PrivacyControlsScreen> {
  bool locationSharing = true;
  bool groupVisibility = true;
  bool emergencySharing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Privacy Controls',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: safetyDark,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: safetyDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F4F5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lock_rounded,
                  color: safetyTeal,
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Choose what safety information you want to share and with whom.',
                    style: TextStyle(
                      color: safetyDark,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Sharing preferences',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: safetyDark,
            ),
          ),

          const SizedBox(height: 12),

          _PrivacySwitch(
            title: 'Location sharing',
            subtitle:
                'Share your current location with your trusted group.',
            value: locationSharing,
            onChanged: (value) {
              setState(() {
                locationSharing = value;
              });
            },
          ),

          _PrivacySwitch(
            title: 'Group visibility',
            subtitle:
                'Allow approved group members to see your travel status.',
            value: groupVisibility,
            onChanged: (value) {
              setState(() {
                groupVisibility = value;
              });
            },
          ),

          _PrivacySwitch(
            title: 'Emergency sharing',
            subtitle:
                'Allow emergency information to be shared during SOS.',
            value: emergencySharing,
            onChanged: (value) {
              setState(() {
                emergencySharing = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _PrivacySwitch extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PrivacySwitch({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.security_rounded,
            color: safetyTeal,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: Color(0xFF718386),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: safetyTeal,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// OFFLINE SAFETY
// ============================================================

class OfflineSafetyScreen extends StatelessWidget {
  const OfflineSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyBackground,
      appBar: AppBar(
        title: const Text(
          'Offline Safety',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: safetyDark,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: safetyDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F4F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.wifi_off_rounded,
                  color: safetyTeal,
                  size: 38,
                ),
                SizedBox(height: 12),
                Text(
                  'Safety when connectivity is weak',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Essential safety information remains available even when you have limited connectivity.',
                  style: TextStyle(
                    color: Color(0xFF617376),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _OfflineItem(
            icon: Icons.contact_phone_rounded,
            title: 'Emergency contacts',
            subtitle: 'Available offline',
          ),

          _OfflineItem(
            icon: Icons.shield_rounded,
            title: 'Safety instructions',
            subtitle: 'Saved on this device',
          ),

          _OfflineItem(
            icon: Icons.location_on_rounded,
            title: 'Last-known group location',
            subtitle: 'Fort Aguada • Updated recently',
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF27834D),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Your essential safety information is ready for offline access.',
                    style: TextStyle(
                      color: safetyDark,
                      fontSize: 13,
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
}

class _OfflineItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OfflineItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFD9F1EE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: safetyTeal,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: safetyDark,
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
              ],
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: Color(0xFF27834D),
            size: 21,
          ),
        ],
      ),
    );
  }
}