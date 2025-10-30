import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 16 : 40,
        vertical: Responsive.isMobile(context) ? 12 : 16,
      ),
      child: SafeArea(
        top: false,
        child: Responsive.isMobile(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _footerLink(context, 'Services', '/services'),
                  const SizedBox(height: 8),
                  _footerLink(context, 'About', '/about'),
                  const SizedBox(height: 8),
                  _footerLink(context, 'Contact', '/contact'),
                  const SizedBox(height: 8),
                  Text(
                    '© ${DateTime.now().year} PSEI Australia',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppTheme.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _footerLink(context, 'Services', '/services'),
                      const SizedBox(width: 16),
                      _footerLink(context, 'About', '/about'),
                      const SizedBox(width: 16),
                      _footerLink(context, 'Contact', '/contact'),
                    ],
                  ),
                  Text(
                    '© ${DateTime.now().year} PSEI Australia',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppTheme.textSecondary),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _footerLink(BuildContext context, String label, String route) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == route;
    return InkWell(
      onTap: () {
        if (!isCurrentRoute) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isCurrentRoute ? AppTheme.primary : AppTheme.textSecondary,
              fontWeight: isCurrentRoute ? FontWeight.w700 : FontWeight.w500,
            ),
      ),
    );
  }
}
