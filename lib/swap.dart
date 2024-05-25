import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'bottom_navigation_bar.dart'; // Předpokládám, že vaše třída CustomBottomNavigationBar je v souboru bottom_navigation_bar.dart
import 'app_bar.dart'; // Předpokládám, že vaše třída CustomAppBar je v souboru app_bar.dart

class CustomDoplnok extends StatelessWidget {
  const CustomDoplnok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Použití vlastní AppBar třídy
      body: const HomePage(), // Volání HomePage zde
      bottomNavigationBar: CustomBottomNavigationBar(), // Použití vlastní BottomNavigationBar třídy
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> cardList = []; // List pro ukládání widgetů karet

  @override
  void initState() {
    super.initState();
    // Naplnění cardList widgety
    cardList = candidates.map((candidate) => ExampleCard(candidate)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.green, // Barva pozadí za kartami
            ),
            Column(
              children: [
                Flexible(
                  child: CardSwiper(
                    cardsCount: cardList.length, // Počet karet, které se mají zobrazovat v CardSwiper
                    numberOfCardsDisplayed: 3, // Kolik je vidět karet současně
                    padding: const EdgeInsets.all(0.0), // Padding (priestor)kolem karet
                    cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) => cardList[index], // Funkce pro vytváření jednotlivých karet
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------Začínají věci uvnitř karty
class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate; // Kandidát data model

  const ExampleCard(this.candidate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge, // Oříznutí přetékajícího obsahu
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)), // Zaoblení rohů
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Barva stínu s průhledností
            spreadRadius: 3, // Rozptyl stínu
            blurRadius: 7, // Rozmazání stínu
            offset: const Offset(0, 3), // Posun stínu
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: candidate.color, // Gradient barvy pozadí
              ),
            ),
            child: Image.network(candidate.imageUrl, fit: BoxFit.cover, width: double.infinity, height: double.infinity), // Obrázek na celé kartě
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white, // Barva bubliny
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Text(
                          candidate.name, // Jméno kandidáta
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Odstup mezi jménem a panáčky
                      for (int i = 0; i < 5; i++)
                        Icon(Icons.person, color: Colors.redAccent), // Ikona panáčka
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white, // Barva bubliny
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          candidate.job, // Pracovní pozice kandidáta
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white, // Barva bubliny
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          candidate.city, // Město kandidáta
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleCandidateModel {
  final String name;
  final String job;
  final String city;
  final List<Color> color;
  final String imageUrl; // URL obrázku kandidáta

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
    required this.imageUrl,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'One, 1',
    job: 'Developer',
    city: 'Areado',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    imageUrl: "https://www.tripsavvy.com/thmb/LTudD1VFIPILWGW5MoCsgBmhOGs=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/464741705-56a3c03d5f9b58b7d0d39809.jpg",
  ),
  ExampleCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'New York',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
    imageUrl: "https://www.tripsavvy.com/thmb/YGzlP0l5lE79cah0LdH8sSWe7EI=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-535240938-591c2d7b3df78cf5fa4919b5.jpg",
  ),
  ExampleCandidateModel(
    name: 'Three, 3',
    job: 'Engineer',
    city: 'London',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    imageUrl: "https://www.tripsavvy.com/thmb/5X29hRjFEbE-5IYT3PFk30kqMZ4=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-675923006-5a82469c3418c6003689af24.jpg",
  ),
  ExampleCandidateModel(
    name: 'Four, 4',
    job: 'Designer',
    city: 'Tokyo',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
    imageUrl: "https://www.tripsavvy.com/thmb/xbATyZ6fE8sMFYDrDXU7P1wnbgE=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-503908231-591be3103df78cf5fa000b74.jpg",
  ),
  ExampleCandidateModel(
    name: 'Mussorie',
    job: '',
    city: '',
    color: const [Color(0xFF000000), Color(0xFFFFFFFF)],
    imageUrl: "http://amazingindiablog.in/wp-content/uploads/2015/06/P5035083.jpg",
  ),
];
