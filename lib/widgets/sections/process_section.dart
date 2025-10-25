import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      _RowData(
        '1. Discovery',
        'Tell us about your goals',
        'We learn about your needs through a 20-minute onboarding call.',
      ),
      _RowData(
        '2. Design & Build',
        'We create your program/solution',
        'We draft curriculum or software design tailored to your audience and outcomes.',
      ),
      _RowData(
        '3. Review & Launch',
        'Approve & go live',
        'You review, request changes, and we launch with analytics and SEO setup.',
      ),
      _RowData(
        '4. Ongoing Care',
        'We maintain and update',
        'Need content updates or new features? We manage everything — stress-free.',
      ),
    ];

    return Container(
      color: const Color(0xFFF7F8FB),
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Simple Process',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Column(
              children: rows
                  .map(
                    (r) => _ProcessRow(
                      title: r.title,
                      subtitle: r.subtitle,
                      body: r.body,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Start the Process →'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProcessRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;
  const _ProcessRow({
    required this.title,
    required this.subtitle,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.responsiveValue(
              mobile: 80,
              tablet: 120,
              desktop: 140,
            ),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RowData {
  final String title;
  final String subtitle;
  final String body;
  _RowData(this.title, this.subtitle, this.body);
}
