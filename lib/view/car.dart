import 'dart:math'; // Import the dart math library to generate random values.

import 'package:flutter/material.dart'; // Import the Flutter Material package for UI components.

class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<StatefulWidget> createState() => _CarState(); // Create the state of the car widget.
}

class _CarState extends State<Car> {
  // Game states
  bool positione = true; // This determines the car's position (left or right).
  bool activGame = true; // Boolean to check if the game is active or not.

  // Scroll controller to auto-scroll the background (road).
  ScrollController automaticScroll = ScrollController(); 

  Random random = Random(); // Random generator for dropping enemy cars at random positions.
  List<Offset> cars = []; // List to keep track of enemy car positions.

  // Function to drop enemy cars from the top at random intervals.
  dropingCars() {
    Future.delayed(const Duration(seconds: 3), () {
      if (activGame) {
        setState(() {
          // Randomly drop cars either on the left or right lane.
          double startX =
              random.nextBool() ? 0 : MediaQuery.of(context).size.width - 290;
          cars.add(Offset(startX, 0)); // Add new car position to the list.
        });
      }
      dropingCars(); // Recursive call to keep dropping cars.
    });
  }

  // Function to scroll the background road automatically.
  scrollAutomatic() {
    if (automaticScroll.hasClients && automaticScroll.offset < automaticScroll.position.maxScrollExtent) {
      setState(() {
        automaticScroll.jumpTo(automaticScroll.position.pixels + 20); // Scroll the background slightly.
      });
    } else {
      setState(() {
        automaticScroll.jumpTo(automaticScroll.position.minScrollExtent); // Reset the scroll when reaching the bottom.
      });
    }
  }

  // Function to update enemy car positions and check for collisions.
  updatCars() {
    scrollAutomatic(); // Keep scrolling the road.
    setState(() {
      for (var i = 0; i < cars.length; i++) {
        cars[i] = Offset(cars[i].dx, cars[i].dy + 10); // Move the enemy cars down.

        // Check if the player's car collides with an enemy car.
        if ((cars[i].dx == 0 &&
                cars[i].dy >= MediaQuery.of(context).size.height - 400 &&
                positione == true) ||
            (cars[i].dx == MediaQuery.of(context).size.width - 290 &&
                cars[i].dy >= MediaQuery.of(context).size.height - 400 &&
                positione == false)) {
          activGame = false; // End the game if there's a collision.
          break;
        } else if (cars[i].dy > MediaQuery.of(context).size.height) {
          cars.removeAt(i); // Remove the car when it goes out of the screen.
          break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    dropingCars(); // Start dropping enemy cars when the game starts.
  }

  @override
  Widget build(BuildContext context) {
    // Continuously update the cars' positions while the game is active.
    WidgetsBinding.instance.addPostFrameCallback((c) {
      if (activGame) {
        updatCars();
      }
    });

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            // Change the car's lane when the user taps the screen.
            if (activGame) {
              positione = !positione;
            }
          });
        },
        child: Stack(children: [
          // Background road scrolling.
          ListView.builder(
            reverse: true,
            controller: automaticScroll,
            itemCount: 10,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 1000,
                child: Image.asset(
                  "assets/street.jpg",
                  fit: BoxFit.fill, // Display the road image to fill the screen.
                ),
              );
            },
          ),

          // Displaying the player's car and enemy cars.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                // Display enemy cars in the game.
                ...cars.map((car) {
                  return Positioned(
                    top: car.dy,
                    left: car.dx,
                    child: Image.asset(height: 250, width: 250, "assets/enemycar.png"),
                  );
                }),
                // Display the player's car on the screen.
                Align(
                  alignment: positione == true
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: Image.asset(height: 250, width: 250, "assets/car.png"),
                ),
                // Show Game Over and Restart options when the game is over.
                if (!activGame)
                  Center(
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.grey.shade900.withOpacity(0.5),
                      child: Column(
                        children: [
                          const Text(
                            "Game Over !", // Game over message.
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          MaterialButton(
                            onPressed: () {
                              // Restart the game when the user clicks the button.
                              activGame = true;
                              cars.clear();
                              setState(() {});
                            },
                            child: const Text(
                              "Restart :)", // Button to restart the game.
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

