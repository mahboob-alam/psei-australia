import 'package:flutter/material.dart';
import '../app_theme.dart';

class HeroImage extends StatelessWidget {
  final String type; // 'hero', 'services', 'about', 'contact', 'analytics'
  final double? height;
  
  const HeroImage({
    super.key,
    required this.type,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 300,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: _getGradient(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          // Icon overlay
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _getIcon(),
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getGradient() {
    switch (type) {
      case 'services':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary,
            AppTheme.primaryDark,
          ],
        );
      case 'about':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.accent,
            AppTheme.primary,
          ],
        );
      case 'contact':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryDark,
            AppTheme.accent,
          ],
        );
      case 'analytics':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF667EEA),
            const Color(0xFF764BA2),
          ],
        );
      case 'cloud':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2193B0),
            const Color(0xFF6DD5ED),
          ],
        );
      case 'development':
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF11998E),
            const Color(0xFF38EF7D),
          ],
        );
      default: // 'hero'
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary.withOpacity(0.9),
            AppTheme.accent.withOpacity(0.9),
          ],
        );
    }
  }

  IconData _getIcon() {
    switch (type) {
      case 'services':
        return Icons.settings;
      case 'about':
        return Icons.people;
      case 'contact':
        return Icons.mail;
      case 'analytics':
        return Icons.analytics;
      case 'cloud':
        return Icons.cloud;
      case 'development':
        return Icons.code;
      default:
        return Icons.rocket_launch;
    }
  }
}
