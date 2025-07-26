import 'package:flutter/material.dart';
import '../colors.dart'; 
import '../screens/home.dart';
import 'settings.dart';
import 'details.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  //Function to calculate portfolio metrics
  Map<String, dynamic> updatePortfolioMetrics() {
    final sneakers = HomeScreen.sneakers;
    int totalPairs = sneakers.length;
    double totalValue = 0.0;
    double totalProfit = 0.0;

  for (var sneaker in sneakers) {
      final currentValue = (sneaker['current_value'] as num?)?.toDouble() ?? 0.0;
      final price = (sneaker['price'] as num?)?.toDouble() ?? 0.0;
      totalValue += currentValue;
      totalProfit += currentValue - price;
    }

    return {
      'totalPairs': totalPairs,
      'totalValue': totalValue,
      'totalProfit': totalProfit,
    };

  }

  // Function to handle bottom navigation bar 
   void onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    else if (index == 1) {
      return;
    }
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Settings()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final portfolioMetrics = updatePortfolioMetrics();
    final totalPairs = portfolioMetrics['totalPairs'] as int;
    final totalValue = portfolioMetrics['totalValue'] as double;
    final totalProfit = portfolioMetrics['totalProfit'] as double;

    // Function to sort sneakers by current value
    final sortedSneakersList = List<Map<String, dynamic>>.from(HomeScreen.sneakers)
      ..sort((a, b) => (b['current_value'] as num? ?? 0).compareTo(a['current_value'] as num? ?? 0));

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
                SizedBox(height: 20),
                // Portfolio Value Title
                Text(
                  'Portfolio Value', 
                  style: TextStyle(
                    color: AppColors.primary, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                SizedBox(height: 10),
                // Portfolio Value Container
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10), 
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Value',
                        style: TextStyle(
                          color: AppColors.secondary, 
                          fontSize: 14
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$${totalValue.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: AppColors.primary, 
                          fontSize: 30, 
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Total Pairs Container
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(10), 
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 10, 75, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Pairs',
                            style: TextStyle(
                              color: AppColors.secondary, 
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '$totalPairs',
                            style: TextStyle(
                              color: AppColors.primary, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(width: 25), 
                    // Total Profit Container
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(10), 
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 10, 60, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Profit',
                            style: TextStyle(
                              color: AppColors.secondary, 
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${totalProfit.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.primary, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // Top Performers Title
                Text(
                  'Top Performers',
                  style: TextStyle(
                    color: AppColors.primary, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),

                // List of Top Performing Sneakers
                Expanded( 
                  child: sortedSneakersList.isEmpty
                  ? const Center(
                      child: Text(
                        'No sneakers in your portfolio yet.',
                        style: TextStyle(
                          color: AppColors.primary, 
                          fontSize: 18
                        ),
                      ),
                    )
                  : ListView.builder(
                    padding: const EdgeInsets.only(left: 4.0, right: 30.0),
                    itemCount: sortedSneakersList.length,
                    itemBuilder:(context, index) {
                      final sneaker = sortedSneakersList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: AppColors.primary,width: 1,),
                        ),
                        child: ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            leading: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                sneaker['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              sneaker['name'],
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Current Value: \$${sneaker['current_value']}',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SneakerDetails(sneaker: sneaker),
                                ),
                              );
                            },
                          ),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
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
              currentIndex: 1,
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