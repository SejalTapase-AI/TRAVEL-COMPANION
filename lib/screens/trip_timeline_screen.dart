import 'package:flutter/material.dart';

class TripTimelineScreen extends StatelessWidget {
  final String destination;
  final String selectedPlace;
  final DateTime startDate;
  final DateTime endDate;
  final int travellers;
  final List<String> activities;

  const TripTimelineScreen({
    super.key,
    required this.destination,
    required this.selectedPlace,
    required this.startDate,
    required this.endDate,
    required this.travellers,
    required this.activities,
  });

  String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Trip',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 10, 22, 30),
        children: [
          // ─────────────────────────
          // TRIP HEADER
          // ─────────────────────────
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF087E8B),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'YOUR ADVENTURE',
                  style: TextStyle(
                    color: Color(0xFFBFE6E2),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  destination,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 17,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${formatDate(startDate)} – ${formatDate(endDate)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.people_alt_rounded,
                      size: 17,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$travellers travellers',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            'Your itinerary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF12343B),
            ),
          ),

          const SizedBox(height: 18),

          // ─────────────────────────
          // DAY 1
          // ─────────────────────────
          _TimelineDay(
            day: 'DAY 1',
            date: formatDate(startDate),
            items: [
              _TimelineItem(
                time: '09:00 AM',
                title: 'Start your adventure',
                subtitle: 'Breakfast & get ready',
                icon: Icons.wb_sunny_rounded,
              ),
              _TimelineItem(
                time: '11:00 AM',
                title: selectedPlace,
                subtitle: 'Explore this destination',
                icon: Icons.place_rounded,
              ),
              if (activities.contains('Try local food'))
                _TimelineItem(
                  time: '01:30 PM',
                  title: 'Try local food',
                  subtitle: 'Taste something authentic',
                  icon: Icons.restaurant_rounded,
                ),
            ],
          ),

          const SizedBox(height: 24),

          // ─────────────────────────
          // DAY 2
          // ─────────────────────────
          _TimelineDay(
            day: 'DAY 2',
            date: formatDate(
              startDate.add(const Duration(days: 1)),
            ),
            items: [
              if (activities.contains('Explore local attractions'))
                _TimelineItem(
                  time: '10:00 AM',
                  title: 'Explore local attractions',
                  subtitle: 'Discover something new',
                  icon: Icons.explore_rounded,
                ),
              if (activities.contains('Meet a local'))
                _TimelineItem(
                  time: '02:00 PM',
                  title: 'Meet a local',
                  subtitle: 'Experience the destination together',
                  icon: Icons.people_alt_rounded,
                ),
              if (activities.contains('Nature & adventure'))
                _TimelineItem(
                  time: '05:00 PM',
                  title: 'Nature & adventure',
                  subtitle: 'Make memories outdoors',
                  icon: Icons.terrain_rounded,
                ),
            ],
          ),

          const SizedBox(height: 24),

          // ─────────────────────────
          // TRIP COMPLETE MESSAGE
          // ─────────────────────────
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFF087E8B),
                  size: 28,
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Your trip is ready! Enjoy exploring and making new connections.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Color(0xFF526568),
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

// ═════════════════════════════════════════════
// TIMELINE DAY
// ═════════════════════════════════════════════

class _TimelineDay extends StatelessWidget {
  final String day;
  final String date;
  final List<_TimelineItem> items;

  const _TimelineDay({
    required this.day,
    required this.date,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF087E8B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF8A9A9D),
              ),
            ),
          ],
        ),

        const SizedBox(height: 13),

        ...items.map(
          (item) => _TimelineRow(item: item),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════
// TIMELINE ITEM
// ═════════════════════════════════════════════

class _TimelineItem {
  final String time;
  final String title;
  final String subtitle;
  final IconData icon;

  const _TimelineItem({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

// ═════════════════════════════════════════════
// TIMELINE ROW
// ═════════════════════════════════════════════

class _TimelineRow extends StatelessWidget {
  final _TimelineItem item;

  const _TimelineRow({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 68,
            child: Text(
              item.time,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8A9A9D),
              ),
            ),
          ),

          Column(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  size: 19,
                  color: Color(0xFF087E8B),
                ),
              ),
            ],
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF718386),
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