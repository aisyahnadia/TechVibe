// File: lib/search_results_page.dart

import 'package:flutter/material.dart';
import 'about_company_page.dart'; // Import the new company details page

class SearchResultsPage extends StatefulWidget {
  final String searchQuery;

  const SearchResultsPage({super.key, this.searchQuery = ''});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String selectedFilter = 'Most Recent';
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredJobResults = [];

  // Sample job data
  final List<Map<String, dynamic>> allJobResults = [
    {
      'company': 'NetScope',
      'title': 'Software Engineer',
      'salary': 'RM 35000',
      'location': 'Johor, Malaysia',
      'logo': 'N',
      'logoColor': Colors.black,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(days: 1)),
      'relevanceScore': 8.5,
    },
    {
      'company': 'GoTo',
      'title': 'Data Analyst',
      'salary': 'RM 25000',
      'location': 'Kuala Lumpur, Malaysia',
      'logo': 'goto',
      'logoColor': Colors.green,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(days: 3)),
      'relevanceScore': 7.8,
    },
    {
      'company': 'Traveloka',
      'title': 'IT Project Manager',
      'salary': 'RM 40000',
      'location': 'Selangor, Malaysia',
      'logo': 'T',
      'logoColor': Colors.blue,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(days: 2)),
      'relevanceScore': 9.2,
    },
    {
      'company': 'Mandiri',
      'title': 'Cyber Security Analyst',
      'salary': 'RM 35000',
      'location': 'Penang, Malaysia',
      'logo': 'mandiri',
      'logoColor': Colors.orange,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(hours: 12)),
      'relevanceScore': 8.9,
    },
    {
      'company': 'Unity',
      'title': 'Software Developer',
      'salary': 'RM 40000',
      'location': 'Kuala Lumpur, Malaysia',
      'logo': 'U',
      'logoColor': Colors.black,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(days: 4)),
      'relevanceScore': 8.1,
    },
    {
      'company': 'TechCorp',
      'title': 'Frontend Developer',
      'salary': 'RM 32000',
      'location': 'Johor, Malaysia',
      'logo': 'TC',
      'logoColor': Colors.purple,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(days: 5)),
      'relevanceScore': 7.5,
    },
    {
      'company': 'DataFlow',
      'title': 'Backend Engineer',
      'salary': 'RM 38000',
      'location': 'Kuala Lumpur, Malaysia',
      'logo': 'DF',
      'logoColor': Colors.teal,
      'isFavorite': false,
      'datePosted': DateTime.now().subtract(const Duration(hours: 6)),
      'relevanceScore': 8.7,
    },
  ];

  @override
  void initState() {
    super.initState();
    searchController.text = widget.searchQuery;
    _applyFilters();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    List<Map<String, dynamic>> results = List.from(allJobResults);

    // Apply search filter
    if (searchController.text.isNotEmpty) {
      results =
          results.where((job) {
            String searchQuery = searchController.text.toLowerCase();
            return job['title'].toString().toLowerCase().contains(
                  searchQuery,
                ) ||
                job['company'].toString().toLowerCase().contains(searchQuery) ||
                job['location'].toString().toLowerCase().contains(searchQuery);
          }).toList();
    }

    // Apply sorting filter
    if (selectedFilter == 'Most Recent') {
      results.sort((a, b) => b['datePosted'].compareTo(a['datePosted']));
    } else if (selectedFilter == 'Most Relevant') {
      results.sort(
        (a, b) => b['relevanceScore'].compareTo(a['relevanceScore']),
      );
    }

    setState(() {
      filteredJobResults = results;
    });
  }

  void _onFilterChanged(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    _applyFilters();
  }

  void _onSearchChanged(String query) {
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF261FB3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search Result',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search jobs, companies, locations...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  suffixIcon:
                      searchController.text.isNotEmpty
                          ? IconButton(
                            icon: Icon(Icons.clear, color: Colors.grey[500]),
                            onPressed: () {
                              searchController.clear();
                              _onSearchChanged('');
                            },
                          )
                          : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Category and Job Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Technology',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${filteredJobResults.length} Job${filteredJobResults.length != 1 ? 's' : ''} Found',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Filter Buttons
            Row(
              children: [
                _buildFilterButton(
                  'Most Recent',
                  selectedFilter == 'Most Recent',
                ),
                const SizedBox(width: 12),
                _buildFilterButton(
                  'Most Relevant',
                  selectedFilter == 'Most Relevant',
                ),
              ],
            ),

            const SizedBox(height: 20),

            // No Results Message
            if (filteredJobResults.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No jobs found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try adjusting your search or filters',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              )
            else
              // Job Results List
              Expanded(
                child: ListView.builder(
                  itemCount: filteredJobResults.length,
                  itemBuilder: (context, index) {
                    return _buildJobResultCard(
                      filteredJobResults[index],
                      index,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () => _onFilterChanged(text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF261FB3) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF261FB3) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildJobResultCard(Map<String, dynamic> job, int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to company details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyDetailsPage(jobData: job),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Company Logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: job['logoColor'],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child:
                    job['logo'].length == 1
                        ? Text(
                          job['logo'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        : Text(
                          job['logo'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
            ),

            const SizedBox(width: 16),

            // Job Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        job['company'],
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            job['isFavorite'] = !job['isFavorite'];
                          });
                        },
                        icon: Icon(
                          job['isFavorite']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: job['isFavorite'] ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    job['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        job['salary'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ' - ${job['location']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),

                  // Time posted indicator
                  const SizedBox(height: 4),
                  Text(
                    _getTimeAgo(job['datePosted']),
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime datePosted) {
    final now = DateTime.now();
    final difference = now.difference(datePosted);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else {
      return 'Just posted';
    }
  }
}
