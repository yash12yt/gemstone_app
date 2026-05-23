import 'package:flutter/material.dart';

class GemstoneDetailScreen extends StatelessWidget {
  final Map<String, String> gemstone;

  const GemstoneDetailScreen({super.key, required this.gemstone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(gemstone['name']!),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                // Hero animation
                child: Hero(
                  tag: gemstone['name']!,
                  child: ClipOval(
                    child: Image.asset(
                      gemstone['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.diamond, size: 80, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Text('Astrological Significance',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.public, color: Colors.orange),
              title: const Text('Associated Planet'),
              subtitle: Text(gemstone['planet']!),
            ),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.purple),
              title: const Text('Color & Vibration'),
              subtitle: Text(gemstone['color']!),
            ),

            const SizedBox(height: 20),

            const Text('Healing Effects & Benefits',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                  gemstone['effect']!,
                  style: const TextStyle(fontSize: 16, height: 1.5)
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text('This information is for educational purposes. Consult an expert before wearing any gemstone.')
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}