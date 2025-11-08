import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../utils/apk_download_helper.dart';
import '../widgets/footer.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context),
            const SizedBox(height: 48),
            _buildProjects(context),
            const SizedBox(height: 48),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 600 ? 20 : 80,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primary, AppTheme.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 42,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Our notable projects and digital solutions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProjects(BuildContext context) {
    final projects = [
      {
        'title': 'Y3 Smiles Dental Clinic Website',
        'url': 'https://y3smilesdental.com.au',
        'description':
            'A modern, family-focused dental clinic website for Broadmeadows, Melbourne. Features online booking, comprehensive treatment info, and health fund integration. Y3 Smiles Dental provides gentle, high-quality care for all ages, including emergency and children’s dentistry.',
  'image': 'assets/y3_logo.png',
      },
      {
        'title': 'ZeroWave Website & Mobile App',
        'url': 'https://www.zerowave.com.au',
        'description':
            'ZeroWave delivers clean energy, smart connections, and zero waste solutions. The website and mobile app provide information, updates, and a platform for users to connect and engage with sustainable initiatives.',
  'image': 'assets/zerowave_logo.png',
  'apk': 'https://github.com/mahboob-alam/zerowave/releases/download/v1.0.0/app-release.apk',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        double cardWidth = maxWidth < 900 ? maxWidth : 400;
        return Wrap(
          alignment: WrapAlignment.center,
          spacing: 32,
          runSpacing: 32,
          children: projects.map((project) {
            return SizedBox(
              width: cardWidth,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (project['image'] != null)
                        Image.asset(
                          project['image']!,
                          height: 64,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 64),
                        ),
                      const SizedBox(height: 24),
                      Text(
                        project['title']!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        project['description']!,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(project['url']!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          }
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Visit Project'),
                      ),
                      if (project['apk'] != null) ...[
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            const apkPath = '/app-release.apk';
                            downloadApk(apkPath);
                          },
                          icon: const Icon(Icons.download),
                          label: const Text('Download Android App'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
