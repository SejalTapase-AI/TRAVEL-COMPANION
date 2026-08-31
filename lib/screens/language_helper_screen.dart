import 'package:flutter/material.dart';

class LanguageHelperScreen extends StatefulWidget {
  final String destination;

  const LanguageHelperScreen({
    super.key,
    this.destination = 'Goa',
  });

  @override
  State<LanguageHelperScreen> createState() =>
      _LanguageHelperScreenState();
}

class _LanguageHelperScreenState
    extends State<LanguageHelperScreen> {
  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);

  late String selectedDestination;

  final List<String> destinations = [
    'Goa',
    'Kerala',
    'Jaipur',
    'Mumbai',
    'Manali',
  ];

  @override
  void initState() {
    super.initState();
    selectedDestination = destinations.contains(widget.destination)
        ? widget.destination
        : 'Goa';
  }

  List<Phrase> get phrases {
    switch (selectedDestination) {
      case 'Kerala':
        return const [
          Phrase(
            english: 'Hello',
            local: 'Namaskaram',
            pronunciation: 'Na-mas-ka-ram',
          ),
          Phrase(
            english: 'Thank you',
            local: 'Nanni',
            pronunciation: 'Nan-ni',
          ),
          Phrase(
            english: 'How much?',
            local: 'Ethra?',
            pronunciation: 'Eth-ra',
          ),
          Phrase(
            english: 'Where is the bathroom?',
            local: 'Bathroom evideya?',
            pronunciation: 'Bathroom e-vi-de-ya',
          ),
          Phrase(
            english: 'Please help me',
            local: 'Enne sahayikkamo?',
            pronunciation: 'En-ne sa-ha-yik-ka-mo',
          ),
          Phrase(
            english: 'I don’t understand',
            local: 'Enikku manassilayilla',
            pronunciation: 'En-ni-ku ma-na-si-la-yil-la',
          ),
        ];

      case 'Mumbai':
        return const [
          Phrase(
            english: 'Hello',
            local: 'Namaskar',
            pronunciation: 'Na-mas-kar',
          ),
          Phrase(
            english: 'Thank you',
            local: 'Dhanyavaad',
            pronunciation: 'Dhan-ya-vaad',
          ),
          Phrase(
            english: 'How much?',
            local: 'Kiti paise?',
            pronunciation: 'Ki-ti pai-se',
          ),
          Phrase(
            english: 'Where is this?',
            local: 'He kuthe aahe?',
            pronunciation: 'He ku-the aa-he',
          ),
          Phrase(
            english: 'Please help me',
            local: 'Kripaya madat kara',
            pronunciation: 'Kri-pa-ya ma-dat ka-ra',
          ),
          Phrase(
            english: 'I don’t understand',
            local: 'Mala samajla nahi',
            pronunciation: 'Ma-la sa-maj-la na-hi',
          ),
        ];

      case 'Jaipur':
        return const [
          Phrase(
            english: 'Hello',
            local: 'Namaste',
            pronunciation: 'Na-mas-te',
          ),
          Phrase(
            english: 'Thank you',
            local: 'Dhanyavaad',
            pronunciation: 'Dhan-ya-vaad',
          ),
          Phrase(
            english: 'How much?',
            local: 'Kitne ka hai?',
            pronunciation: 'Kit-ne ka hai',
          ),
          Phrase(
            english: 'Where is this?',
            local: 'Yeh kahan hai?',
            pronunciation: 'Yeh ka-han hai',
          ),
          Phrase(
            english: 'Please help me',
            local: 'Kripya meri madad kijiye',
            pronunciation: 'Kri-pa-ya me-ri ma-dad ki-ji-ye',
          ),
          Phrase(
            english: 'I don’t understand',
            local: 'Mujhe samajh nahi aaya',
            pronunciation: 'Mu-jhe sa-majh na-hi aa-ya',
          ),
        ];

      case 'Manali':
        return const [
          Phrase(
            english: 'Hello',
            local: 'Namaste',
            pronunciation: 'Na-mas-te',
          ),
          Phrase(
            english: 'Thank you',
            local: 'Dhanyavaad',
            pronunciation: 'Dhan-ya-vaad',
          ),
          Phrase(
            english: 'How much?',
            local: 'Kitne ka hai?',
            pronunciation: 'Kit-ne ka hai',
          ),
          Phrase(
            english: 'Where is this?',
            local: 'Yeh kahan hai?',
            pronunciation: 'Yeh ka-han hai',
          ),
          Phrase(
            english: 'Please help me',
            local: 'Kripya meri madad kijiye',
            pronunciation: 'Kri-pa-ya me-ri ma-dad ki-ji-ye',
          ),
          Phrase(
            english: 'I don’t understand',
            local: 'Mujhe samajh nahi aaya',
            pronunciation: 'Mu-jhe sa-majh na-hi aa-ya',
          ),
        ];

      case 'Goa':
      default:
        return const [
          Phrase(
            english: 'Hello',
            local: 'Namaskaar',
            pronunciation: 'Na-mas-kaar',
          ),
          Phrase(
            english: 'Thank you',
            local: 'Dev borem korum',
            pronunciation: 'Dev bo-rem ko-rum',
          ),
          Phrase(
            english: 'How much?',
            local: 'Kitlo?',
            pronunciation: 'Kit-lo',
          ),
          Phrase(
            english: 'Where is this?',
            local: 'He kitem asa?',
            pronunciation: 'He ki-tem a-sa',
          ),
          Phrase(
            english: 'Please help me',
            local: 'Mhaka modot kor',
            pronunciation: 'Mha-ka mo-dot kor',
          ),
          Phrase(
            english: 'I don’t understand',
            local: 'Mhaka somz-na',
            pronunciation: 'Mha-ka somz-na',
          ),
        ];
    }
  }

  String get languageName {
    switch (selectedDestination) {
      case 'Kerala':
        return 'Malayalam';
      case 'Goa':
        return 'Konkani';
      case 'Mumbai':
        return 'Marathi';
      case 'Jaipur':
      case 'Manali':
        return 'Hindi';
      default:
        return 'Local language';
    }
  }

  void showCopiedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Phrase copied for your trip ✨'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ============================================================
            // HEADER
            // ============================================================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: darkText,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Travel smarter',
                            style: TextStyle(
                              color: Color(0xFF718386),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Language Helper',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE8CC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.translate_rounded,
                        color: Color(0xFFE87935),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // INTRO CARD
            // ============================================================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF087E8B),
                        Color(0xFF075B65),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '🗣️',
                            style: TextStyle(fontSize: 29),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Speak a little. Connect a lot.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Learn useful phrases before you explore.',
                              style: TextStyle(
                                color: Color(0xFFD8F2F0),
                                fontSize: 11.5,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ============================================================
            // DESTINATION SELECTOR
            // ============================================================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 12),
                child: const Text(
                  'Choose your destination',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: destinations.map((destination) {
                    final selected =
                        destination == selectedDestination;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDestination = destination;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        margin: const EdgeInsets.only(right: 9),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected ? teal : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: selected
                                ? teal
                                : const Color(0xFFDCE6E7),
                          ),
                        ),
                        child: Text(
                          destination,
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : darkText,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // ============================================================
            // LANGUAGE INFO
            // ============================================================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.language_rounded,
                      color: teal,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$languageName phrases',
                      style: const TextStyle(
                        color: darkText,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF7F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Travel basics',
                        style: TextStyle(
                          color: teal,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // PHRASES
            // ============================================================
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final phrase = phrases[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: showCopiedMessage,
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: 0.045,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAF7F5),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(
                                  Icons.record_voice_over_rounded,
                                  color: teal,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 13),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      phrase.english,
                                      style: const TextStyle(
                                        color: Color(0xFF718386),
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      phrase.local,
                                      style: const TextStyle(
                                        color: darkText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Say: ${phrase.pronunciation}',
                                      style: const TextStyle(
                                        color: Color(0xFF8A9A9D),
                                        fontSize: 10.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF7FAFA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.volume_up_outlined,
                                  color: teal,
                                  size: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: phrases.length,
                ),
              ),
            ),

            // ============================================================
            // FUTURE FEATURE
            // ============================================================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF5E8),
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: const Color(0xFFFFE3C0),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        '✨',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Future version: AI translation, pronunciation practice and voice conversation.',
                          style: TextStyle(
                            color: darkText,
                            fontSize: 11.5,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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

class Phrase {
  final String english;
  final String local;
  final String pronunciation;

  const Phrase({
    required this.english,
    required this.local,
    required this.pronunciation,
  });
}