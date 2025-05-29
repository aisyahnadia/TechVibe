// File: lib/job_opportunities_page.dart

import 'package:flutter/material.dart';

class JobOpportunitiesPage extends StatefulWidget {
  const JobOpportunitiesPage({super.key});

  @override
  State<JobOpportunitiesPage> createState() => _JobOpportunitiesPageState();
}

class _JobOpportunitiesPageState extends State<JobOpportunitiesPage> {
  String selectedJobType = "All";
  String selectedSalaryRange = "All";
  String searchQuery = "";

  final List<String> jobTypes = [
    "All",
    "Full-time",
    "Part-time",
    "Contract",
    "Internship",
  ];
  final List<String> salaryRanges = [
    "All",
    "RM 2k-4k",
    "RM 4k-6k",
    "RM 6k-8k",
    "RM 8k+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Job Opportunities',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header section with gradient background
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[600]!, Colors.blue[400]!],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Find Your Dream Job',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore thousands of job opportunities',
                    style: TextStyle(fontSize: 14, color: Colors.blue[50]),
                  ),
                ],
              ),
            ),
          ),

          // Search and quick filters section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Search bar
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                    // TODO: Implement search functionality
                  },
                  decoration: InputDecoration(
                    hintText: 'Search jobs, companies, skills...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.blue[600]),
                    suffixIcon:
                        searchQuery.isNotEmpty
                            ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.grey[500]),
                              onPressed: () {
                                setState(() {
                                  searchQuery = "";
                                });
                              },
                            )
                            : null,
                    filled: true,
                    fillColor: Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue[600]!,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Quick filter chips
                Row(
                  children: [
                    Icon(Icons.tune, color: Colors.blue[600], size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Quick Filters:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(
                        label:
                            selectedJobType == "All"
                                ? "Job Type"
                                : selectedJobType,
                        isSelected: selectedJobType != "All",
                        onTap: () => _showJobTypeFilter(),
                      ),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        label:
                            selectedSalaryRange == "All"
                                ? "Salary Range"
                                : selectedSalaryRange,
                        isSelected: selectedSalaryRange != "All",
                        onTap: () => _showSalaryRangeFilter(),
                      ),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        label: "Remote",
                        isSelected: false,
                        onTap: () {
                          // TODO: Implement remote filter
                        },
                      ),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        label: "Latest",
                        isSelected: false,
                        onTap: () {
                          // TODO: Implement latest filter
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Jobs list section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Jobs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '1,247 jobs',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10, // Placeholder: Display 10 dummy job cards
                      itemBuilder: (context, index) {
                        // TODO: Replace with actual data from backend
                        return _buildJobCard(
                          title: _getJobTitle(index),
                          company: 'TechCorp Solutions ${index + 1}',
                          salary: _getSalaryRange(index),
                          type: _getJobType(index),
                          location: 'Kuala Lumpur, Malaysia',
                          postedTime: '${index + 1} days ago',
                          isRemote: index % 3 == 0,
                          logoPath: 'assets/images/default_company_logo.png',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[600] : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue[600]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 13,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }

  // Enhanced job card widget with more details
  Widget _buildJobCard({
    required String title,
    required String company,
    required String salary,
    required String type,
    required String location,
    required String postedTime,
    required bool isRemote,
    required String logoPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.business,
                    color: Colors.blue[600],
                    size: 28,
                  ),
                  // TODO: Replace with actual company logo
                  // child: Image.asset(logoPath, width: 32, height: 32),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isRemote)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Remote',
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          postedTime,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money, size: 16, color: Colors.blue[600]),
                  const SizedBox(width: 4),
                  Text(
                    salary,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                    onPressed: () {
                      // TODO: Implement bookmark functionality
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to job details
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showJobTypeFilter() {
    // TODO: Implement job type filter selection
  }

  void _showSalaryRangeFilter() {
    // TODO: Implement salary range filter selection
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter Jobs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedJobType = "All";
                        selectedSalaryRange = "All";
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Job Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // Job type options would go here
              const SizedBox(height: 20),
              const Text(
                'Salary Range',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // Salary range options would go here
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Apply filters
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper methods for generating sample data
  String _getJobTitle(int index) {
    final titles = [
      'Senior Flutter Developer',
      'UI/UX Designer',
      'Full Stack Developer',
      'Data Analyst',
      'Project Manager',
      'DevOps Engineer',
      'Mobile App Developer',
      'Backend Developer',
      'Frontend Developer',
      'Software Engineer',
    ];
    return titles[index % titles.length];
  }

  String _getSalaryRange(int index) {
    final salaries = [
      'RM 5,000 - RM 8,000',
      'RM 4,000 - RM 6,000',
      'RM 6,000 - RM 9,000',
      'RM 3,500 - RM 5,500',
      'RM 7,000 - RM 10,000',
    ];
    return salaries[index % salaries.length];
  }

  String _getJobType(int index) {
    final types = ['Full-time', 'Part-time', 'Contract', 'Internship'];
    return types[index % types.length];
  }
}
