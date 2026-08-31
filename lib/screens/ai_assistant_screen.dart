import 'package:flutter/material.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);

  final TextEditingController controller = TextEditingController();

  final List<_ChatMessage> messages = [
    const _ChatMessage(
      text:
          'Hi! I’m your AI travel assistant ✨\n\nAsk me about places, food, itineraries, local experiences or travel safety.',
      isUser: false,
    ),
  ];

  final List<String> suggestions = [
    'Plan a day in Goa',
    'What food should I try?',
    'Best places near me',
    'Is Goa safe for tourists?',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendMessage([String? suggestedQuestion]) {
    final text = suggestedQuestion ?? controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add(
        _ChatMessage(
          text: text,
          isUser: true,
        ),
      );

      messages.add(
        _ChatMessage(
          text: _generateDemoResponse(text),
          isUser: false,
        ),
      );

      controller.clear();
    });
  }

  String _generateDemoResponse(String question) {
    final q = question.toLowerCase();

    if (q.contains('food') || q.contains('eat')) {
      return 'For Goa, try a local fish thali, Goan xacuti, poi bread and bebinca. 🍛\n\nFor a local experience, I can also help you discover smaller neighbourhood food spots.';
    }

    if (q.contains('safe') || q.contains('safety')) {
      return 'Goa is a popular tourist destination. Stay aware in crowded areas, keep emergency contacts ready and use the Safety Center in Travel Companion for quick help. 🛡️';
    }

    if (q.contains('near') || q.contains('place')) {
      return 'You could explore Fort Aguada, Baga Beach, Fontainhas and nearby local experiences. 📍\n\nYour final recommendations can be personalized using your interests, budget and available time.';
    }

    if (q.contains('plan') || q.contains('day')) {
      return 'Here is a sample Goa day plan:\n\n🌅 Morning — Fort Aguada\n🍛 Lunch — Local Goan food\n🏖️ Afternoon — Baga Beach\n🤝 Evening — Meet a local\n🌇 Sunset — Explore the coast\n\nI can eventually personalize this around your budget and interests.';
    }

    return 'That’s a great travel question! ✨\n\nIn the full version, I’ll use your destination, interests, budget and itinerary to provide a personalized recommendation.';
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
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Travel Assistant',
              style: TextStyle(
                color: darkText,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Your personal travel companion',
              style: TextStyle(
                color: Color(0xFF718386),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // ==============================================================
          // AI HEADER
          // ==============================================================
          Container(
            margin: const EdgeInsets.fromLTRB(18, 8, 18, 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF12343B),
                  Color(0xFF087E8B),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
                const SizedBox(width: 13),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ask me anything ✨',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Places • Food • Plans • Safety',
                        style: TextStyle(
                          color: Color(0xFFD8F2F0),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ==============================================================
          // SUGGESTIONS
          // ==============================================================
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: suggestions.map((question) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => sendMessage(question),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFDCE6E7),
                        ),
                      ),
                      child: Text(
                        question,
                        style: const TextStyle(
                          color: darkText,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          // ==============================================================
          // CHAT
          // ==============================================================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 320,
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: message.isUser
                          ? teal
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(18),
                        topRight: const Radius.circular(18),
                        bottomLeft: Radius.circular(
                          message.isUser ? 18 : 5,
                        ),
                        bottomRight: Radius.circular(
                          message.isUser ? 5 : 18,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isUser
                            ? Colors.white
                            : darkText,
                        fontSize: 13,
                        height: 1.45,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ==============================================================
          // INPUT
          // ==============================================================
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 12),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => sendMessage(),
                        decoration: const InputDecoration(
                          hintText: 'Ask your travel assistant...',
                          hintStyle: TextStyle(
                            color: Color(0xFF9AA8AA),
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: sendMessage,
                      child: Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                          color: teal,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.white,
                          size: 21,
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
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  const _ChatMessage({
    required this.text,
    required this.isUser,
  });
}