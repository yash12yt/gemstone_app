import 'assistant_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'gemstone_detail_screen.dart';
import 'recommendation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> gemstones = const [
    {'name': 'Ruby (Manik)', 'planet': 'Sun', 'color': 'Red', 'effect': 'Symbolizes energy, passion, and vitality', 'image': 'assets/ruby.png'},
    {'name': 'Pearl (Moti)', 'planet': 'Moon', 'color': 'White', 'effect': 'Brings peace, calmness, and emotional balance', 'image': 'assets/pearl.png'},
    {'name': 'Red Coral (Moonga)', 'planet': 'Mars', 'color': 'Red', 'effect': 'Provides courage, strength, and confidence', 'image': 'assets/coral.png'},
    {'name': 'Emerald (Panna)', 'planet': 'Mercury', 'color': 'Green', 'effect': 'Improves intellect, memory, and communication', 'image': 'assets/emerald.png'},
    {'name': 'Yellow Sapphire (Pukhraj)', 'planet': 'Jupiter', 'color': 'Yellow', 'effect': 'Brings wealth, prosperity, and wisdom', 'image': 'assets/yellowsapphire.png'},
    {'name': 'Diamond (Heera)', 'planet': 'Venus', 'color': 'Clear', 'effect': 'Enhances beauty, luxury, and artistic qualities', 'image': 'assets/diamond.png'},
    {'name': 'Blue Sapphire (Neelam)', 'planet': 'Saturn', 'color': 'Blue', 'effect': 'Enhances focus, discipline, and calmness', 'image': 'assets/bluesapphire.png'},
    {'name': 'Hessonite (Gomed)', 'planet': 'Rahu', 'color': 'Brown', 'effect': 'Protects from negative vibes and clears confusion', 'image': 'assets/hessonite.png'},
    {'name': 'Cat\'s Eye (Lehsuniya)', 'planet': 'Ketu', 'color': 'Grey', 'effect': 'Enhances intuition and spiritual awakening', 'image': 'assets/cats_eye.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemstones Dashboard'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.diamond, color: Colors.white, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Science of Gemstones',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person, color: Colors.blueAccent),
              title: Text('Developer'),
              subtitle: Text('Yash,Jitendra&Chirantan'),
            ),
            const ListTile(
              leading: Icon(Icons.school, color: Colors.orange),
              title: Text('College Project'),
              subtitle: Text('Minor  Project'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.info_outline, color: Colors.purple),
              title: Text('About App'),
              subtitle: Text(
                  'A complete guide to gemstones and their healing effects.'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.psychology, color: Colors.green),
              title: const Text('Ask AI Assistant'),
              subtitle: const Text('Smart Gemstone Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssistantScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: gemstones.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListTile(
              leading: Hero(
                tag: gemstones[index]['name']!,
                child: ClipOval(
                  child: Image.asset(
                    gemstones[index]['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.diamond, color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(gemstones[index]['name']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(
                  'Planet: ${gemstones[index]['planet']!}\nEffect: ${gemstones[index]['effect']!}'),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.blueAccent, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GemstoneDetailScreen(
                      gemstone: gemstones[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RecommendationScreen()),
          );
        },
        icon: const Icon(Icons.auto_awesome, color: Colors.white),
        label: const Text('My Gemstone', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}