import 'package:flutter/material.dart';
import 'booking.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space ticket booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "X'Teors"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Index of the selected tab
  
  // List of widgets corresponding to each tab

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
        appBar: AppBar(
          
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title, // 'X'Teors' title
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Set the font size for the title
                ),
              ),
              SizedBox(width: screenWidth * 0.18),
              Text(
                'Home', 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.055, // Set the font size for the label
                  fontWeight: FontWeight.normal, // Set the font weight for the label
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Implement your notification action here
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: screenHeight * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth * 0.05),
                Expanded(
                  child: _buildStackedButton(
                    Icons.place,
                    'Destinations',
                    Colors.blue,
                    screenWidth,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03), // Add spacing between buttons
                Expanded(
                  child: _buildStackedButton(
                    Icons.rocket_launch,
                    'Flights',
                    Colors.green,
                    screenWidth,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03), // Add spacing between buttons
                Expanded(
                  child: _buildStackedButton(
                    Icons.menu_book,
                    'Passport',
                    Colors.orange,
                    screenWidth,
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.025), // Add spacing between the image and the search bar
            Container(
              width: screenWidth * 0.9, // Set the width of the search bar
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search destination', // Placeholder text
                  suffixIcon: Icon(Icons.search), // Icon on the left side
                  border: OutlineInputBorder(), // Border around the search bar
                  filled: true, // Fill the background color
                  fillColor: Colors.grey[200], // Set the background color
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                InkWell(
                  onTap: () {
                    // Handle image click
                  },
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                    ),
                    child: Image.asset(
                      'images/galaxy.png', // Replace with the actual image asset path
                      width: screenWidth,
                      height: screenHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.025,
                  left: screenWidth * 0.05,
                  child: InkWell(
                    onTap: () {
                      // Handle text click
                    },
                    child: Text(
                      'Hard to pick?\nLet us find the best place for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Upcoming Tours',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            
            Container(
              width: screenWidth * 0.9,
              height: 2,
              color: Colors.white,
            ),
            
            SizedBox(height: screenHeight * 0.025),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.1,
              padding: EdgeInsets.all(screenWidth * 0.025),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Text(
                          'Earth to Mars',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01), // Add spacing between text
                      Expanded(
                        child: Text(
                          'Falcon 24',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  Row(
                   
                    children: [
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Text(
                          '456.67 M Lh',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01), // Add spacing between text
                      Expanded(
                        child: Text(
                          '2150.06.12',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  
                  
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.015),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.1,
              padding: EdgeInsets.all(screenWidth * 0.025),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Text(
                          'Earth to Mars',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01), // Add spacing between text
                      Expanded(
                        child: Text(
                          'Falcon 24',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  Row(
                   
                    children: [
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Text(
                          '456.67 M Lh',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01), // Add spacing between text
                      Expanded(
                        child: Text(
                          '2150.06.12',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  
                  
                ],
              ),
            )



          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 1) {
              Navigator.of(context).pushReplacement (
                  MaterialPageRoute(builder: (BuildContext context) => BookingPage()), // Navigate to BookingPage
              );
            } 
            else {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      )
    );
  }

    Widget _buildStackedButton(
      IconData icon, String label, Color color, double screenWidth) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle button click
              },
              style: ElevatedButton.styleFrom(
                primary: color,
                minimumSize: Size(screenWidth * 0.275, screenHeight * 0.1),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01,
                  vertical: screenHeight * 0.02,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: screenWidth * 0.07,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }


}
