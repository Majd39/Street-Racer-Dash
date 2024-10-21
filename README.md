# Street-Racer-Dash


---

# 🚗 Flutter 2D Racing Game

A simple yet engaging **2D Racing Game** built using Flutter and Dart! The game features a player-controlled car racing on a road while avoiding enemy cars that drop randomly. The background road scrolls automatically to simulate movement.

## 🎮 Features

- **Tap-to-Change Lane:** Players can switch the lane of the car by tapping the screen.
- **Randomly Dropped Enemy Cars:** Enemy cars drop randomly from the top, adding challenge to the gameplay.
- **Auto-Scrolling Background:** The road scrolls automatically to simulate motion.
- **Game Over and Restart:** If the player collides with an enemy car, the game shows a **Game Over** message with a restart option.

## 📸 Screenshots

_Add screenshots of your game in action here._

## 🛠 Technologies Used

- **Flutter**: For building the UI and managing state.
- **Dart**: The programming language for Flutter.
  
## 🚀 Getting Started

To run the game locally on your machine:

### Prerequisites

1. Install **Flutter** and **Dart** on your machine.
   - Follow the Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

2. Clone this repository:
   ```bash
   git clone https://github.com/Majd39/Street-Racer-Dash.git
   ```

3. Navigate to the project directory:
   ```bash
   cd Street-Racer-Dash
   ```

4. Install the required dependencies:
   ```bash
   flutter pub get
   ```

5. Run the game:
   ```bash
   flutter run
   ```

### Project Structure

```bash
lib/
├── main.dart               # Main entry point for the app
├── view/
│   └── car.dart            # The game logic and UI for the racing game
assets/
├── car.png                 # Player's car image
├── enemycar.png            # Enemy car image
└── street.jpg              # Background road image
```

## 📂 Explanation

- The **Car** class contains the core game logic.
- **Random enemy cars** are generated periodically and drop from the top of the screen.
- The **player car** can change lanes when the screen is tapped.
- If the player's car collides with an enemy car, the **Game Over** screen is displayed, with an option to restart.

## 💡 How the Game Works

- The game starts when the user opens the app.
- Tap the screen to switch lanes and avoid collisions with enemy cars.
- The background road scrolls continuously to create a racing effect.
- Enemy cars drop from random lanes, increasing the difficulty of the game.
- If the player's car collides with an enemy, the game shows a **Game Over** message, and players can restart.

## 🔥 Future Improvements

- Add sound effects and background music for a more immersive experience.
- Introduce multiple levels with increasing difficulty.
- Add power-ups or bonuses to make the gameplay more dynamic.

## 🙏 Acknowledgments

- Thanks to the Flutter community for the great tutorials and resources.

## 🛠 Contributions

Feel free to fork this project and submit pull requests for improvements!


---
![Screenshot_1729542421](https://github.com/user-attachments/assets/568510c6-5046-4dd5-b779-8732dea0a9a2)

