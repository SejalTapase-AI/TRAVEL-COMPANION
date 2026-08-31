import 'package:flutter/material.dart';

import 'emergency_services_screen.dart';
import 'emergency_contacts_screen.dart';
import 'group_tracking_screen.dart';
import 'offline_safety_screen.dart';

class SafetyHomeScreen extends StatelessWidget {
  const SafetyHomeScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);

  void openEmergencyServices(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmergencyServicesScreen(),
      ),
    );
  }

  void openEmergencyContacts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmergencyContactsScreen(),
      ),
    );
  }

  void openGroupTracking(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupTrackingScreen(),
      ),
    );
  }

  void openOfflineSafety(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OfflineSafetyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: darkText,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Safety Center',
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ─────────────────────────────
              // SAFETY HEADER
              // ─────────────────────────────

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shield_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Travel safely',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Your safety tools are always within reach.',
                      style: TextStyle(
                        color: Color(0xFFD8F2F0),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ─────────────────────────────
              // SOS
              // ─────────────────────────────

              const Text(
                'Emergency',
                style: TextStyle(
                  color: darkText,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () => openEmergencyServices(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.sos_rounded,
                          color: Colors.red.shade700,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emergency Services',
                              style: TextStyle(
                                color: darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Quick access to emergency help',
                              style: TextStyle(
                                color: Color(0xFF718386),
                                fontSize: 13,
                              ),
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

              const SizedBox(height: 12),

              // ─────────────────────────────
              // EMERGENCY CONTACTS
              // ─────────────────────────────

              GestureDetector(
                onTap: () => openEmergencyContacts(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9F1EE),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.contact_phone_rounded,
                          color: teal,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emergency Contacts',
                              style: TextStyle(
                                color: darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Manage people to contact in an emergency',
                              style: TextStyle(
                                color: Color(0xFF718386),
                                fontSize: 13,
                              ),
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

              const SizedBox(height: 28),

              // ─────────────────────────────
              // JOURNEY SAFETY
              // ─────────────────────────────

              const Text(
                'Journey Safety',
                style: TextStyle(
                  color: darkText,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // GROUP TRACKING

              _SafetyCard(
                icon: Icons.location_on_rounded,
                title: 'Group Tracking',
                subtitle:
                    'Share and view your group location',
                onTap: () => openGroupTracking(context),
              ),

              const SizedBox(height: 12),

              // OFFLINE SAFETY

              _SafetyCard(
                icon: Icons.wifi_off_rounded,
                title: 'Offline Safety',
                subtitle:
                    'Access essential safety information without internet',
                onTap: () => openOfflineSafety(context),
              ),

              const SizedBox(height: 28),

              // ─────────────────────────────
              // SAFETY NOTE
              // ─────────────────────────────

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF6F5),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: teal,
                      size: 23,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Safety features are designed to help you stay connected and prepared during your journey.',
                        style: TextStyle(
                          color: darkText,
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// SAFETY CARD
// ═════════════════════════════════════════════

class _SafetyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SafetyCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                color: Color(0xFFD9F1EE),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: teal,
                size: 28,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: darkText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF718386),
                      fontSize: 13,
                      height: 1.35,
                    ),
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
    );
  }
}