import 'package:flutter/material.dart';

// Fonction qui renvoie un widget de notification personnalisé
Widget customNotification({
  required String titre,
  required String message,
  required Color couleurFond,
  required IconData icone,
  required Color couleurIcone,
  required Function()? onClose,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: couleurFond,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icône à gauche
        CircleAvatar(
          radius: 20,
          backgroundColor: couleurIcone.withOpacity(0.1),
          child: Icon(icone, color: couleurIcone),
        ),
        const SizedBox(width: 16),
        // Titre et message
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titre,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Bouton de fermeture
        GestureDetector(
          onTap: onClose,
          child: Icon(Icons.close, color: Colors.grey),
        ),
      ],
    ),
  );
}

// Exemple d'utilisation de la fonction dans un Scaffold
class NotificationExamplePage extends StatefulWidget {
  @override
  State<NotificationExamplePage> createState() =>
      _NotificationExamplePageState();
}

class _NotificationExamplePageState extends State<NotificationExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEFF4FC),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search notification',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16, top: 8), // Ajout d'un léger padding en haut
        child: Column(
          children: [
            Expanded(
              // Utilisation d'Expanded pour permettre aux notifications de prendre l'espace disponible
              child: ListView(
                children: [
                  customNotification(
                    titre: "Paiement Reçu !",
                    message:
                        "Votre paiement a été reçu avec succès. Vous avez maintenant accès aux services premium.",
                    couleurFond: Colors.green.shade50,
                    icone: Icons.check_circle,
                    couleurIcone: Colors.green,
                    onClose: () {
                      print("Notification de paiement fermée");
                    },
                  ),
                  customNotification(
                    titre: "Échec de connexion à la base de données",
                    message:
                        "Nous rencontrons des problèmes pour nous connecter à la base de données du système.",
                    couleurFond: Colors.red.shade50,
                    icone: Icons.error,
                    couleurIcone: Colors.red,
                    onClose: () {
                      print("Notification d'erreur fermée");
                    },
                  ),
                  customNotification(
                    titre: "Nouvelle politique de confidentialité",
                    message:
                        "Nous avons mis à jour notre politique de confidentialité pour une meilleure protection de vos informations personnelles.",
                    couleurFond: Colors.blue.shade50,
                    icone: Icons.info,
                    couleurIcone: Colors.blue,
                    onClose: () {
                      print("Notification d'info fermée");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
