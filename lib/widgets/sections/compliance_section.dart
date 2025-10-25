import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class ComplianceSection extends StatelessWidget {
  const ComplianceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FB),
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ethical, Accessible, and Standards-Aligned',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Text(
                'We ensure your website and content align with best practices: no misleading claims, accessible design (WCAG), privacy-first handling, and accurate descriptions of services.',
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: const [
                _Bullet('No testimonials that mislead or fabricate results'),
                _Bullet(
                  'Accurate service descriptions and clear pricing where applicable',
                ),
                _Bullet('Accessibility-minded layouts and contrast'),
                _Bullet('Privacy and consent awareness for forms and tracking'),
              ],
            ),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Learn More About Standards →'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF2D5BFF)),
        const SizedBox(width: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Text(text),
        ),
      ],
    );
  }
}
