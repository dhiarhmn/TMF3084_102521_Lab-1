import 'dart:io';

void main() {
  bool ordering = true;

  print("=================================");
  print("   PIZZA ORDER CALCULATOR        ");
  print("=================================");
  print("Prices:");
  print(" - Small (S)  = \$5 USD");
  print(" - Medium (M) = \$7 USD");
  print(" - Large (L)  = \$10 USD");
  print("---------------------------------\n");

  while (ordering) {
    // 3. Ask user for pizza size
    stdout.write("Enter pizza size (S, M, L) or type 'exit' to quit: ");
    String? size = stdin.readLineSync()?.trim().toUpperCase();

    if (size == 'EXIT') {
      print("\nThank you for ordering! Goodbye.");
      break;
    }

    double pricePerUnit = 0;

    // 4. Use a switch statement to calculate price
    switch (size) {
      case 'S':
        pricePerUnit = 5.0;
        break;
      case 'M':
        pricePerUnit = 7.0;
        break;
      case 'L':
        pricePerUnit = 10.0;
        break;
      default:
        print("Invalid size entered. Please choose S, M, or L.\n");
        continue; // Restarts the loop for valid input (Requirement 5)
    }

    // Ask user for quantity
    stdout.write("Enter quantity: ");
    String? qtyInput = stdin.readLineSync();
    int? quantity = int.tryParse(qtyInput ?? '');

    if (quantity == null || quantity <= 0) {
      print("Invalid quantity. Please enter a valid number greater than 0.\n");
      continue;
    }

    // Calculate total payment
    double totalPayment = pricePerUnit * quantity;
    print("---------------------------------");
    print("-> Total Payment = \$${totalPayment.toStringAsFixed(2)} USD");
    print("---------------------------------\n");

    // Ask if they want to order more (Continuous ordering via while loop)
    stdout.write("Would you like to place another order? (y/n): ");
    String? continueChoice = stdin.readLineSync()?.trim().toLowerCase();
    if (continueChoice != 'y') {
      print("\nThank you for ordering! Goodbye.");
      ordering = false;
    }
    print("");
  }
}