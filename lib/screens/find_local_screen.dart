import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FindLocalScreen extends StatelessWidget {
  final String placeName;
  final String destination;

  const FindLocalScreen({
    super.key,
    required this.placeName,
    required this.destination,
  });

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);
  static const Color mutedText = Color(0xFF617376);

  // ================================================================
  // DEMO LOCALS
  // Used when the prototype is opened without Firebase login.
  // ================================================================

  List<Map<String, dynamic>> get demoLocals {
    return [
      {
        'uid': 'demo_priya',
        'name': 'Priya Sharma',
        'age': '24',
        'role': 'Verified Local Guide',
        'rating': '4.9',
        'bio':
            'Friendly local who loves showing travellers hidden beaches, cafés and authentic Goan experiences.',
        'languages': 'English • Hindi • Marathi',
        'interests': 'Food • Beaches • Culture',
        'availability': 'Available today',
        'response': 'Usually replies within 10 min',
        'place': 'North Goa',
        'verified': true,
      },
      {
        'uid': 'demo_rohan',
        'name': 'Rohan Naik',
        'age': '27',
        'role': 'Local Explorer',
        'rating': '4.8',
        'bio':
            'Love helping visitors discover local food, markets and places beyond the usual tourist spots.',
        'languages': 'English • Hindi • Konkani',
        'interests': 'Food • Markets • Nightlife',
        'availability': 'Available today',
        'response': 'Usually replies within 15 min',
        'place': 'Panaji',
        'verified': true,
      },
      {
        'uid': 'demo_ananya',
        'name': 'Ananya Desai',
        'age': '25',
        'role': 'Culture & Food Local',
        'rating': '4.7',
        'bio':
            'Passionate about Goan culture, traditional food and discovering quiet local spots.',
        'languages': 'English • Hindi • Konkani',
        'interests': 'Culture • Food • Photography',
        'availability': 'Available tomorrow',
        'response': 'Usually replies within 20 min',
        'place': 'Panaji',
        'verified': true,
      },
    ];
  }

  void showDemoLoginMessage(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Demo mode: local connection feature is ready to use.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

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
          'Find a Local',
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // ============================================================
          // INTRO CARD
          // ============================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 18),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE7F7F4),
                    Color(0xFFD8F1EE),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.people_alt_rounded,
                      color: Colors.white,
                      size: 31,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore $placeName like a local',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Connect with people from $destination and discover places beyond the tourist spots.',
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // AVAILABILITY HEADER
          // ============================================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                const Text(
                  'Available locals',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9F1EE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    currentUser == null
                        ? '${demoLocals.length} nearby'
                        : 'Live',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: teal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ============================================================
          // CONTENT
          // ============================================================

          Expanded(
            child: currentUser == null
                ? _DemoLocalsList(
                    locals: demoLocals,
                    placeName: placeName,
                    destination: destination,
                  )
                : _FirebaseLocalsList(
                    placeName: placeName,
                    destination: destination,
                    currentUser: currentUser,
                  ),
          ),
        ],
      ),
    );
  }
}

// ======================================================================
// DEMO LOCALS LIST
// ======================================================================

class _DemoLocalsList extends StatelessWidget {
  final List<Map<String, dynamic>> locals;
  final String placeName;
  final String destination;

  const _DemoLocalsList({
    required this.locals,
    required this.placeName,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 30),
      itemCount: locals.length,
      itemBuilder: (context, index) {
        return _LocalCard(
          data: locals[index],
          docId: locals[index]['uid'].toString(),
          placeName: placeName,
          destination: destination,
          travellerUid: '',
          demoMode: true,
        );
      },
    );
  }
}

// ======================================================================
// FIREBASE LOCALS LIST
// ======================================================================

class _FirebaseLocalsList extends StatelessWidget {
  final String placeName;
  final String destination;
  final User currentUser;

  const _FirebaseLocalsList({
    required this.placeName,
    required this.destination,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where(
            'role',
            whereIn: const ['Local', 'Both'],
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _FallbackLocalList(
            placeName: placeName,
            destination: destination,
          );
        }

        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF087E8B),
            ),
          );
        }

        final docs = snapshot.data?.docs ?? [];

        final locals = docs.where((doc) {
          final data =
              doc.data() as Map<String, dynamic>;

          final uid =
              (data['uid'] ?? doc.id).toString();

          return uid != currentUser.uid;
        }).toList();

        if (locals.isEmpty) {
          return _FallbackLocalList(
            placeName: placeName,
            destination: destination,
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(
            22,
            0,
            22,
            30,
          ),
          itemCount: locals.length,
          itemBuilder: (context, index) {
            final doc = locals[index];

            final data =
                doc.data() as Map<String, dynamic>;

            return _LocalCard(
              data: data,
              docId: doc.id,
              placeName: placeName,
              destination: destination,
              travellerUid: currentUser.uid,
              demoMode: false,
            );
          },
        );
      },
    );
  }
}

// ======================================================================
// FALLBACK
// ======================================================================

class _FallbackLocalList extends StatelessWidget {
  final String placeName;
  final String destination;

  const _FallbackLocalList({
    required this.placeName,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final locals = [
      {
        'uid': 'demo_priya',
        'name': 'Priya Sharma',
        'age': '24',
        'role': 'Verified Local Guide',
        'rating': '4.9',
        'bio':
            'Friendly local who loves showing travellers hidden beaches, cafés and authentic Goan experiences.',
        'languages': 'English • Hindi • Marathi',
        'interests': 'Food • Beaches • Culture',
        'availability': 'Available today',
        'response': 'Usually replies within 10 min',
        'place': 'North Goa',
        'verified': true,
      },
      {
        'uid': 'demo_rohan',
        'name': 'Rohan Naik',
        'age': '27',
        'role': 'Local Explorer',
        'rating': '4.8',
        'bio':
            'Love helping visitors discover local food, markets and places beyond the usual tourist spots.',
        'languages': 'English • Hindi • Konkani',
        'interests': 'Food • Markets • Nightlife',
        'availability': 'Available today',
        'response': 'Usually replies within 15 min',
        'place': 'Panaji',
        'verified': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        22,
        0,
        22,
        30,
      ),
      itemCount: locals.length,
      itemBuilder: (context, index) {
        return _LocalCard(
          data: locals[index],
          docId: locals[index]['uid'].toString(),
          placeName: placeName,
          destination: destination,
          travellerUid: '',
          demoMode: true,
        );
      },
    );
  }
}

// ======================================================================
// LOCAL CARD
// ======================================================================

class _LocalCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final String docId;
  final String placeName;
  final String destination;
  final String travellerUid;
  final bool demoMode;

  const _LocalCard({
    required this.data,
    required this.docId,
    required this.placeName,
    required this.destination,
    required this.travellerUid,
    required this.demoMode,
  });

  @override
  State<_LocalCard> createState() => _LocalCardState();
}

class _LocalCardState extends State<_LocalCard> {
  bool loading = false;

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color mutedText = Color(0xFF617376);

  String get localUid {
    return (widget.data['uid'] ?? widget.docId).toString();
  }

  String get name {
    return (widget.data['name'] ??
            widget.data['displayName'] ??
            'Local Guide')
        .toString();
  }

  String get role {
    return (widget.data['role'] ?? 'Local Guide')
        .toString();
  }

  String get bio {
    return (widget.data['bio'] ??
            'Ready to help you explore like a local.')
        .toString();
  }

  String get languages {
    return (widget.data['languages'] ??
            'English • Hindi')
        .toString();
  }

  String get rating {
    return (widget.data['rating'] ?? '4.8').toString();
  }

  String get age {
    return (widget.data['age'] ?? '').toString();
  }

  String get interests {
    return (widget.data['interests'] ??
            'Food • Culture • Local experiences')
        .toString();
  }

  String get availability {
    return (widget.data['availability'] ??
            'Available today')
        .toString();
  }

  String get response {
    return (widget.data['response'] ??
            'Usually replies quickly')
        .toString();
  }

  String get place {
    return (widget.data['place'] ??
            widget.destination)
        .toString();
  }

  bool get verified {
    return widget.data['verified'] == true ||
        role.toLowerCase().contains('verified');
  }

  // ================================================================
  // CONNECTION REQUEST
  // ================================================================

  Future<void> sendConnectionRequest() async {
    if (loading) return;

    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null || widget.demoMode) {
      _showMessage(
        'Connection request sent to $name!',
      );
      return;
    }

    if (authUser.uid == localUid) {
      _showMessage(
        'You cannot connect with yourself.',
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final firestore = FirebaseFirestore.instance;

      final travellerDoc = await firestore
          .collection('users')
          .doc(authUser.uid)
          .get();

      final travellerData =
          travellerDoc.data() ?? {};

      final travellerName =
          (travellerData['name'] ??
                  travellerData['displayName'] ??
                  authUser.displayName ??
                  'Traveller')
              .toString();

      final existing = await firestore
          .collection('connection_requests')
          .where(
            'travellerUid',
            isEqualTo: authUser.uid,
          )
          .where(
            'localUid',
            isEqualTo: localUid,
          )
          .where(
            'status',
            isEqualTo: 'pending',
          )
          .limit(1)
          .get();

      if (existing.docs.isNotEmpty) {
        if (mounted) {
          _showMessage(
            'You already sent a request to $name.',
          );
        }
        return;
      }

      await firestore
          .collection('connection_requests')
          .add({
        'travellerUid': authUser.uid,
        'travellerName': travellerName,
        'localUid': localUid,
        'localName': name,
        'placeName': widget.placeName,
        'destination': widget.destination,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      _showMessage(
        'Connection request sent to $name!',
      );
    } on FirebaseException catch (e) {
      if (!mounted) return;

      String message =
          'Could not send connection request. Please try again.';

      if (e.code == 'permission-denied') {
        message =
            'Permission denied. Please check your Firebase rules.';
      }

      _showMessage(message);
    } catch (e) {
      if (!mounted) return;

      _showMessage(
        'Could not send connection request. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  // ================================================================
  // MESSAGE
  // ================================================================

  void openMessage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            22,
            24,
            30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFD9F1EE),
                    child: Icon(
                      Icons.person_rounded,
                      color: teal,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Message $name',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F8F8),
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: const Text(
                  'Hi! I am visiting this place and would love some local recommendations.',
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);

                    _showMessage(
                      'Chat opened with $name',
                    );
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline_rounded,
                  ),
                  label: const Text(
                    'Start Conversation',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ================================================================
  // CALL
  // ================================================================

  void openCall() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.call_rounded,
                  color: teal,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Call Local',
                  style: TextStyle(
                    color: darkText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            'You can call $name directly once a connection is accepted.',
            style: const TextStyle(
              color: mutedText,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(color: teal),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                _showMessage(
                  'Calling $name... (prototype)',
                );
              },
              icon: const Icon(Icons.call_rounded),
              label: const Text('Call'),
              style: ElevatedButton.styleFrom(
                backgroundColor: teal,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
            ),
          ],
        );
      },
    );
  }

  // ================================================================
  // PROFILE DETAILS
  // ================================================================

  void openProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              24,
              22,
              24,
              30,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9E3E4),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Profile
                Row(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9F1EE),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 42,
                        color: teal,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.w800,
                                    color: darkText,
                                  ),
                                ),
                              ),
                              if (verified) ...[
                                const SizedBox(width: 7),
                                const Icon(
                                  Icons.verified_rounded,
                                  size: 19,
                                  color: teal,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            role,
                            style: const TextStyle(
                              color: teal,
                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // Rating
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB300),
                      size: 21,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.location_on_outlined,
                      color: mutedText,
                      size: 19,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      place,
                      style: const TextStyle(
                        color: mutedText,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  bio,
                  style: const TextStyle(
                    fontSize: 13,
                    color: mutedText,
                    height: 1.55,
                  ),
                ),

                const SizedBox(height: 20),

                _InfoRow(
                  icon: Icons.language_rounded,
                  title: 'Languages',
                  value: languages,
                ),

                const SizedBox(height: 12),

                _InfoRow(
                  icon: Icons.favorite_border_rounded,
                  title: 'Interests',
                  value: interests,
                ),

                const SizedBox(height: 12),

                _InfoRow(
                  icon: Icons.schedule_rounded,
                  title: 'Availability',
                  value: availability,
                ),

                const SizedBox(height: 12),

                _InfoRow(
                  icon: Icons.bolt_rounded,
                  title: 'Response time',
                  value: response,
                ),

                const SizedBox(height: 22),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: openMessage,
                        icon: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 18,
                        ),
                        label: const Text('Message'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: teal,
                          side: const BorderSide(
                            color: teal,
                          ),
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: openCall,
                        icon: const Icon(
                          Icons.call_outlined,
                          size: 18,
                        ),
                        label: const Text('Call'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: teal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ================================================================
  // CARD UI
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // ==========================================================
          // PROFILE HEADER
          // ==========================================================

          Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 36,
                  color: teal,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: darkText,
                            ),
                          ),
                        ),
                        if (age.isNotEmpty) ...[
                          const SizedBox(width: 5),
                          Text(
                            '• $age',
                            style: const TextStyle(
                              fontSize: 13,
                              color: mutedText,
                            ),
                          ),
                        ],
                        if (verified) ...[
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.verified_rounded,
                            size: 17,
                            color: teal,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: teal,
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
                          rating,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 6,
                          height: 6,
                          decoration:
                              const BoxDecoration(
                            color: Color(0xFF38A169),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          availability,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF38A169),
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

          // ==========================================================
          // BIO
          // ==========================================================

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              bio,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: mutedText,
                height: 1.45,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ==========================================================
          // INFO CHIPS
          // ==========================================================

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _SmallInfoChip(
                  icon: Icons.language_rounded,
                  text: languages,
                ),
                const SizedBox(width: 7),
                _SmallInfoChip(
                  icon: Icons.favorite_border_rounded,
                  text: interests,
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // ==========================================================
          // ACTIONS
          // ==========================================================

          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed:
                      loading ? null : sendConnectionRequest,
                  icon: loading
                      ? const SizedBox(
                          width: 17,
                          height: 17,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 17,
                        ),
                  label: Text(
                    loading
                        ? 'Sending...'
                        : 'Connect',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color(0xFF75B8BE),
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // MESSAGE
              _ActionIconButton(
                icon: Icons.chat_bubble_outline_rounded,
                tooltip: 'Message',
                onTap: openMessage,
              ),

              const SizedBox(width: 8),

              // CALL
              _ActionIconButton(
                icon: Icons.call_outlined,
                tooltip: 'Call',
                onTap: openCall,
              ),

              const SizedBox(width: 8),

              // PROFILE INFO
              _ActionIconButton(
                icon: Icons.info_outline_rounded,
                tooltip: 'View profile',
                onTap: openProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ======================================================================
// SMALL INFO CHIP
// ======================================================================

class _SmallInfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SmallInfoChip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: const Color(0xFF087E8B),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF617376),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================================
// ACTION ICON BUTTON
// ======================================================================

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _ActionIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFD9F1EE),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF087E8B),
            size: 20,
          ),
        ),
      ),
    );
  }
}

// ======================================================================
// INFO ROW
// ======================================================================

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFE7F5F3),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF087E8B),
            size: 19,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF718386),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF12343B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}