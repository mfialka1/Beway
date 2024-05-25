import 'package:flutter/material.dart';
//moje veci swap body: Stack(alignment: Alignment.center, children: cardList),

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Nastavenia(),
    );
  }
}

class Nastavenia extends StatefulWidget {
  const Nastavenia({super.key});

  @override
  _NastaveniaState createState() => _NastaveniaState();
}

class _NastaveniaState extends State<Nastavenia> {
  double sliderValue = 48; // Definícia sliderValue ako členskej premennej

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.green,
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0), // Začiatok riadka
                child: Text(
                  "Travi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Zmenšený font
                    fontFamily: 'Poppins', // Nastavený font Poppins
                  ),
                ),
              ),
              const Spacer(), // Vytvára priestor medzi textom a ikonami
              IconButton(
                onPressed: () {
                   // Funkcia pre ikonu vyhľadavanie
                },
                icon: const Icon(
                  Icons.search, // Ikona hamburger menu
                  color: Colors.white, // Biela farba ikony
                  size: 32, // Zväčšená veľkosť ikony
                ),
              ),
             IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.5), // Čierna priesvitná farba
          content: const Text("Obsah okna"), // Obsah okna (môžete pridať vlastný widget)
          // Tu môžete pridať ďalšie tlačidlá alebo akcie
        );
      },
    );
  },
  icon: const Icon(
    Icons.menu, // Ikona vyhľadávania
    color: Colors.white, // Biela farba ikony
    size: 32, // Zväčšená veľkosť ikony
  ),
),

            ],
          ),
        ),
      
      backgroundColor: Colors.green,        //pozadie pozadie(uplne)


      body: SingleChildScrollView(            //bude sa dat scrolovat body + začina tu body
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 229, 224, 224),  //pozadie body
                Color.fromARGB(255, 240, 238, 238),
              ],
            ),
            borderRadius: BorderRadius.only(     //zaoblenie rohov stredneho containera
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,       //nastavenie na stred stlpec v containeri
              children: [
                const SizedBox(height: 10.0, width: double.infinity), //sirka ako hlavny body container a nastavenie vysky
                GestureDetector(
                  behavior: HitTestBehavior.opaque,             //zachytavaie dotykových oblasti//slider
                  onTap: () {},
                  child: ElevatedButton(
                    onPressed: () {},          //predpirprava slidera na kompatibilitu s mapamy
                    style: ElevatedButton.styleFrom(          //stýl prvého celeneho containera v hlavnom containeri
                      backgroundColor: Colors.green,
                      fixedSize: const Size(300, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, //rozmiestnenie ostatých widgetov v stlpci rovnomerne
                      crossAxisAlignment: CrossAxisAlignment.end,        //ze widgety/tlačidla budu po celej sirke hlavneho containera
                      children: [
                        const SizedBox(height: 8),    //medzera vo widgete hore/kvoli textu
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(     //stýl textu a toho containera
                              width: 90,
                              height: 50,
                              color: Colors.green,
                              child: const Center(
                                child: Text(
                                  'vzdialenosť vyhľadavania',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'The Seasons',
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.visible,   //zabezpečuje to ze ked sa zmeni dlzka textu kôli prekladu tak ho bude stále vidno
                                ),
                              ),
                            ),
                            Container(           //stíl textu praveho containera
                              width: 60,
                              height: 25,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  '${sliderValue.round()} Km',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'The Seasons',
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Slider(           //slider
                            value: sliderValue,
                            min: 0.1,
                            max: 300,
                            onChanged: (double value) {
                              setState(() {
                                sliderValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),  //medzera medzi druhym a prvým tlačidlom
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(    //stýl druheo tlačidla
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
                      SizedBox(width: 10),   //medzera medzi prvou ikonou a druhou ikonou
                      Text(                //stýl textu
                        'doplniť kredit',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Agrandir',
                          fontSize: 20,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                      SizedBox(width: 104),   //medzera medzi druhou a tretou ikonou
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 19),  // medziera medzi druhym a tretim containerom
                SizedBox(             //velkost containeru
                  width: 300,  
                  height: 310, 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, //prve tlačidlo z vrchu
                    //mainAxisSize: MainAxisSize.min,  //presne stanovena vyska kontainera aka je potrebana, dobre ked sa bude skrolovat pri viac tlačidiel
                    children: [
                      Container(           //biela čiara nad tlačidlom
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const Divider(  //biela čiara
                        color: Colors.white,
                        thickness: 3, //vyska bielej ciary medzi tlačidlami v containeri
                        height: 0,    //neviem, nechat
                      ),

                      Flexible(
                        fit: FlexFit.loose,   //mal by sa prisposobobat velkost widgetov na zaklade velkosti textu v nom(keby presahoval text tak by sa zväčil widget)
                        child: ElevatedButton(
                          onPressed: () {
                          
                          },
                          style: ElevatedButton.styleFrom(   //stýl widgetu(celeho talčidla)
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(      //vsetko čo je v riadku toho widgetu
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.translate,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 40,
                                    maxWidth: 150,
                                  ),
                                  child: const Text(
                                    'jazyk',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Agrandir',
                                      fontSize: 18,
                                    ),
                                    softWrap: true,   //text sa zalomi
                                    maxLines: 2, //max 2 riadky
                                    overflow: TextOverflow.ellipsis, //ak by text presiahol dostupny priestok tak na konci bude ...
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),  //medzera a ptm ikona
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 3,
                        height: 0,
                      ),

                      Flexible(
                        fit: FlexFit.loose,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.article_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 40,
                                    maxWidth: 150,
                                  ),
                                  child: const Text(
                                    'informacie o krajinách',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Agrandir',
                                      fontSize: 18,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 3,
                        height: 0,
                      ),

                      Flexible(
                        fit: FlexFit.loose,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 40,
                                    maxWidth: 150,
                                  ),
                                  child: const Text(
                                    'čoskoro',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Agrandir',
                                      fontSize: 18,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Divider(
                        color: Colors.white,
                        thickness: 3,
                        height: 0,
                      ),

                      Flexible(
                        fit: FlexFit.loose,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 40,
                                    maxWidth: 150,
                                  ),
                                  child: const Text(
                                    'čoskoro',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Agrandir',
                                      fontSize: 18,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      //koniec zatvorky od tačidla
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),



      bottomNavigationBar: BottomAppBar(    //spodna časť
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 2,
              color: Colors.green,
              width: double.infinity, // Rozšíriť na celú šírku obrazovky
            ),
            SizedBox(
              height: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.double_arrow, size: 40, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.checklist_rtl, size: 40, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.map, size: 40, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, size: 40, color: Colors.black),
                    onPressed: () {},
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
