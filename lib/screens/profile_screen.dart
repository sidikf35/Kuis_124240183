import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Link gambar Male (Victor) dan Female (Gloria) sesuai ketentuan kuis
  static const String maleImageUrl =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
  static const String femaleImageUrl =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  // Foto profil default menggunakan Male Character (Victor)
  late String _currentProfileImage;

  @override
  void initState() {
    super.initState();
    _currentProfileImage = maleImageUrl;
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),

            // Foto Profil Utama (Default Victor / Berubah sesuai pilihan)
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7F6),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red.shade300, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  _currentProfileImage,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.red,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      _currentProfileImage == maleImageUrl
                          ? Icons.male_rounded
                          : Icons.female_rounded,
                      size: 70,
                      color: Colors.deepPurple,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2 Tombol bergambar untuk mengganti avatar (Male & Female)
            // Clue: Menggunakan GestureDetector untuk wrap widget dengan properti onTap
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol 1: Male Character
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentProfileImage = maleImageUrl;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _currentProfileImage == maleImageUrl
                            ? Colors.red
                            : Colors.grey.shade300,
                        width: _currentProfileImage == maleImageUrl ? 2.5 : 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.network(
                          maleImageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.male,
                              color: Colors.blue,
                              size: 28,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),

                // Tombol 2: Female Character
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentProfileImage = femaleImageUrl;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _currentProfileImage == femaleImageUrl
                            ? Colors.red
                            : Colors.grey.shade300,
                        width: _currentProfileImage == femaleImageUrl
                            ? 2.5
                            : 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.network(
                          femaleImageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.female,
                              color: Colors.pink,
                              size: 28,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Username yang sedang login saat ini
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Pernyataan Kejujuran Kuis
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Text(
                'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun✌️',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Tombol Logout
            ElevatedButton(
              onPressed: _handleLogout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 0,
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
