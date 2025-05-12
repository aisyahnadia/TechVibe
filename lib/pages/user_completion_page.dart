import 'package:flutter/material.dart';

class UserCompletionPage extends StatefulWidget {
  const UserCompletionPage({super.key});

  @override
  State<UserCompletionPage> createState() => _UserVerificationPageState();
}

class _UserVerificationPageState extends State<UserCompletionPage> {
  bool _isFrontIdUploaded = false;
  bool _isBackIdUploaded = false;
  bool _isProfileUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF261FB3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Verify your identity with IC upload and profile picture',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  children: [
                    // IC Front Upload Section
                    _buildIdUploadSection(
                      title: 'Upload Front of IC',
                      isUploaded: _isFrontIdUploaded,
                      onUpload: () {
                        setState(() {
                          _isFrontIdUploaded = true;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    // IC Back Upload Section
                    _buildIdUploadSection(
                      title: 'Upload Back of IC',
                      isUploaded: _isBackIdUploaded,
                      onUpload: () {
                        setState(() {
                          _isBackIdUploaded = true;
                        });
                      },
                    ),
                    const SizedBox(height: 32),

                    // Profile Image Upload Section
                    const Text(
                      'Upload Profile Image',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey[600],
                            size: 100,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Please Upload Your Profile',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const Text(
                            'in JPEG and PNG formats',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isProfileUploaded = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Upload Profile Image',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Next Button
                    ElevatedButton(
                      onPressed:
                          _isFrontIdUploaded &&
                                  _isBackIdUploaded &&
                                  _isProfileUploaded
                              ? () {
                                // TODO: Implement next steps after verification
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF261FB3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Uploading Sections
  Widget _buildIdUploadSection({
    required String title,
    required bool isUploaded,
    required VoidCallback onUpload,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isUploaded ? Colors.green : Colors.grey.shade300,
              width: 2,
            ),
            color: Colors.grey[100],
          ),
          child:
              isUploaded
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 64),
                        const SizedBox(height: 8),
                        const Text(
                          'Image Uploaded',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.cloud_upload,
                          color: Colors.grey[600],
                          size: 64,
                        ),
                        onPressed: onUpload,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Choose a image or take a photo',
                        style: TextStyle(
                          color: Color(0xFF969595),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'JPEG and PNG formats, up to 10MB',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
        ),
      ],
    );
  }
}
