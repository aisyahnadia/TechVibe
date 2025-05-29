import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

class UploadSsmCertificatePage extends StatefulWidget {
  const UploadSsmCertificatePage({super.key});

  @override
  State<UploadSsmCertificatePage> createState() =>
      _UploadSsmCertificatePageState();
}

class _UploadSsmCertificatePageState extends State<UploadSsmCertificatePage> {
  String? selectedFileName;

  Future<void> pickFile() async {
    // Define the file types that can be selected
    final XTypeGroup imagesAndPdf = XTypeGroup(
      label: 'Images & PDF',
      extensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    try {
      // Open file picker dialog for selecting files
      final XFile? file = await openFile(acceptedTypeGroups: [imagesAndPdf]);

      if (file != null) {
        setState(() {
          selectedFileName = file.name;
        });

        // Show success message after upload
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File "${file.name}" uploaded successfully!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF261FB3),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create an account so you can explore all the inspiring information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              const Text(
                'Upload SSM Certificates',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: pickFile,
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedFileName ?? 'Choose an image or PDF',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'JPEG, PNG, and PDF formats, up to 10MB',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Click Example Format of SSM Certificates',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Image')),
                  TextButton(onPressed: () {}, child: const Text('PDF')),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
