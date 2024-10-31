import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final Map<String, dynamic> chatData;
  final Function(String) onMessageSent;

  ChatDetailScreen({required this.chatData, required this.onMessageSent});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  // Liste des messages locale
  List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();
    // Initialisation de la liste des messages avec les données fournies
    messages = List<Map<String, String>>.from(widget.chatData['messages']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chatData['photo']),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatData['name']),
                Text(widget.chatData['status'],
                    style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.call, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return Align(
                  alignment: message['from'] == 'You'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: message['from'] == 'You'
                            ? Color.fromARGB(255, 13, 110, 253)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['message']!,
                            style: TextStyle(
                              color: message['from'] == 'You'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              message['time']!,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Zone de texte pour écrire un message
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,
                      color: Color.fromARGB(255, 13, 110, 253)),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      // Ajoute le message à la liste locale
                      setState(() {
                        messages.add({
                          'from': 'You',
                          'message': _messageController.text,
                          'time': _getCurrentTime(), // Ajoute l'heure actuelle
                        });
                      });

                      // Appelle la fonction onMessageSent pour effectuer d'autres actions si nécessaire
                      widget.onMessageSent(_messageController.text);
                      _messageController
                          .clear(); // Efface le champ de texte après envoi
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour obtenir l'heure actuelle au format HH:MM
  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }
}
