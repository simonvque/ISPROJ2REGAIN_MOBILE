import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/green_zone/green_zone_page.dart';

class GreenzoneInvCard extends StatelessWidget {
  const GreenzoneInvCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), 
      child: SizedBox(
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
// First Card 
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GreenZonePage(),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(8.0), 
    child: Card(
      elevation: 2.0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding( 
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                  'assets/images/homepage/denr.png',
                  height: 60.0, 
                  width: 60.0,  
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
             
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0), 
                    child: Text(
                      "Get the Latest News",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: green600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0), 
                              child: SizedBox(
                                width: 150, 
                                child: Text(
                                  "Stay updated with the latest news. Visit the Green Zone now.",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 12.0, 
                                      ),
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
          ),
          // second Card 

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GreenZonePage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0), 
              child: Card(
                elevation: 2.0, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            'assets/images/homepage/pna.png',
                            height: 60.0, 
                            width: 60.0,  
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0), 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0), 
                              child: Text(
                                "Discover Green Zone",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: green600, 
                                    ),
                              ),
                            ),
              
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0), 
                              child: SizedBox(
                                width: 150, 
                                child: Text(
                                  "Explore the green initiatives around you. Get involved today.",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 12.0, 
                                      ),
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
          ),
          ]
        ),
        ),
        );
        }
        }