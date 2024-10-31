import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {

  int selectedIndex = 0;


  final List<String> tabs = ["About", "Dossier", "Schedul", "Schedul", "Schedul", "Schedul", "Schedul"];

  final List<Widget> tabContents = [
    Text('This is About section'),
    Text('This is Dossier section'),
    Text('This is Schedul section'),
    Text('This is Schedul section'),
    Text('This is Schedul section'),
    Text('This is Schedul section'),
    Text('This is Schedul section'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Tab View'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                  
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedIndex == index ? Color.fromARGB(255, 13, 110, 253) : Colors.transparent, 
                          ),
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedIndex == index ? Color.fromARGB(255, 13, 110, 253) : Colors.black, 
                          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
        
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: tabContents[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: CustomTabView(),
//   ));
// }
