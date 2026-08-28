import 'package:flutter/material.dart';
import 'places_screen.dart';

class DestinationSearchScreen extends StatefulWidget {
  const DestinationSearchScreen({super.key});

  @override
  State<DestinationSearchScreen> createState() =>
      _DestinationSearchScreenState();
}

class _DestinationSearchScreenState
    extends State<DestinationSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> destinations = [
    {
      'name': 'Goa',
      'subtitle': 'Beaches • Food • Nightlife',
      'icon': '🏝️',
    },
    {
      'name': 'Jaipur',
      'subtitle': 'Culture • Forts • Heritage',
      'icon': '🏰',
    },
    {
      'name': 'Manali',
      'subtitle': 'Mountains • Adventure • Nature',
      'icon': '🏔️',
    },
    {
      'name': 'Mumbai',
      'subtitle': 'City • Food • Experiences',
      'icon': '🌆',
    },
    {
      'name': 'Kerala',
      'subtitle': 'Backwaters • Nature • Relaxation',
      'icon': '🌴',
    },
  ];

  List<Map<String, String>> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
    searchController.addListener(filterDestinations);
  }

  void filterDestinations() {
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredDestinations = destinations.where((destination) {
        return destination['name']!
            .toLowerCase()
            .contains(query);
      }).toList();
    });
  }

  void openDestination(String destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacesScreen(
          destination: destination,
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
          'Explore Destinations',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // ─────────────────────────────────
            // SEARCH BAR
            // ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Where do you want to go?',
                    hintStyle: const TextStyle(
                      color: Color(0xFF8A9A9D),
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF087E8B),
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),
              ),
            ),

            // ─────────────────────────────────
            // TITLE
            // ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  const Text(
                    'Popular destinations',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12343B),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${filteredDestinations.length} places',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF718386),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ─────────────────────────────────
            // DESTINATION LIST
            // ─────────────────────────────────
            Expanded(
              child: filteredDestinations.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 55,
                            color: Color(0xFF9AA9AB),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No destinations found',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF526568),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Try another destination',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF879598),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        22,
                        0,
                        22,
                        30,
                      ),
                      itemCount: filteredDestinations.length,
                      itemBuilder: (context, index) {
                        final destination =
                            filteredDestinations[index];

                        return GestureDetector(
                          onTap: () => openDestination(
                            destination['name']!,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(16),
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
                            child: Row(
                              children: [
                                // Destination icon
                                Container(
                                  width: 62,
                                  height: 62,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9F1EE),
                                    borderRadius:
                                        BorderRadius.circular(17),
                                  ),
                                  child: Text(
                                    destination['icon']!,
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 15),

                                // Text
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destination['name']!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold,
                                          color:
                                              Color(0xFF12343B),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        destination['subtitle']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color(0xFF718386),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Arrow
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xFFF1F7F7),
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons
                                        .arrow_forward_ios_rounded,
                                    size: 14,
                                    color: Color(0xFF087E8B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}