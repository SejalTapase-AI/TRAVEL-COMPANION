import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConnectionRequestsScreen extends StatelessWidget {
  const ConnectionRequestsScreen({super.key});

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);
  static const Color background = Color(0xFFF7FAFA);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Please login to view connection requests.',
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
          'Connection Requests',
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // We intentionally fetch the requests without a compound
      // Firestore query. This avoids index/query problems and
      // supports both localUid and toUid structures.
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('connection_requests')
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _ErrorState(
              error: snapshot.error.toString(),
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

          final allRequests = snapshot.data?.docs ?? [];

          // Only show requests belonging to the current local.
          final requests = allRequests.where((doc) {
            final data =
                doc.data() as Map<String, dynamic>;

            final localUid = data['localUid']?.toString();
            final toUid = data['toUid']?.toString();

            final status =
                data['status']?.toString().toLowerCase();

            final belongsToCurrentUser =
                localUid == currentUser.uid ||
                toUid == currentUser.uid;

            final isPending =
                status == null ||
                status == 'pending';

            return belongsToCurrentUser && isPending;
          }).toList();

          if (requests.isEmpty) {
            return const _EmptyState(
              icon: Icons.people_alt_outlined,
              title: 'No connection requests',
              subtitle:
                  'When travellers want to connect with you, their requests will appear here.',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final doc = requests[index];

              final data =
                  doc.data() as Map<String, dynamic>;

              return _RequestCard(
                requestId: doc.id,
                data: data,
              );
            },
          );
        },
      ),
    );
  }
}

// ═════════════════════════════════════════════
// REQUEST CARD
// ═════════════════════════════════════════════

class _RequestCard extends StatefulWidget {
  final String requestId;
  final Map<String, dynamic> data;

  const _RequestCard({
    required this.requestId,
    required this.data,
  });

  @override
  State<_RequestCard> createState() =>
      _RequestCardState();
}

class _RequestCardState extends State<_RequestCard> {
  bool loading = false;

  static const Color teal = Color(0xFF087E8B);
  static const Color darkText = Color(0xFF12343B);

  String get travellerName {
    return widget.data['travellerName']?.toString() ??
        widget.data['fromName']?.toString() ??
        widget.data['senderName']?.toString() ??
        'Traveller';
  }

  String get placeName {
    return widget.data['placeName']?.toString() ??
        widget.data['destination']?.toString() ??
        'your destination';
  }

  Future<void> updateRequest(String status) async {
    if (loading) return;

    setState(() {
      loading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('connection_requests')
          .doc(widget.requestId)
          .update({
        'status': status,
        'respondedAt':
            FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status == 'accepted'
                ? 'Connection request accepted!'
                : 'Connection request declined.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not update request: $e',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 32,
                  color: teal,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      travellerName,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'Wants to connect with you',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F8F7),
              borderRadius:
                  BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: teal,
                  size: 20,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    'Interested in $placeName',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: darkText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          if (loading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: teal,
                ),
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        updateRequest('declined'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          Colors.red.shade700,
                      side: BorderSide(
                        color: Colors.red.shade200,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(13),
                      ),
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                    ),
                    child: const Text(
                      'Decline',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        updateRequest('accepted'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: teal,
                      foregroundColor:
                          Colors.white,
                      elevation: 0,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(13),
                      ),
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════
// EMPTY STATE
// ═════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: const BoxDecoration(
                color: Color(0xFFD9F1EE),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 52,
                color: const Color(0xFF087E8B),
              ),
            ),

            const SizedBox(height: 28),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF617376),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════
// ERROR STATE
// ═════════════════════════════════════════════

class _ErrorState extends StatelessWidget {
  final String error;

  const _ErrorState({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 60,
              color: Color(0xFF087E8B),
            ),

            const SizedBox(height: 20),

            const Text(
              'Unable to load requests',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Please check your Firebase connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF617376),
              ),
            ),

            const SizedBox(height: 15),

            // Useful during development so we can see
            // the actual Firebase error.
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}