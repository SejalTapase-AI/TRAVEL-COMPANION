import 'package:flutter/material.dart';
import 'trip_timeline_screen.dart';

class TripPlannerScreen extends StatefulWidget {
  final String destination;
  final String selectedPlace;

  const TripPlannerScreen({
    super.key,
    required this.destination,
    required this.selectedPlace,
  });

  @override
  State<TripPlannerScreen> createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends State<TripPlannerScreen> {
  DateTime? startDate;
  DateTime? endDate;

  int travellers = 2;

  final List<String> activities = [
    'Explore local attractions',
    'Try local food',
    'Meet a local',
    'Nature & adventure',
  ];

  final Set<String> selectedActivities = {};

  Future<void> selectDate(bool isStartDate) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (startDate ?? now)
          : (endDate ?? startDate ?? now),
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (picked == null) return;

    setState(() {
      if (isStartDate) {
        startDate = picked;

        if (endDate != null && endDate!.isBefore(picked)) {
          endDate = null;
        }
      } else {
        if (startDate == null) {
          startDate = picked;
        } else if (!picked.isBefore(startDate!)) {
          endDate = picked;
        }
      }
    });
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';

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

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void createTrip() {
    if (startDate == null || endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your trip dates.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (selectedActivities.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Select at least one activity.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TripTimelineScreen(
          destination: widget.destination,
          selectedPlace: widget.selectedPlace,
          startDate: startDate!,
          endDate: endDate!,
          travellers: travellers,
          activities: selectedActivities.toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'Plan Your Trip',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  10,
                  22,
                  25,
                ),
                children: [
                  // ─────────────────────────
                  // DESTINATION HEADER
                  // ─────────────────────────
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F5F3),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xFF087E8B),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.flight_takeoff_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Your next adventure',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF718386),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.destination,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF12343B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ─────────────────────────
                  // DATES
                  // ─────────────────────────
                  const Text(
                    'When are you travelling?',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 13),

                  Row(
                    children: [
                      Expanded(
                        child: _DateCard(
                          title: 'Start date',
                          date: formatDate(startDate),
                          icon: Icons.calendar_today_rounded,
                          onTap: () => selectDate(true),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _DateCard(
                          title: 'End date',
                          date: formatDate(endDate),
                          icon: Icons.event_rounded,
                          onTap: () => selectDate(false),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ─────────────────────────
                  // TRAVELLERS
                  // ─────────────────────────
                  const Text(
                    'Who is travelling?',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 13),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9F1EE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.people_alt_rounded,
                            color: Color(0xFF087E8B),
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Expanded(
                          child: Text(
                            'Travellers',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF12343B),
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: travellers > 1
                              ? () {
                                  setState(() {
                                    travellers--;
                                  });
                                }
                              : null,
                          icon: const Icon(
                            Icons.remove_circle_outline,
                          ),
                          color: const Color(0xFF087E8B),
                        ),

                        Text(
                          '$travellers',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12343B),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              travellers++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                          ),
                          color: const Color(0xFF087E8B),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ─────────────────────────
                  // SELECTED PLACE
                  // ─────────────────────────
                  const Text(
                    'Places in your trip',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 13),

                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9F1EE),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.place_rounded,
                            color: Color(0xFF087E8B),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Text(
                            widget.selectedPlace,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF12343B),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xFF087E8B),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ─────────────────────────
                  // ACTIVITIES
                  // ─────────────────────────
                  const Text(
                    'What do you want to experience?',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),

                  const SizedBox(height: 13),

                  ...activities.map(
                    (activity) {
                      final selected =
                          selectedActivities.contains(activity);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected) {
                              selectedActivities.remove(activity);
                            } else {
                              selectedActivities.add(activity);
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFFE7F5F3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selected
                                  ? const Color(0xFF087E8B)
                                  : const Color(0xFFE3EBEB),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected
                                    ? Icons.check_circle_rounded
                                    : Icons.circle_outlined,
                                color: const Color(0xFF087E8B),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  activity,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: selected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color:
                                        const Color(0xFF526568),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // ─────────────────────────────
            // CREATE TRIP BUTTON
            // ─────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(
                22,
                12,
                22,
                18,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: createTrip,
                  icon: const Icon(
                    Icons.auto_awesome_rounded,
                  ),
                  label: const Text(
                    'Create My Trip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF087E8B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
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

// ═════════════════════════════════════════════
// DATE CARD
// ═════════════════════════════════════════════

class _DateCard extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;
  final VoidCallback onTap;

  const _DateCard({
    required this.title,
    required this.date,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 21,
              color: const Color(0xFF087E8B),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF8A9A9D),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF526568),
              ),
            ),
          ],
        ),
      ),
    );
  }
}