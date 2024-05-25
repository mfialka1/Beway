import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'country.dart';
import 'about_app.dart';

// Trieda obsahujúca metódy pre prácu so sliderom a ukladaním hodnôt do zdieľaných preferencií
class OtherClass {
  void someMethod(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NastaveniaDialog();
      },
    ).then((value) {
      if (value != null) {
        print('Slider value updated in OtherClass: $value'); // Vypíše aktualizovanú hodnotu slidera
        saveSliderValue(value);
      } else {
        print('Slider value not updated in OtherClass'); // Vypíše, že hodnota slidera nebola aktualizovaná
      }
    });
  }

   // Metóda pre uloženie hodnoty slidera do zdieľaných preferencií
  Future<void> saveSliderValue(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('sliderValue', value);  // Uloží hodnotu slidera pod kľúčom 'sliderValue'
  }
  
  // Metóda pre načítanie hodnoty slidera zo zdieľaných preferencií
  Future<double> getSliderValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('sliderValue') ?? 0.1;  // Vráti uloženú hodnotu slidera, ak neexistuje, vráti predvolenú hodnotu 0.1
  }
}

// Trieda pre dialóg s nastaveniami
class NastaveniaDialog extends StatefulWidget {
  const NastaveniaDialog({super.key});

  @override
  _NastaveniaDialogState createState() => _NastaveniaDialogState();
}

class _NastaveniaDialogState extends State<NastaveniaDialog> {
  double sliderValue = 0.1;

  @override
  void initState() {
    super.initState();     // Volá metódu initState z nadradenej triedy, ktorá inicializuje stav widgetu.
    loadSliderValue();    // Načíta hodnotu slidera pri inicializácii
  }

  Future<void> loadSliderValue() async {
    double value = await OtherClass().getSliderValue();
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Expanded(
              flex: 25,   //25% plochy zabera tmava čast
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(),  // Prázdny kontajner v ľavom stĺpci
              ),
            ),
            //tu začina prava čast, nastavenia
            Expanded(
              flex: 65,  //65% plochy zabera prava čast
              child: Container(
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // zarovna pod widgety na celích 65%, aby som pracoval s celou tou plochou
                  children: [
                  
                    AppBar(
                      backgroundColor: Colors.green,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      title: const Padding(
                        padding: EdgeInsets.only(left: 16.0), //vnutorne oddelenie z lava
                        child: Text(
                          "Nastavenia",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context, sliderValue);
                          },
                        ),
                      ],
                    ),

                    //telo
                    Expanded( //definujeme hlavny container
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 250, 248, 248),
                                Color.fromARGB(255, 241, 237, 237),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          //do hlavneho containera zaciname vkladat pod containeri
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),  //medzere medzi vrchom tela a nastavenia cestovia
                              const SizedBox(
                                width: 240,
                                height: 16,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Nastavenia cestovania',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 187, 187, 187),
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15), //medzera medzi textom a prvým tlačidlom

                              ElevatedButton(
                                onPressed: () {},   //akcia po stlaceni tlačidla
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  fixedSize: const Size(240, 90),  //velkost tlačidla
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12), //zaoblenie
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start, // Zarovnanie obsahu do horného okraja
                                  crossAxisAlignment: CrossAxisAlignment.end, // Zarovnanie obsahu do pravého okraja
                                  children: [
                                    const SizedBox(height: 5),  // verikálna medzera nad prvým riadkom
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Rozmiestnenie prvkov rovnomerne medzi sebou
                                      children: [ 
                                        Container(   //mini container
                                          width: 80,
                                          height: 35,
                                          color: Colors.transparent,  // Transparentné pozadie kontajnera
                                          child: const Center(
                                            child: Text(
                                              'vzdialenosť vyhľadavania',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Agrandir',
                                                fontSize: 10,
                                              ),
                                              overflow: TextOverflow.visible, // Ak je text dlhší, nechaj ho prekročiť hranice kontajnera
                                            ),
                                          ),
                                        ),
                                        Container(   //druhy mini container
                                          width: 80,
                                          height: 25,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text(
                                              '${sliderValue.round()} Km', // Text zobrazujúci aktuálnu hodnotu slidera
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Agrandir',
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(  //aby slider bol zobrazený s maximalnou dostupnou šírkou
                                      child: Slider(
                                        value: sliderValue, // Aktuálna hodnota slidera
                                        min: 0.1,
                                        max: 300,
                                        onChanged: (double newvalue) {
                                          setState(() {
                                            sliderValue = newvalue; // Aktualizuje hodnotu slidera pri posúvaní
                                          });
                                        },
                                        activeColor: Colors.blueGrey, // Farba aktívnej časti slidera
                                        inactiveColor: Colors.white, // Farba neaktívnej časti slidera
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               
                              const SizedBox(height: 18), //medzera medzi prvým tlačidlom a druhym

                              ElevatedButton(   //druhe tlačidlo
                                onPressed: () {
                                Navigator.push(  // Navigujte na KrajinyPage po kliknutí na tlačidlo
                                             context,
                                             MaterialPageRoute(builder: (context) => const CountryPage()),
                                );
                              },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Farba pozadia tlačidla
                                  padding: const EdgeInsets.all(8),   // Odsadenie vnútorného obsahu tlačidla
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(240, 50),  // Fixná veľkosť tlačidla
                                ),
                                child: Row(  // Riadok obsahujúci ikonu, text a šípku vpravo od textu
                                  mainAxisAlignment: MainAxisAlignment.start, // Zarovnanie obsahu doľava
                                  children: [
                                    const Icon( //prva ikona
                                      Icons.article_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),//medzera medzi ikonou a textom
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
                                            fontSize: 15,
                                          ),
                                          softWrap: true,  // Povolenie zalamovania textu
                                          maxLines: 2,     // Maximálny počet riadkov textu
                                          overflow: TextOverflow.ellipsis, // Ak je text príliš dlhý, zobrazí sa '...'
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10), //minimalna medzera medzi ikonou a textom z prava
                                    const Icon(  //prava ikona
                                      Icons.chevron_right_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),

                                  const SizedBox(height: 25),  //medzera medzi celím tlačidlom druhým a textom 

                              const SizedBox(
                                       width: 240,
                                       height: 20,
                                       child: Align(
                                       alignment: Alignment.bottomLeft, //umiestneni v lavo dole
                                       child: Text(
                                      'Nastavenia aplikácie',
                                       style: TextStyle(
                                       color: Color.fromARGB(255, 187, 187, 187),
                                       fontFamily: 'Poppins',
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold, // Tu pridávam hrúbku textu
                                       ),
                                       softWrap: true,  //zalamovanie text
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,// Ak je text príliš dlhý, zobrazí sa '...'
                                     ), 
                                    ),
                                  ),

                              const SizedBox(height: 10),  //medzera medzi textom a dalsim tlačidlom

                               ElevatedButton(
                                      onPressed: () {
                                      Navigator.push( // Navigujte na KrajinyPage po kliknutí na tlačidlo
                                      context,
                                      MaterialPageRoute(builder: (context) => const About_app_Page ()),
                                      );
                                    },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 234, 234, 234),
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(240, 40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.info,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          maxWidth: 150,
                                        ),
                                        child: const Text(
                                          'O aplikacií',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Agrandir',
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ), 
                              const SizedBox(height: 8),
                               ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 234, 234, 234),
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(240, 40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.translate,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          maxWidth: 150,
                                        ),
                                        child: const Text(
                                          'Jazyk',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Agrandir',
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ), 
                          
                               const SizedBox(height: 8), //medzera medzi tlačidlami

                               ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 234, 234, 234),
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(240, 40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          maxWidth: 150,
                                        ),
                                        child: const Text(
                                          'Notifikácie',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Agrandir',
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),

                                 const SizedBox(height: 18), //medzera mezi tlačidlom a textom

                                       const SizedBox(
                                       width: 240,
                                       height: 16,
                                       child: Align(
                                       alignment: Alignment.bottomLeft,
                                       child: Text(
                                      'Informácie',
                                       style: TextStyle(
                                       color: Color.fromARGB(255, 187, 187, 187),
                                       fontFamily: 'Poppins',
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold, // Tu pridávam hrúbku textu
                                       ),
                                       softWrap: true,
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                    ),
                                  ),

                                 const SizedBox(height: 10),

                               ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 234, 234, 234),
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(240, 40),  //nastave ie širky a výsky containera
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          maxWidth: 150,
                                        ),
                                        child: const Text(
                                          'Podmienky používania',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Agrandir',
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),  //na konci medzera
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
