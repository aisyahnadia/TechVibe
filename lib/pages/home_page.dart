// File: lib/home_page.dart

import 'package:flutter/material.dart';
import 'search_results_page.dart'; // Import the search results page
import 'profile_page.dart'; // Import the ProfilePage
import 'nearest_jobs_page.dart'; // Import the NearestJobsPage
import 'job_opportunities_page.dart'; // Import the JobOpportunitiesPage

class HomePage extends StatefulWidget {
  final String userName;

  // TODO: Replace 'Guest' with actual fetched username when backend is integrated
  const HomePage({super.key, this.userName = 'Guest'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // To track the selected tab

  // List of pages corresponding to the bottom navigation items
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // 0: Home Tab Content
      _HomeContent(userName: widget.userName),
      // 1: Nearest Jobs Tab Content
      const NearestJobsPage(),
      // 2: Job Opportunities Tab Content
      const JobOpportunitiesPage(),
      // 3: Profile Tab Content - Fixed: Added required userName parameter
      ProfilePage(userName: widget.userName),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the background color based on the selected index
    Color? scaffoldBackgroundColor = Colors.white;
    if (_selectedIndex != 0) {
      // For other tabs, set a light grey background
      scaffoldBackgroundColor = Colors.grey[100];
    }

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: _pages[_selectedIndex], // Display the selected page
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Nearest Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Job Opportunities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Helper widget to contain the original Home page content
class _HomeContent extends StatelessWidget {
  final String userName;

  const _HomeContent({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with User Greeting and Navigation Icons
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Text(
                    userName, // Use the actual username passed from parent
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Profile and Notification Icons with Pop-up Menu
              Row(
                children: [
                  // Notification Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Profile Icon with Pop-up Menu
                  PopupMenuButton<String>(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                    ),
                    onSelected: (String result) {
                      if (result == 'profile') {
                        // Navigate to the Profile tab
                        final homePageState =
                            context.findAncestorStateOfType<_HomePageState>();
                        homePageState?._onItemTapped(
                          3,
                        ); // Profile tab is at index 3
                      } else if (result == 'logout') {
                        // TODO: Implement actual logout logic
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login', // Replace with your actual login route name
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    itemBuilder:
                        (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'profile',
                            child: Text('Profile'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'logout',
                            child: Text('Logout'),
                          ),
                        ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar with Navigation
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchResultsPage(),
                        ),
                      );
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Job Here...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const SearchResultsPage(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Trending Job Section
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending Job',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Show More',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Trending Job Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Creative Video Editor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                '30+ Job Available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Camera Icon
                        Image.asset(
                          'assets/images/camera.png',
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),

                  // Latest Jobs Section
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest Jobs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Show More',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Job Category Filters
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildJobCategoryChip('All Jobs', isSelected: true),
                        const SizedBox(width: 10),
                        _buildJobCategoryChip('Design'),
                        const SizedBox(width: 10),
                        _buildJobCategoryChip('Product Management'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Job Listings
                  _buildJobCard(
                    title: 'UX Designer',
                    company: 'AMD',
                    salary: 'RM 2500-RM4000',
                    type: 'Fulltime, remote/onsite',
                    logoPath: 'assets/images/amd_logo.png',
                  ),

                  const SizedBox(height: 10),

                  _buildJobCard(
                    title: 'Data Analyst',
                    company: 'Intel',
                    salary: 'RM 30K- RM 65K',
                    type: 'Fulltime, remote/onsite',
                    logoPath: 'assets/images/intel_logo.jpg',
                  ),

                  const SizedBox(height: 20), // Bottom padding
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildJobCard({
    required String title,
    required String company,
    required String salary,
    required String type,
    required String logoPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset(logoPath, width: 30, height: 30)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      salary,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      type,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
