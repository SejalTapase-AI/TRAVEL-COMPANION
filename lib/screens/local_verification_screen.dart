import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LocalVerificationScreen extends StatefulWidget {
  const LocalVerificationScreen({super.key});

  @override
  State<LocalVerificationScreen> createState() =>
      _LocalVerificationScreenState();
}

class _LocalVerificationScreenState
    extends State<LocalVerificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();

  final _cityController = TextEditingController();
  final _aboutController = TextEditingController();
  final _languagesController = TextEditingController();
  final _interestsController = TextEditingController();

  bool _isLoading = true;
  bool _isSubmitting = false;

  String _status = 'not_submitted';

  @override
  void initState() {
    super.initState();
    _loadVerificationData();
  }

  @override
  void dispose() {
    _cityController.dispose();
    _aboutController.dispose();
    _languagesController.dispose();
    _interestsController.dispose();
    super.dispose();
  }

  Future<void> _loadVerificationData() async {
    final user = _auth.currentUser;

    if (user == null) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      return;
    }

    try {
      final doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();

        if (data != null) {
          _cityController.text =
              data['city']?.toString() ?? '';

          _aboutController.text =
              data['about']?.toString() ?? '';

          _languagesController.text =
              data['languages']?.toString() ?? '';

          _interestsController.text =
              data['interests']?.toString() ?? '';

          _status =
              data['verificationStatus']?.toString() ??
                  'not_submitted';
        }
      }
    } catch (e) {
      // Keep the screen usable even if the profile
      // cannot be loaded.
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _submitVerification() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = _auth.currentUser;

    if (user == null) {
      _showMessage(
        'Please login before submitting verification.',
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(
        {
          'city': _cityController.text.trim(),
          'about': _aboutController.text.trim(),
          'languages': _languagesController.text.trim(),
          'interests': _interestsController.text.trim(),
          'verificationStatus': 'submitted',
          'verificationSubmittedAt':
              FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );

      if (!mounted) return;

      setState(() {
        _status = 'submitted';
      });

      _showMessage(
        'Verification request submitted successfully! ✅',
      );
    } on FirebaseException catch (e) {
      if (!mounted) return;

      _showMessage(
        e.message ?? 'Could not submit verification.',
      );
    } catch (e) {
      if (!mounted) return;

      _showMessage(
        'Something went wrong. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Color _statusColor() {
    switch (_status) {
      case 'verified':
        return Colors.green;

      case 'submitted':
      case 'pending':
        return Colors.orange;

      default:
        return Colors.grey;
    }
  }

  String _statusText() {
    switch (_status) {
      case 'verified':
        return 'Verified Local';

      case 'submitted':
        return 'Verification Submitted';

      case 'pending':
        return 'Verification Pending';

      default:
        return 'Verification Not Submitted';
    }
  }

  IconData _statusIcon() {
    switch (_status) {
      case 'verified':
        return Icons.verified;

      case 'submitted':
      case 'pending':
        return Icons.hourglass_top;

      default:
        return Icons.assignment_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FAFA),
        elevation: 0,
        title: const Text(
          'Local Verification',
          style: TextStyle(
            color: Color(0xFF12343B),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF12343B),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F5F3),
                        borderRadius:
                            BorderRadius.circular(22),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.verified_user_outlined,
                            size: 55,
                            color: Color(0xFF087E8B),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Become a Verified Local',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF12343B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Build trust with travellers by '
                            'completing your local profile.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // STATUS
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(18),
                        border: Border.all(
                          color: _statusColor()
                              .withValues(alpha: 0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: _statusColor()
                                  .withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _statusIcon(),
                              color: _statusColor(),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Verification Status',
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _statusText(),
                                  style: TextStyle(
                                    color: _statusColor(),
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ACCOUNT
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12343B),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _infoTile(
                      icon: Icons.person_outline,
                      title: user?.displayName ??
                          'Your Name',
                      subtitle: 'Firebase verified account',
                    ),

                    _infoTile(
                      icon: Icons.email_outlined,
                      title: user?.email ??
                          'No email available',
                      subtitle: 'Registered email address',
                    ),

                    const SizedBox(height: 20),

                    // PROFILE INFORMATION
                    const Text(
                      'Local Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12343B),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _field(
                      controller: _cityController,
                      label: 'City',
                      hint: 'e.g. Pune, Maharashtra',
                      icon: Icons.location_on_outlined,
                    ),

                    const SizedBox(height: 14),

                    _field(
                      controller: _aboutController,
                      label: 'About You',
                      hint:
                          'Tell travellers about yourself...',
                      icon: Icons.info_outline,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 14),

                    _field(
                      controller: _languagesController,
                      label: 'Languages',
                      hint:
                          'e.g. English, Hindi, Marathi',
                      icon: Icons.language,
                    ),

                    const SizedBox(height: 14),

                    _field(
                      controller: _interestsController,
                      label: 'Interests',
                      hint:
                          'e.g. Food, History, Photography',
                      icon: Icons.favorite_border,
                    ),

                    const SizedBox(height: 25),

                    // VERIFICATION INFO
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.security_outlined,
                                color: Color(0xFF087E8B),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Why verification?',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Verified locals help travellers '
                            'choose trustworthy people for '
                            'local experiences, guidance and '
                            'connections.',
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // SUBMIT BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed:
                            _isSubmitting ||
                                    _status == 'submitted' ||
                                    _status == 'verified'
                                ? null
                                : _submitVerification,
                        icon: _isSubmitting
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                _status == 'verified'
                                    ? Icons.verified
                                    : Icons.send,
                              ),
                        label: Text(
                          _status == 'verified'
                              ? 'Verified'
                              : _status == 'submitted'
                                  ? 'Verification Submitted'
                                  : 'Submit for Verification',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF087E8B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: Text(
                        'Your information is securely stored '
                        'with Firebase.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter $label';
        }

        return null;
      },
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF087E8B),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
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