import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../../utils/launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF6F8FF), Colors.white],
        ),
      ),
      padding: EdgeInsets.only(
        top: context.isMobile ? 32 : 64,
        bottom: context.isMobile ? 40 : 80,
      ),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 14,
              runSpacing: 14,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Smart. Career-Ready. Beautiful Software Education & Solutions.',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.displayMedium
                      : Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                'We build high-performing training programs and engineering solutions that help you upskill, hire-ready — industry-aligned, accessible, and outcomes-driven.',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.black87),
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => mailTo(
                    email: 'mahboob.alam.uom@gmail.com',
                    subject: 'PSEI Consultation Request',
                  ),
                  child: const Text('Book a Free Consultation'),
                ),
                OutlinedButton(
                  onPressed: () => callTo('+61448337022'),
                  child: const Text('See Our Work'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
