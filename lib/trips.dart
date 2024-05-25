import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart'; 
import 'app_bar.dart';

class TripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.green,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, 
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 229, 224, 224), 
                      Color.fromARGB(255, 240, 238, 238),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0, width: double.infinity),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: const Size(300, 50),
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'doplniť kredit',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Agrandir',
                                fontSize: 20,
                              ),
                              softWrap: true,
                              maxLines: 2,
                            ),
                            SizedBox(width: 104),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 19),

                      Container(
                        width: 300,
                        height: 150,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 4),
                        ),
                        child: Stack( // Použití Stack pro překrývání
                          children: [
                            Positioned.fill( // Naplní dostupný prostor v kontejneru
                              child: FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                widthFactor: 1,
                                heightFactor: 0.78,
                                child: Container(
                                  color: Colors.green,
                                  // Sem pridajte obsah alebo ďalšie kontajnery podľa potreby
                                ),
                              ),
                            ),
                            Positioned( // Umožní umístit obsah na konkrétní pozici
                              top: 5, // Začíná vrchu
                              right: 0, // Začíná zleva
                              left: 0, // Končí zprava
                              child: Container( // Kontejner pro čísla
                                height: 35, // Výška kontejneru
                                color: Colors.transparent, // Barva pozadí
                                child: ListView.builder( // Seznam pro čísla
                                  scrollDirection: Axis.horizontal, // Horizontální rolování
                                  itemCount: 1, // Počet čísel
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      width: 35, // Šířka kontejneru s číslem
                                      margin: EdgeInsets.symmetric(horizontal: 5), // Okraje
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green), // Ohraničení
                                        borderRadius: BorderRadius.circular(5), // Zaoblení
                                         color: Colors.white,
                                      ),
                                      child: Text(
                                        '${index + 1}', // Text s číslem
                                        style: TextStyle(
                                          fontSize: 16,  // Velikost písma
                                          fontWeight: FontWeight.bold,
                                          ), 
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
