import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:hcmobile/screen/home/chat/discussions/chatlist.dart';

class Chatcontainer extends StatefulWidget {
  const Chatcontainer({super.key});

  @override
  State<Chatcontainer> createState() => _ChatcontainerState();
}

class _ChatcontainerState extends State<Chatcontainer> {
  final Color primaryColor = Color.fromARGB(255, 13, 110, 253);
  final UserController userController = Get.put(UserController());
  final List<Map<String, dynamic>> statusData = [
    {
      'name': 'Emily',
      'time': 'Today, 12:30 PM',
      'photo': 'assets/images/emily.jpg',
    },
    {
      'name': 'Nurul',
      'time': 'Today, 12:15 PM',
      'photo': 'assets/images/nurul.jpg',
    },
    {
      'name': 'Rico',
      'time': 'Today, 11:00 AM',
      'photo': 'assets/images/rico.jpg',
    },
    {
      'name': 'Ana',
      'time': 'Yesterday, 5:00 PM',
      'photo': 'assets/images/ana.jpg',
    },
  ];
  // List of tabs
  final List<String> tabs = [
    "Messages",
    "Appels",
    "Status",
  ];
  int selectedIndex = 0;

  Map<String, dynamic> chatData = {
    'Leader-nim': {
      'name': 'Leader-nim',
      'number': '123456789',
      'photo': 'assets/dochomme1.png',
      'lastMessage': 'Time is running!',
      'status': 'Online',
      'messages': [
        {
          'from': 'Leader-nim',
          'message': 'Where’s your report?',
          'time': '10:21 AM'
        },
        {
          'from': 'You',
          'message': 'I’ve already sent it to Sehun 😅',
          'time': '10:22 AM'
        },
        {
          'from': 'Leader-nim',
          'message': 'Sehun is seek man?',
          'time': '10:30 AM'
        },
      ],
    },
  };
  // Fonction pour ajouter une nouvelle discussion
  void addNewDiscussion(String name, String number, String photo) {
    setState(() {
      chatData[name] = {
        'name': name,
        'number': number,
        'photo': photo,
        'lastMessage': 'No messages yet',
        'status': 'Offline',
        'messages': [],
      };
    });
  }

  final List<Map<String, dynamic>> calls = [
    {'name': 'Emily', 'time': 'Today, 12:30 PM', 'type': 'incoming'},
    {'name': 'Nurul', 'time': 'Today, 12:30 PM', 'type': 'incoming'},
    {'name': 'Rico', 'time': 'Today, 12:30 PM', 'type': 'incoming'},
    {'name': 'Emily', 'time': 'Today, 12:30 PM', 'type': 'outgoing'},
    {'name': 'Ana', 'time': 'Today, 12:30 PM', 'type': 'missed'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> tabContents = [
      Container(
        child: Expanded(
          // Ajoute Expanded pour que ListView prenne la hauteur restante.
          child: ListView.builder(
            itemCount: chatData.keys.length,
            itemBuilder: (context, index) {
              String chatKey = chatData.keys.elementAt(index);
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chatData[chatKey]['photo']),
                ),
                title: Text(chatData[chatKey]['name']),
                subtitle: Text(chatData[chatKey]['lastMessage']),
                trailing: Text('1m'), // Tu peux ajuster pour rendre dynamique
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(
                        chatData: chatData[chatKey],
                        onMessageSent: (message) {
                          setState(() {
                            chatData[chatKey]['messages'].add({
                              'from': 'You',
                              'message': message,
                              'time': 'Now',
                            });
                            chatData[chatKey]['lastMessage'] = message;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      Container(
        child: Expanded(
          
          child: ListView.builder(
            itemCount: calls.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: calls[index]['type'] == 'incoming'
                      ? Colors.red
                      : Colors.green,
                  child: Icon(
                    calls[index]['type'] == 'incoming'
                        ? Icons.call_received
                        : Icons.call_made,
                    color: Colors.white,
                  ),
                ),
                title: Text(calls[index]['name']),
                subtitle: Text(calls[index]['time']),
                trailing: Icon(Icons.phone),
                onTap: () {
                  // Action lors du clic
                },
              );
            },
          ),
        ),
      ), // Contenu de l'onglet "Status"
      Container(
        child: Expanded(
          child: ListView.builder(
            itemCount: statusData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(statusData[index]['photo']),
                ),
                title: Text(statusData[index]['name']),
                subtitle: Text(statusData[index]['time']),
                onTap: () {
                  // Action lors du clic, par exemple, afficher les détails du statut
                },
              );
            },
          ),
        ),
      ),
    ];
    UserModel? user = userController.getUserModel();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: Center(
                child: Text(
                  "${user!.name!.substring(0, 1)}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text("Messagerie",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Chercher message',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity, // Prendre toute la largeur de l'écran
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 241, 241),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centrer la Row
                  children: [
                    SizedBox(width: 20),
                    ...List.generate(tabs.length, (index) {
                      return Row(
                        children: [
                          GestureDetector(
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
                                    color: selectedIndex == index
                                        ? Color.fromARGB(255, 13, 110, 253)
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Color.fromARGB(255, 13, 110, 253)
                                      : Colors.black,
                                  fontWeight: selectedIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          if (index < tabs.length - 1) SizedBox(width: 45),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(child: tabContents[selectedIndex]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     String newName = '';
          //     String newNumber = '';
          //     String newPhoto = 'assets/calme.png'; // Image par défaut
          //     return AlertDialog(
          //       title: Text('Add New Discussion'),
          //       content: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           TextField(
          //             decoration: InputDecoration(labelText: 'Name'),
          //             onChanged: (value) {
          //               newName = value;
          //             },
          //           ),
          //           TextField(
          //             decoration: InputDecoration(labelText: 'Number'),
          //             onChanged: (value) {
          //               newNumber = value;
          //             },
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         TextButton(
          //           child: Text('Cancel'),
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //         TextButton(
          //           child: Text('Add'),
          //           onPressed: () {
          //             // Ajoute une nouvelle discussion avec les infos fournies
          //             addNewDiscussion(newName, newNumber, newPhoto);
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // );
        },
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        child: Icon(Icons.add),
      ),
    );
  }
}
