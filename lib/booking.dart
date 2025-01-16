import 'package:flutter/material.dart';
import 'package:flutter_app_testing/credit_cards_page.dart';
import 'main.dart';

class BookingPage extends StatefulWidget {
  final int initialSelectedOption;

  BookingPage({this.initialSelectedOption = 1});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _currentIndex = 1; // Set the index for the 'Book' tab as active
  int _activeIndex = 1; // Set the index for option within book'
  int _selectedOption = 1; // Track the selected option
  int _selectedPaymentMethod = 0;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelectedOption;
  }

  Widget buildButton(double screenWidth, double screenHeight, String title1, String title2, String subtitle1, String subtitle2) {
    return Center(
      child: SizedBox(
        height: screenHeight * 0.125,
        width: screenWidth * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Colors.white,
              width: 2,
            ),
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Handle button click
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Text(
                      title2,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Text(
                      subtitle2,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 40, 40),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'Book a tour',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.055, // Set the font size for the label
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        // App bar title
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement your notification action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.001),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.001),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _activeIndex = 0;
                      _selectedOption = 0;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _activeIndex == 0 ? Colors.white : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      'One-way',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _activeIndex = 1;
                      _selectedOption = 1;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _activeIndex == 1 ? Colors.white : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      'Return',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _activeIndex = 2;
                      _selectedOption = 2;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _activeIndex == 2 ? Colors.white : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      'Multi-planet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.025),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.92,
            height: 2,
            color: Colors.white,
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: _selectedOption == 1
                ? buildButton(screenWidth, screenHeight, 'From', '', 'Earth', 'Austin,Texas')
                : SizedBox(), // Hide the button for other options
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: _selectedOption == 1
                ? buildButton(screenWidth, screenHeight, 'To', '', 'Mars', 'Xerim,West')
                : SizedBox(), // Hide the button for other options
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: _selectedOption == 1
                ? buildButton(screenWidth, screenHeight, 'Departure', 'Arrival', '2150.06.12', '2150.08.23')
                : SizedBox(), // Hide the button for other options
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: _selectedOption == 1
                ? buildButton(screenWidth, screenHeight, 'Passenger', 'Class', '1 Adult,\n2 Children', 'Economy')
                : SizedBox(), // Hide the button for other options
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.05,
            child: _selectedOption == 1
                ? TextField(
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Promo code',
                      hintText: 'Enter promo code',
                    ),
                  )
                : SizedBox(), // Hide the text field for other options
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: _selectedOption == 1
                ? buildBookButton(screenWidth, screenHeight)
                : SizedBox(), // Hide the button for other options
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage(
                  title: "X'Teors",
                ),
              ),
            );
          } else {
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
    );
  }

  Widget buildBookButton(double screenWidth, double screenHeight) {
    return Center(
      child:SizedBox(
        height: screenHeight * 0.07,
        width: screenWidth * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Colors.pink,
              width: 2,
            ),
            primary: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
         onPressed: () {
          showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            context: context,
            builder: (context) =>
              Container(
                width: screenWidth,
                height: MediaQuery.of(context).size.height * 0.9,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Booking confirmation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.rocket,
                      color: Colors.grey,
                      size: screenWidth * 0.08,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            'From',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            'To',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
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
                            'Earth',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            'Moon',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ),
                        SizedBox(width: screenWidth * 0.03),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            'Distance',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            '108.5M KM',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
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
                            'Duration',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            '12 hours',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
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
                            'Spacecreaft',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            'Nova-56',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
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
                            'Passengers',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            '1 Adult, 2 children',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          
                        ),
                        SizedBox(width: screenWidth * 0.03),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            'Total price:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01), // Add spacing between text
                        Expanded(
                          child: Text(
                            '\$ 12.435M',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.075,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          
                        ),
                        SizedBox(width: screenWidth * 0.03),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            'Choose payment method:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        
                        SizedBox(width: screenWidth * 0.03),
                      ],
                    ),
                    
                    Column(
                      children: [
                        RadioListTile(
                          title: Text('Credit Card'),
                          value: 0,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('PayPal'),
                          value: 1,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Bitcoin'),
                          value: 2,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    ElevatedButton(
                    
                    onPressed: () {
                      // Handle confirm button click
                      Navigator.pop(context); // Close the bottom sheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditCardsPage()),
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            );
          },
        
          child: Text(
            'BOOK',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
