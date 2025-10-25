import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const articles = [
      '5 Ways to Grow Your Dev Career (Ethically)',
      'SEO for Tech Education — What Works in 2025',
      'Designing Student-Friendly Learning Portals',
      'Google Business Profile for Training Providers',
      'Social Media Tips for Institutes (Compliant & Effective)',
      'How to Use Blogs to Educate and Boost SEO',
      'The Role of Accessibility in Learning Platforms',
      'Understanding Claims in Education — A Quick Guide',
      'Why Mobile-First Design Matters for Students',
      'How to Simplify Enrollment for Better Conversion',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insights to Grow Your Practice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final a in articles)
                  SizedBox(
                    width: context.responsiveValue(
                      mobile: double.infinity,
                      tablet: 360,
                      desktop: 380,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      tileColor: const Color(0xFFF7F8FB),
                      title: Text(a),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {},
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Read All Articles →'),
            ),
          ],
        ),
      ),
    );
  }
}
