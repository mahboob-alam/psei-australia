import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: _buildLogo(context),
        automaticallyImplyLeading: false,
        actions: [
          if (Responsive.isDesktop(context)) ...[
            _buildHeaderLink(context, label: 'Services', route: '/services'),
            _buildHeaderLink(context, label: 'About', route: '/about'),
            _buildHeaderLink(context, label: 'Contact', route: '/contact'),
            const SizedBox(width: 12),
          ],
        ],
      ),
      drawer: _buildDrawer(context),
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

  Widget _buildHeaderLink(BuildContext context,
      {required String label, required String route}) {
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
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isCurrentRoute ? FontWeight.w700 : FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'P',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'PSEI Australia',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Software Engineering Excellence',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            label: 'Home',
            icon: Icons.home_outlined,
            route: '/',
          ),
          _buildDrawerItem(
            context,
            label: 'Services',
            icon: Icons.build_outlined,
            route: '/services',
          ),
          _buildDrawerItem(
            context,
            label: 'About',
            icon: Icons.info_outlined,
            route: '/about',
          ),
          _buildDrawerItem(
            context,
            label: 'Contact',
            icon: Icons.mail_outlined,
            route: '/contact',
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
  }) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == route;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute ? AppTheme.primary : AppTheme.textSecondary,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isCurrentRoute ? FontWeight.w600 : FontWeight.w500,
          color: isCurrentRoute ? AppTheme.primary : AppTheme.textPrimary,
        ),
      ),
      selected: isCurrentRoute,
      selectedTileColor: AppTheme.primary.withOpacity(0.1),
      onTap: () {
        Navigator.pop(context);
        if (!isCurrentRoute) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

}
