import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_kuis/main.dart';

void main() {
  testWidgets('LoginScreen validates credentials and shows appropriate Snackbars', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonApp());

    // Memastikan elemen Login muncul
    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));

    // 1. Coba login dengan password salah
    await tester.enterText(find.byType(TextField).at(0), 'alfin');
    await tester.enterText(find.byType(TextField).at(1), 'salah');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Memastikan snackbar login gagal muncul
    expect(find.text('Login gagal! Periksa username dan password Anda.'), findsOneWidget);

    // 2. Login dengan username dan password yang benar (NIM 124240183)
    await tester.enterText(find.byType(TextField).at(1), '124240183');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Memastikan snackbar login berhasil muncul
    expect(find.text('Login berhasil! Selamat datang, alfin.'), findsOneWidget);

    await tester.pumpAndSettle();

    // Memastikan berada di Halaman Beranda (Pokemon List)
    expect(find.text('Pokemon App'), findsOneWidget);
    expect(find.text('Bulbasaur'), findsOneWidget);
    expect(find.text('Ivysaur'), findsOneWidget);
  });

  testWidgets('Navigation to Pokemon detail and back to home works properly', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonApp());

    // Login
    await tester.enterText(find.byType(TextField).at(0), 'alfin');
    await tester.enterText(find.byType(TextField).at(1), '124240183');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Klik Bulbasaur
    await tester.tap(find.text('Bulbasaur'));
    await tester.pumpAndSettle();

    // Memastikan di halaman detail
    expect(find.text('Detail: Bulbasaur'), findsOneWidget);
    expect(find.text('Attributes'), findsOneWidget);
    expect(find.text('Overgrow'), findsOneWidget);

    // Klik tombol Kembali
    await tester.tap(find.widgetWithText(ElevatedButton, 'Kembali'));
    await tester.pumpAndSettle();

    // Memastikan kembali ke Pokemon App
    expect(find.text('Pokemon App'), findsOneWidget);
  });

  testWidgets('Bottom navigation to Profile tab displays username, oath, and avatar controls', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonApp());

    // Login
    await tester.enterText(find.byType(TextField).at(0), 'alfin');
    await tester.enterText(find.byType(TextField).at(1), '124240183');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Pindah ke tab Profile via BottomNavigationBar
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Memastikan username tampil
    expect(find.text('alfin'), findsOneWidget);

    // Memastikan kalimat sumpah kejujuran tampil
    expect(
      find.text('Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun'),
      findsOneWidget,
    );

    // Memastikan tombol logout tampil
    expect(find.widgetWithText(ElevatedButton, 'Logout'), findsOneWidget);
  });
}
