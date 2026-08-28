import 'package:flutter/material.dart';
import 'emergency_contacts_screen.dart';
import 'emergency_services_screen.dart';

class SafetyHomeScreen extends StatelessWidget {
  const SafetyHomeScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color lightBackground = Color(0xFFF7FAFA);

  void activateSOS(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Emergency SOS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          content: const Text(
            'Are you sure you want to activate SOS? '
            'Your emergency contacts would be notified.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'SOS activated. Emergency contacts would be notified.',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('ACTIVATE SOS'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,

      appBar: AppBar(
        title: const Text(
          'Safety Center',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: darkText,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stay safe while travelling',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Quick access to emergency and safety features.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // ============================================================
              // SOS BUTTON
              // ============================================================

              GestureDetector(
                onTap: () => activateSOS(context),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.25),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.emergency,
                        color: Colors.white,
                        size: 65,
                      ),

                      SizedBox(height: 10),

                      Text(
                        'SOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Tap for emergency help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ============================================================
              // SECTION TITLE
              // ============================================================

              const Text(
                'Safety & Emergency',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 15),

              // ============================================================
              // EMERGENCY CONTACTS
              // ============================================================

              SafetyCard(
                icon: Icons.contact_phone,
                title: 'Emergency Contacts',
                subtitle: 'Contact your trusted people',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EmergencyContactsScreen(),
                    ),
                  );
                },
              ),

              // ============================================================
              // EMERGENCY SERVICES
              // ============================================================

              SafetyCard(
                icon: Icons.local_hospital,
                title: 'Emergency Services',
                subtitle: 'Find nearby hospitals and services',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EmergencyServicesScreen(),
                    ),
                  );
                },
              ),

              // ============================================================
              // GROUP TRACKER
              // ============================================================

              SafetyCard(
                icon: Icons.groups,
                title: 'Group Tracker',
                subtitle: 'See your travel group status',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Group Tracker selected',
                      ),
                    ),
                  );
                },
              ),

              // ============================================================
              // SAFETY ALERTS
              // ============================================================

              SafetyCard(
                icon: Icons.warning_amber_rounded,
                title: 'Safety Alerts',
                subtitle: 'Stay updated about your destination',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Safety Alerts selected',
                      ),
                    ),
                  );
                },
              ),

              // ============================================================
              // SAFETY TIPS
              // ============================================================

              SafetyCard(
                icon: Icons.shield,
                title: 'Safety Tips',
                subtitle: 'Useful tips for safer travelling',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Safety Tips selected',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // ============================================================
              // PRIVACY MESSAGE
              // ============================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: teal,
                      size: 25,
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        'Your safety information is private '
                        'and should only be shared with trusted contacts.',
                        style: TextStyle(
                          color: darkText,
                          fontSize: 13,
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

// ==========================================================================
// SAFETY CARD
// ==========================================================================

class SafetyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SafetyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE0F4F5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF087E8B),
            size: 25,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF12343B),
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Colors.grey,
        ),
      ),
    );
  }
}