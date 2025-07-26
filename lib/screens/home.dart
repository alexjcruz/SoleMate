import 'package:flutter/material.dart';
import 'package:solemate/screens/details.dart';
import 'package:solemate/screens/manually_add.dart';
import 'package:solemate/screens/portfolio.dart';
import 'package:solemate/screens/settings.dart';
import '../colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // Static list to hold sneaker data
  static List<Map<String, dynamic>> sneakers = [];
  
  // Function to clear sneaker data
  static void clearSneakers() {
    sneakers = [];
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedButton = 'All';

  // Function to filter sneakers
  List<Map<String, dynamic>> filterSneakers() {
    if (_selectedButton == 'All') {
      return HomeScreen.sneakers;
    }
    return HomeScreen.sneakers
        .where((sneaker) => sneaker['brand'] == _selectedButton).toList();
  }

  // Function to handle bottom navigation bar 
  void onItemTapped(int index) {
    if (index == 0) return; 
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Portfolio()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Settings()),
      );
    }
  }

  // Function to initialize state
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        // AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'SoleMate',
            style: TextStyle(color: AppColors.primary, fontSize: 24),
          ),
          actions: [
            // Add Sneaker Button
            IconButton(
              onPressed: () {
                showManualAddDialog(context, HomeScreen.sneakers, () => setState(() {}));
              },
              icon: const Icon(Icons.add, color: AppColors.primary),
            ),
          ],
          backgroundColor: AppColors.background,
          shape: Border(bottom: BorderSide(color: AppColors.primary)),
        ),

        // Body
        body: Column(
          children: [
            // Filter Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // All Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'All'
                          ? AppColors.primary
                          : AppColors.background,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColors.primary, width: 1),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'All';
                      });
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: _selectedButton == 'All'
                            ? Colors.white
                            : AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),

                  // Nike Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Nike'
                          ? AppColors.primary
                          : AppColors.background,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColors.primary, width: 1),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Nike';
                      });
                    },
                    child: Text(
                      'Nike',
                      style: TextStyle(
                        color: _selectedButton == 'Nike'
                            ? Colors.white
                            : AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),

                  // Jordan Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Jordan'
                          ? AppColors.primary
                          : AppColors.background,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColors.primary, width: 1),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Jordan';
                      });
                    },
                    child: Text(
                      'Jordan',
                      style: TextStyle(
                        color: _selectedButton == 'Jordan'
                            ? Colors.white
                            : AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),

                  // Adidas Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Adidas'
                          ? AppColors.primary
                          : AppColors.background,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColors.primary, width: 1),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Adidas';
                      });
                    },
                    child: Text(
                      'Adidas',
                      style: TextStyle(
                        color: _selectedButton == 'Adidas'
                            ? Colors.white
                            : AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sneaker Grid
            Expanded(
              child: filterSneakers().isEmpty
                  ? const Center(
                      child: Text(
                        'No sneakers added',
                        style: TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filterSneakers().length,
                    itemBuilder: (context, index) {
                      final sneaker = filterSneakers()[index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textbox,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: AppColors.primary, width: 1),
                          ),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SneakerDetails(sneaker: sneaker),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                sneaker['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                sneaker['name'],
                                style:
                                    TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                sneaker['size'].toString(),
                                style:
                                    TextStyle(color: AppColors.primary, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            )
          ],
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border(top: BorderSide(color: AppColors.primary, width: 1)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomNavigationBar(
              onTap: onItemTapped,
              currentIndex: 0,
              backgroundColor: AppColors.background,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.primary.withValues(alpha: 0.3),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home), 
                  label: 'Home',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',

                ),
              ],
            ),
          ),
        ),
      );
  }
}
