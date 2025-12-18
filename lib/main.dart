import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF4F46E5), // โทนม่วง/น้ำเงินดู modern
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //ข้อมูล
  static const String fullName = 'นายสินสมุทร ขุนพิมูล';
  static const String studentId = '663450310-9';
  static const String program = 'วิทยาการคอมพิวเตอร์และสารสนเทศ';
  static const String university = 'มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย';

  static const String githubUrl = 'https://github.com/DeadShotZ47';
  static const String facebookUrl = 'https://www.facebook.com/sinsamut.khunphimool.3';
  static const String igUrl = 'https://www.instagram.com/poundlnwza007?igsh=NHppa3BzZHR1b3hx';
  static const String steamUrl = 'https://steamcommunity.com/profiles/76561198970543087/';

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cs.primary.withOpacity(0.95),
              cs.secondary.withOpacity(0.85),
              cs.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  children: [
                    // Header card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.90),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 24,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.12),
                            offset: const Offset(0, 12),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          // รูปโปรไฟล์
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [cs.primary, cs.secondary],
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 54,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    const AssetImage('asset/image/IMG_0207.jpg'),
                                onBackgroundImageError: (_, __) {
                                  debugPrint('Profile image not found.');
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Text(
                            fullName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),

                          Text(
                            'Student ID: $studentId',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.65),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Info chips
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              _InfoChip(
                                icon: Icons.school_rounded,
                                label: program,
                              ),
                              _InfoChip(
                                icon: Icons.account_balance_rounded,
                                label: university,
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),
                          const Divider(height: 1),
                          const SizedBox(height: 14),

                          Text(
                            'Connect with me',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black.withOpacity(0.75),
                            ),
                          ),
                          const SizedBox(height: 10),

                          //Logo
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _LogoButton(
                                assetPath: 'asset/icon/github-logo-png_seeklogo-304612.png',
                                tooltip: 'GitHub',
                                onTap: () => _openUrl(githubUrl),
                              ),
                              const SizedBox(width: 14),
                              _LogoButton(
                                assetPath: 'asset/icon/Facebook_Logo_(2019).png',
                                tooltip: 'Facebook',
                                onTap: () => _openUrl(facebookUrl),
                              ),
                              const SizedBox(width: 14),
                              _LogoButton(
                                assetPath: 'asset/icon/Instagram_icon.png',
                                tooltip: 'Instagram',
                                onTap: () => _openUrl(igUrl),
                              ),
                              const SizedBox(width: 14),
                              _LogoButton(
                                assetPath: 'asset/icon/Steam_icon_logo.png',
                                tooltip: 'Steam',
                                onTap: () => _openUrl(steamUrl),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Text(
                      'Tip: การที่เราจะเดินไปข้างหน้า เราต้องก้าวขาออกก่อน',
                      style: TextStyle(color: Colors.white.withOpacity(0.85)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _LogoButton extends StatelessWidget {
  final String assetPath;
  final String tooltip;
  final VoidCallback onTap;

  const _LogoButton({
    required this.assetPath,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 14,
                color: Colors.black.withOpacity(0.10),
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
