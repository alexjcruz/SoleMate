import 'package:flutter/material.dart';
import '../colors.dart';
import 'home.dart';
import 'portfolio.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

    // Function to handle bottom navigation bar 
   void onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Portfolio()),
      );
    }
    else if (index == 2) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        // AppBar
        appBar: AppBar(
          title: Text(
            'SoleMate',
            style: TextStyle(color: AppColors.primary, fontSize: 24),
          ),
          backgroundColor: AppColors.background,
          shape: Border(bottom: BorderSide(color: AppColors.primary)),
        ),
    
        // Body
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                /*
                SizedBox(height: 20),
                Text('User Preferences', 
                  style: TextStyle(
                    color: AppColors.primary, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Dark Mode', 
                      style: TextStyle(
                        color: AppColors.secondary, 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                */

                SizedBox(height: 20),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textbox,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: AppColors.primary, width: 1),
                    ),
                  ),
                  onPressed: () {
                    HomeScreen.clearSneakers(); 
                    Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (Route<dynamic> route) => false, 
                  );
                  },
                  child: Text('Log Out', 
                    style: TextStyle(
                      color: AppColors.primary, 
                      fontSize: 24, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          )
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
              currentIndex: 2,
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
      ),
    );
  }
}