import './helper.dart';

void main() {
  String playerName = prompt('Enter your name: ');
  print('Welcome to the game, $playerName!');

  Player player = Player(10, playerName, 100);
  // int playerHealth = 100;
  // int playerStrength = 10;
  // String playerNameString = playerName;

  Monster monster = Monster(10, 'Dragon', 50);
  // int monsterHealth = 50;
  // int monsterStrength = 5;
  // String monsterName = 'Dragon';

  bool isRunning = true;

  print('Your opponent is ${monster.name}.');

  while (isRunning) {
    print('What do you want to do? (attack/heal)');

    String choice = prompt('> ');

    switch (choice.toLowerCase()) {
      case 'attack':
      case 'a':
        // int damage = player.strength + Random().nextInt(10);
        // monster.health -= damage;
        player.attack(monster);
        // print(
        //   '${player.name} attacked ${monster.name} and deals $damage damage!',
        // );
        // print('${player.name} has ${player.health} health points left.');
        // print('${monster.name} has ${monster.health} health points left.');

        break;
      case 'heal':
      case 'h':
        player.heal(10);
        // player.health += 10;
        // player.health = player.health > 100 ? 100 : player.health;
        // print('${player.name} healed 10 health points!');
        // print('${player.name} has ${player.health} health points left.');
        break;
      default:
        print('Invalid choice. Try again.');
    }

    if (!monster.isAlive()) {
      print('Congratulations, ${player.name}! You won!');
      isRunning = false;
    } else {
      monster.attack(player);
      // int damage = monster.strength + Random().nextInt(5);
      // player.health -= damage;
      // print(
      //   '${monster.name} attacked ${player.name} and deals $damage damage!',
      // );
      // print('${player.name} has ${player.health} health points left.');

      if (!player.isAlive()) {
        print('Sorry, ${player.name}. You lost.');
        isRunning = false;
      }
    }
  }

  print('Thanks for playing!');
}
