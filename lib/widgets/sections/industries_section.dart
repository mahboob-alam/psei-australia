import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class IndustriesSection extends StatelessWidget {
  const IndustriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who We Serve',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                _IndustryCard(
                  title: 'Students & Graduates',
                  bullets: [
                    'Hands-on projects and job-ready skills',
                    'Portfolio, Git, and interview prep',
                  ],
                ),
                _IndustryCard(
                  title: 'Businesses & Startups',
                  bullets: [
                    'MVPs, internal tools, and team upskilling',
                    'Modern Flutter & web solutions',
                  ],
                ),
                _IndustryCard(
                  title: 'Universities & Bootcamps',
                  bullets: [
                    'Curriculum advisory and guest lectures',
                    'Capstone design and delivery support',
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('See Examples →'),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndustryCard extends StatelessWidget {
  final String title;
  final List<String> bullets;
  const _IndustryCard({required this.title, required this.bullets});

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
              ...bullets.map(
                (b) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  '),
                      Expanded(child: Text(b)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
