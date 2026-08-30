import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LocalRequestsScreen extends StatefulWidget {
  const LocalRequestsScreen({super.key});

  @override
  State<LocalRequestsScreen> createState() =>
      _LocalRequestsScreenState();
}

class _LocalRequestsScreenState
    extends State<LocalRequestsScreen> {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _updating = false;

  // ============================================================
  // ACCEPT REQUEST
  // ============================================================

  Future<void> _acceptRequest(
    String requestId,
    String travellerName,
  ) async {
    try {
      setState(() {
        _updating = true;
      });

      await _firestore
          .collection('connection_requests')
          .doc(requestId)
          .update({
        'status': 'accepted',
        'respondedAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      _showMessage(
        'You are now connected with $travellerName!',
      );
    } on FirebaseException catch (e) {
      debugPrint(
        '🔥 ACCEPT REQUEST ERROR: ${e.code} - ${e.message}',
      );

      if (!mounted) return;

      _showMessage(
        'Could not accept request: ${e.message ?? e.code}',
      );
    } catch (e) {
      debugPrint('🔥 ACCEPT ERROR: $e');

      if (!mounted) return;

      _showMessage(
        'Could not accept request. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _updating = false;
        });
      }
    }
  }

  // ============================================================
  // REJECT REQUEST
  // ============================================================

  Future<void> _rejectRequest(
    String requestId,
    String travellerName,
  ) async {
    try {
      setState(() {
        _updating = true;
      });

      await _firestore
          .collection('connection_requests')
          .doc(requestId)
          .update({
        'status': 'rejected',
        'respondedAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      _showMessage(
        'Request from $travellerName was declined.',
      );
    } on FirebaseException catch (e) {
      debugPrint(
        '🔥 REJECT REQUEST ERROR: ${e.code} - ${e.message}',
      );

      if (!mounted) return;

      _showMessage(
        'Could not reject request: ${e.message ?? e.code}',
      );
    } catch (e) {
      debugPrint('🔥 REJECT ERROR: $e');

      if (!mounted) return;

      _showMessage(
        'Could not reject request. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _updating = false;
        });
      }
    }
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

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
          'Connection Requests',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: user == null
          ? _buildLoginMessage()
          : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore
                  .collection('connection_requests')
                  .where(
                    'localId',
                    isEqualTo: user.uid,
                  )
                  .snapshots(),

              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint(
                    '🔥 REQUEST STREAM ERROR: ${snapshot.error}',
                  );

                  return _buildError(
                    snapshot.error.toString(),
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

                final documents =
                    snapshot.data?.docs ?? [];

                final requests = documents.where((doc) {
                  final status =
                      doc.data()['status'] ?? 'pending';

                  return status == 'pending';
                }).toList();

                if (requests.isEmpty) {
                  return _buildEmptyState();
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    22,
                    12,
                    22,
                    30,
                  ),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final document =
                        requests[index];

                    return _RequestCard(
                      document: document,
                      updating: _updating,
                      onAccept: () {
                        final data =
                            document.data();

                        _acceptRequest(
                          document.id,
                          data['travellerName'] ??
                              'Traveller',
                        );
                      },
                      onReject: () {
                        final data =
                            document.data();

                        _rejectRequest(
                          document.id,
                          data['travellerName'] ??
                              'Traveller',
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xFFD9F1EE),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.people_outline_rounded,
                size: 46,
                color: Color(0xFF087E8B),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'No connection requests',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'When travellers want to connect with you, '
              'their requests will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF617376),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // LOGIN MESSAGE
  // ============================================================

  Widget _buildLoginMessage() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          'Please login to view connection requests.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF617376),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ERROR
  // ============================================================

  Widget _buildError(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 55,
              color: Color(0xFF718386),
            ),

            const SizedBox(height: 16),

            const Text(
              'Unable to load requests.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF12343B),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF718386),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =================================================================
// REQUEST CARD
// =================================================================

class _RequestCard extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>
      document;

  final bool updating;

  final VoidCallback onAccept;
  final VoidCallback onReject;

  const _RequestCard({
    required this.document,
    required this.updating,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final data = document.data();

    final travellerName =
        data['travellerName'] ?? 'Traveller';

    final travellerEmail =
        data['travellerEmail'] ?? '';

    final destination =
        data['destination'] ?? 'your destination';

    final placeName =
        data['placeName'] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),

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
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          // ======================================================
          // PERSON
          // ======================================================

          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9F1EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 34,
                  color: Color(0xFF087E8B),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12343B),
                      ),
                    ),

                    if (travellerEmail
                        .toString()
                        .isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        travellerEmail,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF718386),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3D6),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: const Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB77900),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ======================================================
          // REQUEST DETAILS
          // ======================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF087E8B),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        'Travelling to $destination',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF12343B),
                        ),
                      ),
                    ),
                  ],
                ),

                if (placeName
                    .toString()
                    .isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 18,
                        color: Color(0xFF718386),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          'Interested in $placeName',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF617376),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 18),

          // ======================================================
          // ACTION BUTTONS
          // ======================================================

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed:
                      updating ? null : onReject,
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 18,
                  ),
                  label: const Text(
                    'Decline',
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                        const Color(0xFF718386),
                    side: const BorderSide(
                      color: Color(0xFFD5DDDE),
                    ),
                    minimumSize:
                        const Size.fromHeight(46),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed:
                      updating ? null : onAccept,
                  icon: updating
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.check_rounded,
                          size: 18,
                        ),
                  label: Text(
                    updating
                        ? 'Updating...'
                        : 'Accept',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF087E8B),
                    foregroundColor:
                        Colors.white,
                    minimumSize:
                        const Size.fromHeight(46),
                    elevation: 0,
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
    );
  }
}