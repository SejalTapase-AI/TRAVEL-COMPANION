import 'package:flutter/material.dart';

void main() {
  runApp(const TravelCompanionApp());
}

class TravelCompanionApp extends StatelessWidget {
  const TravelCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Companion',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C4AB6),
        ),
      ),
      home: const LocalProfileScreen(),
    );
  }
}

// ============================================================
// 1. LOCAL PROFILE
// ============================================================

class LocalProfileScreen extends StatefulWidget {
  const LocalProfileScreen({super.key});

  @override
  State<LocalProfileScreen> createState() =>
      _LocalProfileScreenState();
}

class _LocalProfileScreenState extends State<LocalProfileScreen> {
  bool connected = false;

  void connectToPriya() {
    setState(() {
      connected = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Connected with Priya successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7FC),
        elevation: 0,

        title: const Text(
          'Local Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        // ====================================================
        // 9. NOTIFICATIONS
        // ====================================================

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // PROFILE IMAGE
            const CircleAvatar(
              radius: 65,
              backgroundColor: Color(0xFFE5DCF6),
              child: Icon(
                Icons.person,
                size: 75,
                color: Color(0xFF6C4AB6),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Priya Sharma',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Color(0xFF6C4AB6),
                  size: 18,
                ),
                SizedBox(width: 5),
                Text(
                  'Pune, Maharashtra',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 17,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Verified Local',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 19,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '4.9',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ABOUT
            infoCard(
              'About Priya',
              'I love showing travellers the hidden '
                  'side of Pune. I enjoy local food, '
                  'historical places, photography and '
                  'discovering places away from tourist crowds.',
            ),

            const SizedBox(height: 15),

            // LANGUAGES
            sectionCard(
              title: 'Languages',
              child: Wrap(
                spacing: 8,
                children: [
                  tag('English'),
                  tag('Hindi'),
                  tag('Marathi'),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // INTERESTS
            sectionCard(
              title: 'Interests',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  tag('🍜 Food'),
                  tag('🏛 History'),
                  tag('📸 Photography'),
                  tag('🥾 Trekking'),
                  tag('☕ Cafes'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =================================================
            // 2. TRAVELLER ↔ LOCAL CONNECTION
            // =================================================

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed:
                    connected
                        ? null
                        : connectToPriya,

                icon: Icon(
                  connected
                      ? Icons.check_circle
                      : Icons.person_add,
                ),

                label: Text(
                  connected
                      ? 'Connected'
                      : 'Connect with Priya',
                ),

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      connected
                          ? Colors.green
                          : const Color(
                              0xFF6C4AB6,
                            ),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      Colors.green,
                  disabledForegroundColor:
                      Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =================================================
            // 3. CHAT
            // =================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ChatScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.chat_bubble_outline,
                ),

                label: const Text(
                  'Chat with Priya',
                ),

                style:
                    OutlinedButton.styleFrom(
                  foregroundColor:
                      const Color(0xFF6C4AB6),
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  side: const BorderSide(
                    color: Color(0xFF6C4AB6),
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =================================================
            // 4. CALL
            // =================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CallScreen(),
                    ),
                  );
                },

                icon: const Icon(Icons.call),

                label: const Text(
                  'Call Priya',
                ),

                style:
                    OutlinedButton.styleFrom(
                  foregroundColor:
                      Colors.green.shade700,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  side: BorderSide(
                    color: Colors.green.shade600,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =================================================
            // 5. EXPENSE TRACKER
            // =================================================

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ExpenseTrackerScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.account_balance_wallet,
                ),

                label: const Text(
                  'Expense Tracker',
                ),

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF211A2D),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =================================================
            // 7. RATING
            // =================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const RatingFeedbackScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.star_outline,
                ),

                label: const Text(
                  'Rate & Give Feedback',
                ),

                style:
                    OutlinedButton.styleFrom(
                  foregroundColor:
                      const Color(0xFF6C4AB6),
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  side: const BorderSide(
                    color: Color(0xFF6C4AB6),
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =================================================
            // 8. GAMIFICATION
            // =================================================

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GamificationScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.emoji_events,
                ),

                label: const Text(
                  'Community & Rewards',
                ),

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF8B5CF6),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget infoCard(
    String title,
    String text,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            text,
            style: const TextStyle(
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          child,
        ],
      ),
    );
  }

  Widget tag(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF0EBF8),
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Text(text),
    );
  }
}

// ============================================================
// 3. CHAT SCREEN
// ============================================================

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() =>
      _ChatScreenState();
}

class _ChatScreenState
    extends State<ChatScreen> {
  final TextEditingController controller =
      TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hi! Welcome to Pune 😊',
      'isMe': false,
    },
    {
      'text':
          'I can help you discover amazing local places.',
      'isMe': false,
    },
    {
      'text':
          'That sounds great! I would love to explore Pune.',
      'isMe': true,
    },
  ];

  void sendMessage() {
    final text =
        controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'text': text,
        'isMe': true,
      });
    });

    controller.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  Color(0xFFE5DCF6),
              child: Icon(
                Icons.person,
                color:
                    Color(0xFF6C4AB6),
              ),
            ),

            SizedBox(width: 10),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  'Priya Sharma',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const CallScreen(),
                ),
              );
            },
            icon: const Icon(Icons.call),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.all(18),

              itemCount:
                  messages.length,

              itemBuilder:
                  (context, index) {
                final message =
                    messages[index];

                final isMe =
                    message['isMe']
                        as bool;

                return Align(
                  alignment:
                      isMe
                          ? Alignment
                              .centerRight
                          : Alignment
                              .centerLeft,

                  child: Container(
                    constraints:
                        const BoxConstraints(
                      maxWidth: 300,
                    ),

                    margin:
                        const EdgeInsets.only(
                      bottom: 12,
                    ),

                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),

                    decoration:
                        BoxDecoration(
                      color:
                          isMe
                              ? const Color(
                                  0xFF6C4AB6,
                                )
                              : Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Text(
                      message['text']
                          as String,

                      style: TextStyle(
                        color:
                            isMe
                                ? Colors.white
                                : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            color: Colors.white,

            padding:
                const EdgeInsets.all(12),

            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        controller,

                    onSubmitted:
                        (_) =>
                            sendMessage(),

                    decoration:
                        InputDecoration(
                      hintText:
                          'Type a message...',

                      filled: true,

                      fillColor:
                          const Color(
                        0xFFF2F0F7,
                      ),

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                          25,
                        ),
                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                CircleAvatar(
                  backgroundColor:
                      const Color(
                    0xFF6C4AB6,
                  ),

                  child: IconButton(
                    onPressed:
                        sendMessage,

                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
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
// 4. CALL SCREEN
// ============================================================

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() =>
      _CallScreenState();
}

class _CallScreenState
    extends State<CallScreen> {
  bool muted = false;
  bool speaker = false;
  bool connected = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          setState(() {
            connected = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF211A2D),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 45),

            Text(
              connected
                  ? 'Connected'
                  : 'Calling...',

              style: TextStyle(
                color:
                    connected
                        ? Colors.greenAccent
                        : Colors.white70,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 45),

            const CircleAvatar(
              radius: 80,
              backgroundColor:
                  Color(0xFFE5DCF6),

              child: Icon(
                Icons.person,
                size: 90,
                color:
                    Color(0xFF6C4AB6),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Priya Sharma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              connected
                  ? '00:03'
                  : 'Pune, India',

              style: const TextStyle(
                color: Colors.white60,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [
                callButton(
                  muted
                      ? Icons.mic_off
                      : Icons.mic,

                  muted
                      ? 'Unmute'
                      : 'Mute',

                  () {
                    setState(() {
                      muted = !muted;
                    });
                  },
                ),

                const SizedBox(width: 35),

                callButton(
                  speaker
                      ? Icons.volume_up
                      : Icons.volume_down,

                  'Speaker',

                  () {
                    setState(() {
                      speaker = !speaker;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),

            GestureDetector(
              onTap:
                  () =>
                      Navigator.pop(context),

              child: const CircleAvatar(
                radius: 35,
                backgroundColor:
                    Colors.red,

                child: Icon(
                  Icons.call_end,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'End call',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget callButton(
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,

          child: CircleAvatar(
            radius: 30,
            backgroundColor:
                Colors.white12,

            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 7),

        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// 5. EXPENSE TRACKER
// ============================================================

class ExpenseTrackerScreen
    extends StatefulWidget {
  const ExpenseTrackerScreen({
    super.key,
  });

  @override
  State<ExpenseTrackerScreen> createState() =>
      _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState
    extends State<ExpenseTrackerScreen> {
  final List<Map<String, dynamic>>
      expenses = [
    {
      'title': 'Dinner',
      'category': 'Food',
      'amount': 850.0,
      'icon': Icons.restaurant,
    },
    {
      'title': 'Auto Rickshaw',
      'category': 'Transport',
      'amount': 250.0,
      'icon': Icons.directions_car,
    },
    {
      'title': 'Museum Tickets',
      'category': 'Activities',
      'amount': 400.0,
      'icon': Icons.museum,
    },
  ];

  final titleController =
      TextEditingController();

  final amountController =
      TextEditingController();

  String category = 'Food';

  double get total {
    double value = 0;

    for (final expense in expenses) {
      value +=
          expense['amount'] as double;
    }

    return value;
  }

  IconData getIcon(String value) {
    switch (value) {
      case 'Food':
        return Icons.restaurant;

      case 'Transport':
        return Icons.directions_car;

      case 'Stay':
        return Icons.hotel;

      case 'Activities':
        return Icons.local_activity;

      default:
        return Icons.receipt;
    }
  }

  void addExpense() {
    final title =
        titleController.text.trim();

    final amount =
        double.tryParse(
      amountController.text.trim(),
    );

    if (title.isEmpty ||
        amount == null ||
        amount <= 0) {
      return;
    }

    setState(() {
      expenses.add({
        'title': title,
        'category': category,
        'amount': amount,
        'icon': getIcon(category),
      });
    });

    titleController.clear();
    amountController.clear();

    Navigator.pop(context);
  }

  void showAddExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      builder: (context) {
        return StatefulBuilder(
          builder:
              (
                context,
                setModalState,
              ) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25,

                bottom:
                    MediaQuery.of(context)
                            .viewInsets
                            .bottom +
                        25,
              ),

              child: Column(
                mainAxisSize:
                    MainAxisSize.min,

                children: [
                  const Text(
                    'Add Expense',

                    style: TextStyle(
                      fontSize: 23,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller:
                        titleController,

                    decoration:
                        const InputDecoration(
                      labelText:
                          'Expense name',
                      prefixIcon:
                          Icon(
                        Icons.receipt,
                      ),
                      border:
                          OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller:
                        amountController,

                    keyboardType:
                        TextInputType.number,

                    decoration:
                        const InputDecoration(
                      labelText:
                          'Amount',
                      prefixText: '₹ ',
                      prefixIcon:
                          Icon(
                        Icons
                            .currency_rupee,
                      ),
                      border:
                          OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  DropdownButtonFormField<
                      String>(
                    initialValue:
                        category,

                    decoration:
                        const InputDecoration(
                      labelText:
                          'Category',
                      border:
                          OutlineInputBorder(),
                    ),

                    items: [
                      'Food',
                      'Transport',
                      'Stay',
                      'Activities',
                      'Other',
                    ].map(
                      (item) {
                        return DropdownMenuItem(
                          value: item,
                          child:
                              Text(item),
                        );
                      },
                    ).toList(),

                    onChanged:
                        (value) {
                      if (value !=
                          null) {
                        setModalState(
                          () {
                            category =
                                value;
                          },
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width:
                        double.infinity,

                    child:
                        ElevatedButton(
                      onPressed:
                          addExpense,

                      child:
                          const Text(
                        'Add Expense',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
      ),

      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.all(20),

            width:
                double.infinity,

            padding:
                const EdgeInsets.all(25),

            decoration:
                BoxDecoration(
              color:
                  const Color(0xFF6C4AB6),

              borderRadius:
                  BorderRadius.circular(
                22,
              ),
            ),

            child: Column(
              children: [
                const Text(
                  'Total Trip Expenses',
                  style: TextStyle(
                    color:
                        Colors.white70,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '₹${total.toStringAsFixed(0)}',

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child:
                ListView.builder(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              itemCount:
                  expenses.length,

              itemBuilder:
                  (context, index) {
                final expense =
                    expenses[index];

                return Card(
                  child: ListTile(
                    leading:
                        CircleAvatar(
                      backgroundColor:
                          const Color(
                        0xFFEDE6F8,
                      ),

                      child: Icon(
                        expense['icon']
                            as IconData,

                        color:
                            const Color(
                          0xFF6C4AB6,
                        ),
                      ),
                    ),

                    title: Text(
                      expense['title']
                          as String,

                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    subtitle: Text(
                      expense['category']
                          as String,
                    ),

                    trailing: Text(
                      '₹${(expense['amount'] as double).toStringAsFixed(0)}',

                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton:
          Column(
        mainAxisAlignment:
            MainAxisAlignment.end,

        children: [
          FloatingActionButton
              .extended(
            heroTag: 'split',

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ExpenseSplitterScreen(),
                ),
              );
            },

            backgroundColor:
                const Color(0xFF211A2D),

            foregroundColor:
                Colors.white,

            icon:
                const Icon(
              Icons.call_split,
            ),

            label:
                const Text(
              'Split Expense',
            ),
          ),

          const SizedBox(height: 12),

          FloatingActionButton
              .extended(
            heroTag: 'add',

            onPressed:
                showAddExpense,

            backgroundColor:
                const Color(0xFF6C4AB6),

            foregroundColor:
                Colors.white,

            icon:
                const Icon(
              Icons.add,
            ),

            label:
                const Text(
              'Add Expense',
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 6. EXPENSE SPLITTER
// ============================================================

class ExpenseSplitterScreen
    extends StatefulWidget {
  const ExpenseSplitterScreen({
    super.key,
  });

  @override
  State<ExpenseSplitterScreen> createState() =>
      _ExpenseSplitterScreenState();
}

class _ExpenseSplitterScreenState
    extends State<ExpenseSplitterScreen> {
  final totalController =
      TextEditingController(
    text: '1500',
  );

  final peopleController =
      TextEditingController(
    text: '3',
  );

  double total = 1500;
  int people = 3;

  double get share =>
      people > 0
          ? total / people
          : 0;

  void calculate() {
    final newTotal =
        double.tryParse(
      totalController.text,
    );

    final newPeople =
        int.tryParse(
      peopleController.text,
    );

    if (newTotal == null ||
        newTotal <= 0 ||
        newPeople == null ||
        newPeople <= 0) {
      return;
    }

    setState(() {
      total = newTotal;
      people = newPeople;
    });
  }

  @override
  void dispose() {
    totalController.dispose();
    peopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        title: const Text(
          'Expense Splitter',
        ),
      ),

      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              width:
                  double.infinity,

              padding:
                  const EdgeInsets.all(25),

              decoration:
                  BoxDecoration(
                color:
                    const Color(
                  0xFF6C4AB6,
                ),

                borderRadius:
                    BorderRadius.circular(
                  22,
                ),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.groups,
                    color: Colors.white,
                    size: 45,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Split Trip Expenses',

                    style:
                        TextStyle(
                      color:
                          Colors.white,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller:
                  totalController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(
                labelText:
                    'Total Expense',

                prefixText: '₹ ',

                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  peopleController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(
                labelText:
                    'Number of Travellers',

                prefixIcon:
                    Icon(
                  Icons.people,
                ),

                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width:
                  double.infinity,

              child:
                  ElevatedButton(
                onPressed:
                    calculate,

                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      const Color(
                    0xFF6C4AB6,
                  ),

                  foregroundColor:
                      Colors.white,

                  padding:
                      const EdgeInsets
                          .all(17),
                ),

                child:
                    const Text(
                  'Calculate Split',
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width:
                  double.infinity,

              padding:
                  const EdgeInsets.all(25),

              decoration:
                  BoxDecoration(
                color:
                    Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),

              child: Column(
                children: [
                  const Text(
                    'Each traveller pays',

                    style:
                        TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '₹${share.toStringAsFixed(2)}',

                    style:
                        const TextStyle(
                      color:
                          Color(
                        0xFF6C4AB6,
                      ),

                      fontSize: 36,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ...List.generate(
              people,
              (index) =>
                  Card(
                child:
                    ListTile(
                  leading:
                      CircleAvatar(
                    child:
                        Text(
                      '${index + 1}',
                    ),
                  ),

                  title:
                      Text(
                    index == 0
                        ? 'You'
                        : 'Traveller ${index + 1}',
                  ),

                  trailing:
                      Text(
                    '₹${share.toStringAsFixed(2)}',

                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight
                              .bold,
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

// ============================================================
// 7. RATING & FEEDBACK
// ============================================================

class RatingFeedbackScreen
    extends StatefulWidget {
  const RatingFeedbackScreen({
    super.key,
  });

  @override
  State<RatingFeedbackScreen> createState() =>
      _RatingFeedbackScreenState();
}

class _RatingFeedbackScreenState
    extends State<RatingFeedbackScreen> {
  int rating = 0;

  final feedbackController =
      TextEditingController();

  final Set<String> selectedTags =
      {};

  final List<String> tags = [
    'Friendly',
    'Helpful',
    'Knowledgeable',
    'Good communication',
    'Great local tips',
  ];

  void submitFeedback() {
    if (rating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a rating.',
          ),
        ),
      );

      return;
    }

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Thank You! ⭐',
          ),

          content: const Text(
            'Your feedback helps us build '
            'a trusted travel community.',
          ),

          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },

              child:
                  const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        title: const Text(
          'Rate Your Experience',
        ),
      ),

      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,

              backgroundColor:
                  Color(0xFFE5DCF6),

              child: Icon(
                Icons.person,
                size: 55,
                color:
                    Color(0xFF6C4AB6),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'How was your experience with Priya?',

              textAlign:
                  TextAlign.center,

              style:
                  TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children:
                  List.generate(
                5,
                (index) {
                  final number =
                      index + 1;

                  return IconButton(
                    onPressed: () {
                      setState(() {
                        rating =
                            number;
                      });
                    },

                    icon: Icon(
                      number <= rating
                          ? Icons.star
                          : Icons.star_border,

                      color:
                          Colors.amber,

                      size: 42,
                    ),
                  );
                },
              ),
            ),

            Text(
              rating == 0
                  ? 'Select your rating'
                  : '$rating / 5',

              style:
                  const TextStyle(
                color:
                    Color(0xFF6C4AB6),

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment:
                  Alignment.centerLeft,

              child: Text(
                'What did you like?',

                style:
                    TextStyle(
                  fontSize: 17,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,

              children:
                  tags.map(
                (tag) {
                  final selected =
                      selectedTags
                          .contains(
                    tag,
                  );

                  return FilterChip(
                    label:
                        Text(tag),

                    selected:
                        selected,

                    selectedColor:
                        const Color(
                      0xFFE5DCF6,
                    ),

                    onSelected:
                        (value) {
                      setState(() {
                        if (value) {
                          selectedTags
                              .add(
                            tag,
                          );
                        } else {
                          selectedTags
                              .remove(
                            tag,
                          );
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 25),

            TextField(
              controller:
                  feedbackController,

              maxLines: 5,

              decoration:
                  InputDecoration(
                hintText:
                    'Write your feedback...',

                filled: true,

                fillColor:
                    Colors.white,

                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    16,
                  ),

                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width:
                  double.infinity,

              child:
                  ElevatedButton.icon(
                onPressed:
                    submitFeedback,

                icon:
                    const Icon(
                  Icons.send,
                ),

                label:
                    const Text(
                  'Submit Feedback',
                ),

                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      const Color(
                    0xFF6C4AB6,
                  ),

                  foregroundColor:
                      Colors.white,

                  padding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 17,
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

// ============================================================
// 8. GAMIFICATION
// ============================================================

class GamificationScreen
    extends StatelessWidget {
  const GamificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        title: const Text(
          'Community & Rewards',

          style:
              TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body:
          SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // POINTS
            Container(
              width:
                  double.infinity,

              padding:
                  const EdgeInsets.all(25),

              decoration:
                  BoxDecoration(
                color:
                    const Color(
                  0xFF6C4AB6,
                ),

                borderRadius:
                    BorderRadius.circular(
                  22,
                ),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.emoji_events,
                    color:
                        Colors.amber,
                    size: 55,
                  ),

                  SizedBox(height: 10),

                  Text(
                    '1,250 Points',

                    style:
                        TextStyle(
                      color:
                          Colors.white,
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Travel Explorer Level 5',

                    style:
                        TextStyle(
                      color:
                          Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // PROGRESS
            const Text(
              'Your Progress',

              style:
                  TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding:
                  const EdgeInsets.all(18),

              decoration:
                  BoxDecoration(
                color:
                    Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [
                      Text('Level 5'),

                      Text(
                        '1,250 / 1,500 XP',

                        style:
                            TextStyle(
                          color:
                              Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  const LinearProgressIndicator(
                    value: 0.83,
                    minHeight: 9,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    '250 more points to reach Level 6!',

                    style:
                        TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // BADGES
            const Text(
              'Your Badges',

              style:
                  TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 1.25,

              children: const [
                BadgeCard(
                  icon:
                      Icons.explore,

                  title:
                      'Explorer',

                  subtitle:
                      'Visited 10 places',
                ),

                BadgeCard(
                  icon:
                      Icons.people,

                  title:
                      'Connector',

                  subtitle:
                      'Met 5 locals',
                ),

                BadgeCard(
                  icon:
                      Icons.chat,

                  title:
                      'Social Traveller',

                  subtitle:
                      '50 chats',
                ),

                BadgeCard(
                  icon:
                      Icons.star,

                  title:
                      'Top Reviewer',

                  subtitle:
                      '10 reviews',
                ),
              ],
            ),

            const SizedBox(height: 25),

            // LEADERBOARD
            const Text(
              'Leaderboard',

              style:
                  TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              decoration:
                  BoxDecoration(
                color:
                    Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: Column(
                children: [
                  leaderboardRow(
                    '🥇',
                    'Aarav',
                    '2,850',
                  ),

                  leaderboardRow(
                    '🥈',
                    'Priya',
                    '2,450',
                  ),

                  leaderboardRow(
                    '🥉',
                    'You',
                    '1,250',
                  ),

                  leaderboardRow(
                    '4',
                    'Rahul',
                    '1,100',
                  ),

                  leaderboardRow(
                    '5',
                    'Ananya',
                    '980',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // EARN POINTS
            const Text(
              'Earn More Points',

              style:
                  TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            actionCard(
              Icons.star,
              'Rate a Local',
              '+50 points',
            ),

            actionCard(
              Icons.chat,
              'Connect with a Traveller',
              '+30 points',
            ),

            actionCard(
              Icons.place,
              'Discover a New Place',
              '+20 points',
            ),

            actionCard(
              Icons.rate_review,
              'Write a Helpful Review',
              '+40 points',
            ),
          ],
        ),
      ),
    );
  }

  Widget leaderboardRow(
    String position,
    String name,
    String points,
  ) {
    return ListTile(
      leading:
          Text(
        position,
        style:
            const TextStyle(
          fontSize: 20,
        ),
      ),

      title:
          Text(
        name,
        style:
            const TextStyle(
          fontWeight:
              FontWeight.bold,
        ),
      ),

      trailing:
          Text(
        '$points pts',

        style:
            const TextStyle(
          color:
              Color(0xFF6C4AB6),
          fontWeight:
              FontWeight.bold,
        ),
      ),
    );
  }

  Widget actionCard(
    IconData icon,
    String title,
    String points,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),

      decoration:
          BoxDecoration(
        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          15,
        ),
      ),

      child: ListTile(
        leading:
            CircleAvatar(
          backgroundColor:
              const Color(
            0xFFEDE6F8,
          ),

          child:
              Icon(
            icon,
            color:
                const Color(
              0xFF6C4AB6,
            ),
          ),
        ),

        title:
            Text(
          title,

          style:
              const TextStyle(
            fontWeight:
                FontWeight.w600,
          ),
        ),

        trailing:
            Text(
          points,

          style:
              const TextStyle(
            color:
                Colors.green,

            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// BADGE CARD
// ============================================================

class BadgeCard
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const BadgeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(15),

      decoration:
          BoxDecoration(
        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          18,
        ),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 27,

            backgroundColor:
                const Color(
              0xFFEDE6F8,
            ),

            child:
                Icon(
              icon,

              color:
                  const Color(
                0xFF6C4AB6,
              ),

              size: 28,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,

            style:
                const TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            subtitle,

            textAlign:
                TextAlign.center,

            style:
                const TextStyle(
              fontSize: 11,
              color:
                  Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 9. NOTIFICATIONS / ACTIVITY
// ============================================================

class NotificationsScreen
    extends StatefulWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends State<NotificationsScreen> {
  final List<Map<String, dynamic>>
      notifications = [
    {
      'title':
          'New connection',

      'message':
          'Priya Sharma accepted your connection.',

      'time':
          '2 min ago',

      'icon':
          Icons.person_add,

      'read':
          false,
    },

    {
      'title':
          'New message',

      'message':
          'Priya sent you a message.',

      'time':
          '10 min ago',

      'icon':
          Icons.chat_bubble,

      'read':
          false,
    },

    {
      'title':
          'Expense added',

      'message':
          '₹850 dinner expense was added to your trip.',

      'time':
          '1 hour ago',

      'icon':
          Icons.account_balance_wallet,

      'read':
          true,
    },

    {
      'title':
          'New rating',

      'message':
          'Your local experience received a 5-star rating.',

      'time':
          '3 hours ago',

      'icon':
          Icons.star,

      'read':
          true,
    },

    {
      'title':
          'Badge unlocked!',

      'message':
          'You earned the Explorer badge.',

      'time':
          'Yesterday',

      'icon':
          Icons.emoji_events,

      'read':
          true,
    },

    {
      'title':
          'Points earned',

      'message':
          'You earned +50 points for rating a local.',

      'time':
          'Yesterday',

      'icon':
          Icons.stars,

      'read':
          true,
    },
  ];

  int get unreadCount {
    return notifications
        .where(
          (notification) =>
              notification['read'] ==
              false,
        )
        .length;
  }

  void markAllAsRead() {
    setState(() {
      for (final notification
          in notifications) {
        notification['read'] = true;
      }
    });
  }

  void openNotification(
    int index,
  ) {
    setState(() {
      notifications[index]['read'] =
          true;
    });

    final notification =
        notifications[index];

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text(
          notification['message']
              as String,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F7FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF8F7FC),

        elevation: 0,

        title: Row(
          children: [
            const Text(
              'Notifications',

              style:
                  TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(width: 8),

            if (unreadCount > 0)
              Container(
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),

                decoration:
                    BoxDecoration(
                  color:
                      const Color(
                    0xFF6C4AB6,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child:
                    Text(
                  '$unreadCount new',

                  style:
                      const TextStyle(
                    color:
                        Colors.white,

                    fontSize: 11,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),

        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed:
                  markAllAsRead,

              child:
                  const Text(
                'Read all',
              ),
            ),
        ],
      ),

      body:
          ListView.builder(
        padding:
            const EdgeInsets.all(15),

        itemCount:
            notifications.length,

        itemBuilder:
            (context, index) {
          final notification =
              notifications[index];

          final bool isUnread =
              notification['read'] ==
                  false;

          return GestureDetector(
            onTap:
                () =>
                    openNotification(
              index,
            ),

            child: Container(
              margin:
                  const EdgeInsets.only(
                bottom: 10,
              ),

              padding:
                  const EdgeInsets.all(
                15,
              ),

              decoration:
                  BoxDecoration(
                color:
                    isUnread
                        ? const Color(
                            0xFFEDE6F8,
                          )
                        : Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),

                border:
                    isUnread
                        ? Border.all(
                            color:
                                const Color(
                              0xFFD8C8EF,
                            ),
                          )
                        : null,
              ),

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  CircleAvatar(
                    radius: 25,

                    backgroundColor:
                        const Color(
                      0xFFE5DCF6,
                    ),

                    child:
                        Icon(
                      notification[
                              'icon']
                          as IconData,

                      color:
                          const Color(
                        0xFF6C4AB6,
                      ),
                    ),
                  ),

                  const SizedBox(width: 13),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [
                        Row(
                          children: [
                            Expanded(
                              child:
                                  Text(
                                notification[
                                        'title']
                                    as String,

                                style:
                                    TextStyle(
                                  fontWeight:
                                      isUnread
                                          ? FontWeight.bold
                                          : FontWeight.w600,

                                  fontSize:
                                      15,
                                ),
                              ),
                            ),

                            if (isUnread)
                              Container(
                                width: 9,
                                height: 9,

                                decoration:
                                    const BoxDecoration(
                                  color:
                                      Color(
                                    0xFF6C4AB6,
                                  ),

                                  shape:
                                      BoxShape.circle,
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Text(
                          notification[
                                  'message']
                              as String,

                          style:
                              const TextStyle(
                            color:
                                Colors.black54,

                            height: 1.3,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          notification[
                                  'time']
                              as String,

                          style:
                              const TextStyle(
                            color:
                                Colors.grey,

                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}