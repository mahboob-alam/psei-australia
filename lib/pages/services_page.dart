import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primary.withOpacity(0.1),
                    AppTheme.accent.withOpacity(0.05),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 20 : 80,
                vertical: Responsive.isMobile(context) ? 60 : 100,
              ),
              child: Column(
                children: [
                  Text(
                    'Our Services',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Comprehensive software solutions tailored to your business needs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Services Grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 20 : 80,
                vertical: 80,
              ),
              child: Responsive.isMobile(context)
                  ? Column(
                      children: _buildServiceCards(context),
                    )
                  : Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      children: _buildServiceCards(context),
                    ),
            ),

            // Pricing Section
            _buildPricingSection(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildServiceCards(BuildContext context) {
    final services = [
      {
        'icon': Icons.web,
        'title': 'Web & Mobile Development',
        'description':
            'Custom websites, web applications, and mobile apps built with modern frameworks. Flutter, React, Node.js, and more.',
        'features': [
          'Responsive web design',
          'Progressive web apps (PWA)',
          'Native iOS & Android apps',
          'Cross-platform solutions with Flutter',
          'E-commerce platforms',
          'Custom web applications',
        ],
      },
      {
        'icon': Icons.cloud_outlined,
        'title': 'Cloud Migration & Management',
        'description':
            'Seamless cloud migration and ongoing management with 3+ years of expertise. AWS, Azure, Google Cloud.',
        'features': [
          'Cloud strategy & planning',
          'Migration to AWS/Azure/GCP',
          'Infrastructure as Code',
          'DevOps & CI/CD pipelines',
          'Cloud cost optimization',
          '24/7 monitoring & support',
        ],
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Data Analytics Solutions',
        'description':
            'Advanced analytics and business intelligence delivered through our specialized venture, Wisam Analytics (wisam.com.au), with 10+ years of experience.',
        'features': [
          'Data warehousing & ETL pipelines',
          'Business intelligence dashboards',
          'Custom reporting solutions',
          'Advanced data visualization',
          'Predictive analytics & ML models',
          'Analytics consulting & training',
        ],
        'isWisam': true,
      },
    ];

    return services.map((service) {
      return Container(
        width: Responsive.isMobile(context)
            ? double.infinity
            : (MediaQuery.of(context).size.width - 192) / 2,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Card(
          elevation: 2,
          shadowColor: AppTheme.primary.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: AppTheme.primary.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service['icon'] as IconData,
                    size: 40,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  service['title'] as String,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (service['isWisam'] == true) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.accent.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.open_in_new,
                          size: 14,
                          color: AppTheme.accent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Powered by Wisam Analytics',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  service['description'] as String,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ...( service['features'] as List<String>).map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 20,
                          color: AppTheme.accent,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to contact page
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildPricingSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.surface,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Flexible Pricing',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 36,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Transparent, value-driven pricing tailored to your project needs',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                  children: _buildPricingCards(context),
                )
              : Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: _buildPricingCards(context),
                ),
          const SizedBox(height: 48),
          Card(
            elevation: 0,
            color: AppTheme.primary.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48,
                    color: AppTheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Custom Enterprise Solutions',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Need something more specific? We offer tailored solutions for complex projects, ongoing support contracts, and dedicated team engagements. Contact us for a custom quote.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Request Custom Quote'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPricingCards(BuildContext context) {
    final packages = [
      {
        'name': 'Starter',
        'price': 'From \$5,000',
        'description': 'Perfect for small projects and MVPs',
        'features': [
          'Basic web or mobile app',
          'Up to 5 core features',
          'Responsive design',
          'Basic SEO setup',
          '2 rounds of revisions',
          '30 days post-launch support',
        ],
        'highlight': false,
      },
      {
        'name': 'Professional',
        'price': 'From \$15,000',
        'description': 'Ideal for growing businesses',
        'features': [
          'Full-featured web/mobile app',
          'Custom UI/UX design',
          'API integrations',
          'Database architecture',
          'Advanced SEO optimization',
          'Cloud deployment setup',
          '90 days post-launch support',
        ],
        'highlight': true,
      },
      {
        'name': 'Enterprise',
        'price': 'From \$50,000',
        'description': 'For complex, scalable solutions',
        'features': [
          'Multi-platform applications',
          'Advanced features & integrations',
          'Scalable cloud infrastructure',
          'DevOps & CI/CD pipelines',
          'Security & compliance',
          'Data analytics integration',
          'Dedicated project manager',
          '6 months ongoing support',
        ],
        'highlight': false,
      },
    ];

    return packages.map((pkg) {
      return Container(
        width: Responsive.isMobile(context)
            ? double.infinity
            : 340,
        child: Card(
          elevation: pkg['highlight'] as bool ? 8 : 2,
          shadowColor: pkg['highlight'] as bool
              ? AppTheme.primary.withOpacity(0.3)
              : AppTheme.primary.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: pkg['highlight'] as bool
                  ? AppTheme.primary
                  : AppTheme.primary.withOpacity(0.1),
              width: pkg['highlight'] as bool ? 2 : 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (pkg['highlight'] as bool)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.primary, AppTheme.accent],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'MOST POPULAR',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                    ),
                  ),
                if (pkg['highlight'] as bool) const SizedBox(height: 16),
                Text(
                  pkg['name'] as String,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  pkg['price'] as String,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  pkg['description'] as String,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),
                const SizedBox(height: 24),
                Divider(color: AppTheme.primary.withOpacity(0.2)),
                const SizedBox(height: 24),
                ...(pkg['features'] as List<String>).map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: AppTheme.accent,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: pkg['highlight'] as bool
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contact');
                          },
                          child: const Text('Get Started'),
                        )
                      : OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contact');
                          },
                          child: const Text('Get Started'),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
