import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We Speak the Language of Software Engineering',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                _WhyCard(
                  title: 'Industry-Aligned Curriculum',
                  body:
                      'Modern stacks, real projects, and assessments designed with hiring managers in mind.',
                ),
                _WhyCard(
                  title: 'Fast, Secure & Modern',
                  body:
                      'SEO-friendly Flutter web, responsive design, and performance-first engineering.',
                ),
                _WhyCard(
                  title: 'Built for Connection',
                  body:
                      'Clear learning pathways, strong call-to-actions, and engaging layouts that convert visitors into enquiries.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final String title;
  final String body;
  const _WhyCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.responsiveValue(
        mobile: double.infinity,
        tablet: 360,
        desktop: 380,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
