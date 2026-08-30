import 'package:flutter/material.dart';
import '../ashwini_module.dart';

class FindLocalScreen extends StatelessWidget {
  final String placeName;
  final String destination;

  const FindLocalScreen({
    super.key,
    required this.placeName,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final locals = [
      {
        'name': 'Aarav',
        'age': '26',
        'rating': '4.9',
        'role': 'Local Guide',
        'bio': 'Food lover • Photographer • Goa explorer',
        'languages': 'English • Hindi',
        'icon': Icons.person_rounded,
      },
      {
        'name': 'Meera',
        'age': '29',
        'rating': '4.8',
        'role': 'Travel Enthusiast',
        'bio': 'Culture • Beaches • Local experiences',
        'languages': 'English • Hindi • Marathi',
        'icon': Icons.person_rounded,
      },
      {
        'name': 'Rohan',
        'age': '25',
        'rating': '4.7',
        'role': 'Local Explorer',
        'bio': 'Adventure • Food • Hidden places',
        'languages': 'English • Hindi',
        'icon': Icons.person_rounded,
      },
    ];

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
        title: const Text(
          'Find a Local',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // ─────────────────────────────────
          // HEADER
          // ─────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE7F5F3),
                borderRadius: BorderRadius.circular(22),
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
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore $placeName like a local',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12343B),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'People from $destination who can help you discover more.',
                          style: const TextStyle(
                            fontSize: 12,
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

          // ─────────────────────────────────
          // AVAILABLE LOCALS
          // ─────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                const Text(
                  'Available locals',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF12343B),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9F1EE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '3 nearby',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF087E8B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ─────────────────────────────────
          // LOCAL CARDS
          // ─────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                22,
                0,
                22,
                30,
              ),
              itemCount: locals.length,
              itemBuilder: (context, index) {
                final local = locals[index];

                return _LocalCard(
                  local: local,
                  onConnect: () {
                    _showConnectionDialog(
                      context,
                      local['name'] as String,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showConnectionDialog(
    BuildContext context,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            'Connect with local?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF12343B),
            ),
          ),
          content: Text(
            'Send a connection request to $name?',
            style: const TextStyle(
              color: Color(0xFF617376),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF718386),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalProfileScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF087E8B),
                foregroundColor: Colors.white,
              ),
              child: const Text('Connect'),
            ),
          ],
        );
      },
    );
  }
}

// ═════════════════════════════════════════════
// LOCAL CARD
// ═════════════════════════════════════════════

class _LocalCard extends StatelessWidget {
  final Map<String, dynamic> local;
  final VoidCallback onConnect;

  const _LocalCard({
    required this.local,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17),
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
          Row(
            children: [
              // Avatar
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  local['icon'],
                  size: 34,
                  color: const Color(0xFF087E8B),
                ),
              ),

              const SizedBox(width: 14),

              // Name + role
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          local['name'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12343B),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '• ${local['age']}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF718386),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Text(
                      local['role'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF087E8B),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Color(0xFFFFB300),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          local['rating'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Bio
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              local['bio'],
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF617376),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Languages
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(
                  Icons.language_rounded,
                  size: 16,
                  color: Color(0xFF718386),
                ),
                const SizedBox(width: 5),
                Text(
                  local['languages'],
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF718386),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Connect button
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton.icon(
              onPressed: onConnect,
              icon: const Icon(
                Icons.person_add_alt_1_rounded,
                size: 18,
              ),
              label: const Text(
                'Connect',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF087E8B),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}