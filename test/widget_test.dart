import 'package:curiosidadesanimalesmovil2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:curiosidadesanimalesmovil2/ui/components/animal_card.dart';

void main() {
  testWidgets('App bar title and AnimalCard widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app bar contains the expected title.
    expect(find.text('Curiosidades Animales'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the AnimalCard for a lion is displayed
    expect(find.text('Lion'), findsOneWidget); // Check for the animal's name
    expect(find.text('🦁'), findsOneWidget); // Check for the emoji
    // Optionally, you could add a test to check for the description as well.
    expect(find.text('The lion is a species in the family Felidae; it is a muscular, deep-chested cat with a short, rounded head, a reduced neck and round ears, and a hairy tuft at the end of its tail.'), findsOneWidget);
  });
}
