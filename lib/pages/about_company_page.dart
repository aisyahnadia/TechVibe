// File: lib/about_company_page.dart

import 'package:flutter/material.dart';
import 'apply_job.dart'; // Import the apply job page

class CompanyDetailsPage extends StatefulWidget {
  final Map<String, dynamic> jobData;

  const CompanyDetailsPage({super.key, required this.jobData});

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  String selectedTab = 'Description';
  late Map<String, dynamic> companyInfo;

  @override
  void initState() {
    super.initState();
    _loadCompanyInfo();
  }

  void _loadCompanyInfo() {
    // Mock company data based on the selected company
    final companyData = {
      'NetScope': {
        'description':
            'NetScope is a leading technology company specializing in network solutions and software development. We create innovative products that help businesses optimize their digital infrastructure and improve operational efficiency.',
        'industry': 'Technology & Software',
        'founded': '2015',
        'employees': '500-1000',
        'headquarters': 'Kuala Lumpur, Malaysia',
        'website': 'www.netscope.com.my',
        'benefits': [
          'Health Insurance',
          'Dental Coverage',
          'Flexible Working Hours',
          'Remote Work Options',
          'Professional Development',
          'Annual Bonus',
          'Stock Options',
          'Gym Membership',
        ],
        'culture':
            'Innovation-driven culture with emphasis on collaboration, continuous learning, and work-life balance. We believe in empowering our employees to make meaningful contributions.',
        'officeImages': ['office1.jpg', 'office2.jpg', 'office3.jpg'],
        'rating': 4.5,
        'reviews': 127,
        'jobs': [
          {
            'title': 'Software Engineer',
            'department': 'Engineering',
            'location': 'Johor, Malaysia',
            'type': 'Full-time',
          },
          {
            'title': 'Senior Frontend Developer',
            'department': 'Engineering',
            'location': 'Kuala Lumpur, Malaysia',
            'type': 'Full-time',
          },
          {
            'title': 'DevOps Engineer',
            'department': 'Engineering',
            'location': 'Remote',
            'type': 'Full-time',
          },
        ],
      },
      'GoTo': {
        'description':
            'GoTo is Southeast Asia\'s largest digital ecosystem, providing on-demand transport, e-commerce, food delivery, logistics, and financial services through the Gojek, Tokopedia, and other brands.',
        'industry': 'Technology & E-commerce',
        'founded': '2010',
        'employees': '10,000+',
        'headquarters': 'Jakarta, Indonesia',
        'website': 'www.goto.com',
        'benefits': [
          'Comprehensive Health Insurance',
          'Life Insurance',
          'Flexible Working Arrangements',
          'Learning & Development Budget',
          'Mental Health Support',
          'Parental Leave',
          'Performance Bonus',
          'Transportation Allowance',
        ],
        'culture':
            'Fast-paced, innovative environment focused on solving real-world problems. We value diversity, inclusion, and sustainable growth.',
        'rating': 4.3,
        'reviews': 892,
        'jobs': [
          {
            'title': 'Data Analyst',
            'department': 'Data Science',
            'location': 'Kuala Lumpur, Malaysia',
            'type': 'Full-time',
          },
        ],
      },
      'Traveloka': {
        'description':
            'Traveloka is a leading Southeast Asian travel platform that provides a wide range of travel needs in one app, including flights, hotels, attractions, activities, and more.',
        'industry': 'Travel & Technology',
        'founded': '2012',
        'employees': '5,000-10,000',
        'headquarters': 'Jakarta, Indonesia',
        'website': 'www.traveloka.com',
        'benefits': [
          'Health & Medical Insurance',
          'Travel Allowance',
          'Flexible Work Schedule',
          'Career Development Programs',
          'Annual Health Check-up',
          'Employee Discounts',
          'Wellness Programs',
          'Team Building Activities',
        ],
        'culture':
            'Customer-obsessed culture with strong emphasis on innovation, integrity, and teamwork. We strive to make travel accessible for everyone.',
        'rating': 4.2,
        'reviews': 456,
        'jobs': [
          {
            'title': 'IT Project Manager',
            'department': 'Information Technology',
            'location': 'Selangor, Malaysia',
            'type': 'Full-time',
          },
        ],
      },
    };

    companyInfo =
        companyData[widget.jobData['company']] ??
        {
          'description':
              'A leading company in the technology sector, committed to innovation and excellence.',
          'industry': 'Technology',
          'founded': '2020',
          'employees': '100-500',
          'headquarters': 'Malaysia',
          'website': 'www.company.com',
          'benefits': ['Health Insurance', 'Flexible Hours', 'Remote Work'],
          'culture':
              'Innovation-focused culture with strong team collaboration.',
          'rating': 4.0,
          'reviews': 50,
          'jobs': [widget.jobData],
        };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar with Company Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF261FB3),
                  size: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.share,
                    color: Color(0xFF261FB3),
                    size: 20,
                  ),
                ),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.jobData['logoColor'].withOpacity(0.8),
                      widget.jobData['logoColor'],
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // Company Logo
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          widget.jobData['logo'],
                          style: TextStyle(
                            color: widget.jobData['logoColor'],
                            fontSize:
                                widget.jobData['logo'].length == 1 ? 32 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Company Name
                    Text(
                      widget.jobData['company'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Industry
                    Text(
                      companyInfo['industry'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < companyInfo['rating'].floor()
                                  ? Icons.star
                                  : index < companyInfo['rating']
                                  ? Icons.star_half
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${companyInfo['rating']} (${companyInfo['reviews']} reviews)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Tab Bar
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _buildTab('Description'),
                      _buildTab('Company'),
                      _buildTab('Reviews'),
                    ],
                  ),
                ),

                // Tab Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildTabContent(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Apply Job Page
            _navigateToApplyJob();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF261FB3),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Apply Now',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF261FB3) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 'Description':
        return _buildDescriptionTab();
      case 'Company':
        return _buildCompanyTab();
      case 'Reviews':
        return _buildReviewsTab();
      default:
        return _buildDescriptionTab();
    }
  }

  Widget _buildDescriptionTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Position
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.jobData['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF261FB3),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    widget.jobData['location'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    widget.jobData['salary'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Qualifications
        const Text(
          'Qualifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildQualificationItem('Strong portfolio to be presented'),
        _buildQualificationItem('Minimum 2-3 years Experience needed'),
        _buildQualificationItem(
          'Able to study a problem with systematic techniques and frameworks',
        ),

        const SizedBox(height: 24),

        // Job Description
        const Text(
          'Job Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'A Software Engineer designs, develops, tests, and maintains existing and new software systems. They collaborate with development teams, ensure product quality, and hold a degree in computer engineering or related field. Experience in web or mobile development, Agile/Scrum knowledge, and relevant technical skills are essential.',
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildCompanyTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Overview
        const Text(
          'About Company',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          companyInfo['description'],
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        ),

        const SizedBox(height: 24),

        // Company Info
        _buildInfoRow('Founded', companyInfo['founded']),
        _buildInfoRow('Employees', companyInfo['employees']),
        _buildInfoRow('Headquarters', companyInfo['headquarters']),
        _buildInfoRow('Website', companyInfo['website']),

        const SizedBox(height: 24),

        // Benefits
        const Text(
          'Benefits & Perks',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              companyInfo['benefits'].map<Widget>((benefit) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green[200]!),
                  ),
                  child: Text(
                    benefit,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
        ),

        const SizedBox(height: 24),

        // Culture
        const Text(
          'Company Culture',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          companyInfo['culture'],
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Overall Rating
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange[100]!),
          ),
          child: Column(
            children: [
              Text(
                '${companyInfo['rating']}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < companyInfo['rating'].floor()
                        ? Icons.star
                        : index < companyInfo['rating']
                        ? Icons.star_half
                        : Icons.star_border,
                    color: Colors.orange,
                    size: 24,
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(
                'Based on ${companyInfo['reviews']} reviews',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Sample Reviews
        _buildReviewCard(
          'John D.',
          5,
          'Great company to work for. Amazing culture and benefits.',
          '2 weeks ago',
        ),
        _buildReviewCard(
          'Sarah M.',
          4,
          'Good work-life balance and supportive management.',
          '1 month ago',
        ),
        _buildReviewCard(
          'Mike R.',
          4,
          'Excellent learning opportunities and career growth.',
          '2 months ago',
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildQualificationItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF261FB3),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(String name, int rating, String review, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 16,
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToApplyJob() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplyJobScreen(), // No jobData parameter
      ),
    );
  }
}
