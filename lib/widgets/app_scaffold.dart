import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  
  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: _buildLogo(context),
        actions: [
          if (Responsive.isDesktop(context)) ...[
            _buildNavButton(context, 'Home', '/'),
            _buildNavButton(context, 'Services', '/services'),
            _buildNavButton(context, 'About', '/about'),
            _buildNavButton(context, 'Contact', '/contact'),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: const Text('Get Started'),
              ),
            ),
            const SizedBox(width: 16),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _showMobileMenu(context);
              },
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
      body: child,
    );
  }

  Widget _buildLogo(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'P',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'PSEI Australia',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String label, String route) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == route;
    
    return TextButton(
      onPressed: () {
        if (!isCurrentRoute) {
          Navigator.pushNamed(context, route);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor:
            isCurrentRoute ? AppTheme.primary : AppTheme.textSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isCurrentRoute ? FontWeight.w600 : FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              _buildMobileMenuItem(context, 'Home', Icons.home_outlined, '/'),
              _buildMobileMenuItem(
                  context, 'Services', Icons.build_outlined, '/services'),
              _buildMobileMenuItem(
                  context, 'About', Icons.info_outlined, '/about'),
              _buildMobileMenuItem(
                  context, 'Contact', Icons.mail_outlined, '/contact'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/contact');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('Get Started'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem(
      BuildContext context, String label, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primary),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
