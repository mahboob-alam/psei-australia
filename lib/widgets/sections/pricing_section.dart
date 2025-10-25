import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transparent Pricing — No Hidden Costs',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                _PriceCard(
                  title: 'Option 1: By Project',
                  price: r'From $1,490',
                  lines: [
                    'Ideal for a 3-page starter site or program landing',
                    'Includes homepage, about, and contact page',
                    'Add-ons: blog, enrollment form, portfolio, service pages',
                  ],
                ),
                _PriceCard(
                  title: 'Option 2: By Page/Module',
                  price: r'$350 per additional page',
                  lines: [
                    'Custom design + copy and review',
                    'Ideal for expanding offerings or new modules',
                  ],
                ),
                _PriceCard(
                  title: 'Option 3: Ongoing Care Plans',
                  price: r'From $99/month',
                  lines: [
                    'Monthly updates, blog uploads, accessibility & SEO checks',
                    'Content and compliance reviews',
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Request a Quote →'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> lines;
  const _PriceCard({
    required this.title,
    required this.price,
    required this.lines,
  });

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
              const SizedBox(height: 6),
              Text(
                price,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF2D5BFF),
                ),
              ),
              const SizedBox(height: 12),
              ...lines.map(
                (l) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  '),
                      Expanded(child: Text(l)),
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
