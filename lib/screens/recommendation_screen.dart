import 'package:flutter/material.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  String? selectedZodiac;
  Map<String, String>? recommendedGem;

  // Rashi (Zodiac Signs) chi list
  final List<String> zodiacSigns = [
    'Aries (Mesh)', 'Taurus (Vrishabha)', 'Gemini (Mithun)', 'Cancer (Kark)',
    'Leo (Singh)', 'Virgo (Kanya)', 'Libra (Tula)', 'Scorpio (Vrishchik)',
    'Sagittarius (Dhanu)', 'Capricorn (Makar)', 'Aquarius (Kumbh)', 'Pisces (Meen)'
  ];

  // Zodiac pramane Gemstone find karnyachi logic (Image add kely ahet)
  void getRecommendation() {
    if (selectedZodiac == null) return;

    Map<String, String> gem = {};
    if (selectedZodiac!.contains('Aries') || selectedZodiac!.contains('Scorpio')) {
      gem = {'name': 'Red Coral (Moonga)', 'color': 'Red', 'effect': 'Provides courage, strength, and confidence', 'image': 'assets/coral.png'};
    } else if (selectedZodiac!.contains('Taurus') || selectedZodiac!.contains('Libra')) {
      gem = {'name': 'Diamond (Heera)', 'color': 'Clear', 'effect': 'Enhances beauty, luxury, and artistic qualities', 'image': 'assets/diamond.png'};
    } else if (selectedZodiac!.contains('Gemini') || selectedZodiac!.contains('Virgo')) {
      gem = {'name': 'Emerald (Panna)', 'color': 'Green', 'effect': 'Improves intellect, memory, and communication', 'image': 'assets/emerald.png'};
    } else if (selectedZodiac!.contains('Cancer')) {
      gem = {'name': 'Pearl (Moti)', 'color': 'White', 'effect': 'Brings peace, calmness, and emotional balance', 'image': 'assets/pearl.png'};
    } else if (selectedZodiac!.contains('Leo')) {
      gem = {'name': 'Ruby (Manik)', 'color': 'Red', 'effect': 'Symbolizes energy, passion, and vitality', 'image': 'assets/ruby.png'};
    } else if (selectedZodiac!.contains('Sagittarius') || selectedZodiac!.contains('Pisces')) {
      gem = {'name': 'Yellow Sapphire (Pukhraj)', 'color': 'Yellow', 'effect': 'Brings wealth, prosperity, and wisdom', 'image': 'assets/yellowsapphire.png'};
    } else if (selectedZodiac!.contains('Capricorn') || selectedZodiac!.contains('Aquarius')) {
      gem = {'name': 'Blue Sapphire (Neelam)', 'color': 'Blue', 'effect': 'Enhances focus, discipline, and calmness', 'image': 'assets/bluesapphire.png'};
    }

    setState(() {
      recommendedGem = gem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Gemstone'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your Zodiac Sign:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Dropdown Menu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Choose here...'),
                  value: selectedZodiac,
                  items: zodiacSigns.map((String sign) {
                    return DropdownMenuItem<String>(
                      value: sign,
                      child: Text(sign),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedZodiac = newValue;
                      recommendedGem = null; // reset previous recommendation
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Get Recommendation Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: getRecommendation,
                child: const Text('Get Recommendation', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),

            const SizedBox(height: 40),

            // Result Card (jar suggestion aala asel tar dakhvne)
            if (recommendedGem != null)
              Card(
                color: Colors.blue.shade50,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Ithe star icon kadhun aapan aapla photo takla ahe
                      ClipOval(
                        child: Image.asset(
                          recommendedGem!['image']!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.diamond, size: 60, color: Colors.blueAccent),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Recommended for you:',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        recommendedGem!['name']!,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      ),
                      const Divider(),
                      Text(
                        recommendedGem!['effect']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}