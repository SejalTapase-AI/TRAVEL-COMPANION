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

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Scaffold(
        backgroundColor: background,
        body: Center(
          child: Text(
            'Please login to find local guides.',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          'People from $destination who can help you discover more.',
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'role',
                    whereIn: const ['Local', 'Both'],
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return _ErrorContent(
                    onRetry: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FindLocalScreen(
                            placeName: placeName,
                            destination: destination,
                          ),
                        ),
                      );
                    },
                  );
                }

                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: LinearProgressIndicator(
                      color: teal,
                      backgroundColor: Color(0xFFD9F1EE),
                    ),
                  );
                }

                final docs = snapshot.data?.docs ?? [];

                final locals = docs.where((doc) {
                  final data =
                      doc.data() as Map<String, dynamic>;

                  final uid =
                      (data['uid'] ?? doc.id).toString();

                  // Do not show the currently logged-in user.
                  return uid != currentUser.uid;
                }).toList();

                return Row(
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
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${locals.length} nearby',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: teal,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 14),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'role',
                    whereIn: const ['Local', 'Both'],
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return _ErrorContent(
                    onRetry: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FindLocalScreen(
                            placeName: placeName,
                            destination: destination,
                          ),
                        ),
                      );
                    },
                  );
                }

                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: teal,
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
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 64,
                            color: Color(0xFF789095),
                          ),
                          SizedBox(height: 18),
                          Text(
                            'No local guides available',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: darkText,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Check again later for locals in your destination.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: mutedText,
                            ),
                          ),
                        ],
                      ),
                    ),
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
}

class _LocalCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final String docId;
  final String placeName;
  final String destination;
  final String travellerUid;

  const _LocalCard({
    required this.data,
    required this.docId,
    required this.placeName,
    required this.destination,
    required this.travellerUid,
  });

  @override
  State<_LocalCard> createState() => _LocalCardState();
}

class _LocalCardState extends State<_LocalCard> {
  bool loading = false;

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);

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
    return (widget.data['role'] ?? 'Local Guide').toString();
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

  Future<void> sendConnectionRequest() async {
    if (loading) return;

    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) {
      _showMessage('Please login first.');
      return;
    }

    if (authUser.uid == localUid) {
      _showMessage('You cannot connect with yourself.');
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final firestore = FirebaseFirestore.instance;

      // Get traveller profile.
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

      // Check whether a pending request already exists.
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

      // Create request.
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

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 34,
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
                              color: Color(0xFF718386),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              bio,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF617376),
              ),
            ),
          ),

          const SizedBox(height: 9),

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
                Expanded(
                  child: Text(
                    languages,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF718386),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton.icon(
              onPressed:
                  loading ? null : sendConnectionRequest,
              icon: loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 18,
                    ),
              label: Text(
                loading ? 'Sending...' : 'Connect',
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

class _ErrorContent extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorContent({
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_rounded,
                size: 58,
                color: Color(0xFF789095),
              ),
              const SizedBox(height: 22),
              const Text(
                'Unable to load local guides right now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF617376),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF718386),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF087E8B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}