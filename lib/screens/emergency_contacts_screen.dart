import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),

      appBar: AppBar(
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: darkText,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your trusted contacts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'People who can be contacted quickly in an emergency.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            _ContactCard(
              name: 'Mom',
              phone: '+91 98765 43210',
              icon: Icons.person,
            ),

            _ContactCard(
              name: 'Dad',
              phone: '+91 98765 12345',
              icon: Icons.person,
            ),

            _ContactCard(
              name: 'Travel Buddy',
              phone: '+91 98765 67890',
              icon: Icons.people,
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Add contact feature coming soon',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Emergency Contact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final IconData icon;

  const _ContactCard({
    required this.name,
    required this.phone,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      elevation: 1,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0F4F5),
          child: Icon(
            icon,
            color: const Color(0xFF087E8B),
          ),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF12343B),
          ),
        ),

        subtitle: Text(phone),

        trailing: IconButton(
          icon: const Icon(
            Icons.call,
            color: Color(0xFF087E8B),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Calling $name...'),
              ),
            );
          },
        ),
      ),
    );
  }
}