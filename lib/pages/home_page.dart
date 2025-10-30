import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import '../utils/launcher.dart';
import '../widgets/sections/articles_section.dart';
import '../widgets/sections/compliance_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/industries_section.dart';
import '../widgets/sections/pricing_section.dart';
import '../widgets/sections/process_section.dart';
import '../widgets/sections/why_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _whyKey = GlobalKey();
  final _processKey = GlobalKey();
  final _pricingKey = GlobalKey();
  final _industriesKey = GlobalKey();
  final _complianceKey = GlobalKey();
  final _articlesKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            border: const Border(bottom: BorderSide(color: Color(0x11000000))),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: MaxWidth(
              child: Row(
                children: [
                  const _Logo(),
                  const Spacer(),
                  if (context.isDesktop) ...[
                    _NavButton('Home', () => _scrollTo(_heroKey)),
                    _NavButton('Why PSEI', () => _scrollTo(_whyKey)),
                    _NavButton('Process', () => _scrollTo(_processKey)),
                    _NavButton('Pricing', () => _scrollTo(_pricingKey)),
                    _NavButton('Who We Serve', () => _scrollTo(_industriesKey)),
                    _NavButton('Standards', () => _scrollTo(_complianceKey)),
                    _NavButton('Articles', () => _scrollTo(_articlesKey)),
                    _NavButton('Contact', () => _scrollTo(_contactKey)),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => mailTo(
                        email: 'mahboob.alam.uom@gmail.com',
                        subject: 'PSEI Consultation Request',
                      ),
                      child: const Text('Book a Free Consultation'),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () => mailTo(
                        email: 'mahboob.alam.uom@gmail.com',
                        subject: 'PSEI Consultation Request',
                      ),
                      child: const Text('Let\'s Talk'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionAnchor(key: _heroKey, child: const HeroSection()),
            SectionAnchor(key: _whyKey, child: const WhySection()),
            SectionAnchor(key: _processKey, child: const ProcessSection()),
            SectionAnchor(key: _pricingKey, child: const PricingSection()),
            SectionAnchor(
              key: _industriesKey,
              child: const IndustriesSection(),
            ),
            SectionAnchor(
              key: _complianceKey,
              child: const ComplianceSection(),
            ),
            SectionAnchor(key: _articlesKey, child: const ArticlesSection()),
            SectionAnchor(key: _contactKey, child: const ContactSection()),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(label),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFF2D5BFF),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: const Text(
            'P',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(width: 10),
        Text('PSEI Australia', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}

class SectionAnchor extends StatelessWidget {
  final Widget child;
  const SectionAnchor({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}
