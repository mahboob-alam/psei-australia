import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/hero_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            
            // Services Overview
            _buildServicesSection(context),
            
            // Why Choose Us
            _buildWhyChooseSection(context),
            
            // CTA Section
            _buildCTASection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary.withOpacity(0.05),
            AppTheme.accent.withOpacity(0.02),
            Colors.white,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 20 : 80,
            vertical: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Responsive.isMobile(context)) const SizedBox(height: 40),
              Text(
                'Transform Your Business',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 36 : 56,
                      color: AppTheme.textPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'With Expert Software Development',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 28 : 42,
                      color: AppTheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  'Custom web & mobile applications, cloud solutions, and data analytics. '
                  '20+ years of programming expertise, backed by Australian quality and global resources.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: Responsive.isMobile(context) ? 16 : 20,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              Responsive.isMobile(context)
                  ? Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/contact');
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text('Get Started'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/services');
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text('View Services'),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contact');
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 4.0,
                            ),
                            child: Text('Get Started'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/services');
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 4.0,
                            ),
                            child: Text('View Services'),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 60),
              
              // Key Stats
              _buildStatsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final stats = [
      {'number': '20+', 'label': 'Years Programming'},
      {'number': '10+', 'label': 'Years Data Analytics'},
      {'number': '3+', 'label': 'Years Cloud Management'},
    ];

    return Responsive.isMobile(context)
        ? Column(
            children: stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: _buildStatItem(context, stat),
              );
            }).toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: stats.map((stat) {
              return Expanded(
                child: _buildStatItem(context, stat),
              );
            }).toList(),
          );
  }

  Widget _buildStatItem(BuildContext context, Map<String, String> stat) {
    return Column(
      children: [
        Text(
          stat['number']!,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 48,
                color: AppTheme.primary,
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          stat['label']!,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          Text(
            'What We Do',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 42,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Comprehensive solutions for modern businesses',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64),
          
          _buildServiceCards(context),
          
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/services');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text('View All Services'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCards(BuildContext context) {
    final services = [
      {
        'icon': Icons.web,
        'title': 'Web & Mobile Development',
        'description':
            'Custom applications built with cutting-edge technology. Beautiful, fast, and scalable solutions.',
        'imageType': 'development',
      },
      {
        'icon': Icons.cloud_outlined,
        'title': 'Cloud Solutions',
        'description':
            'Expert cloud migration and management. AWS, Azure, Google Cloud. Secure and cost-effective.',
        'imageType': 'cloud',
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Data Analytics',
        'description':
            'Turn data into insights. Warehousing, reporting, and business intelligence solutions.',
        'imageType': 'analytics',
      },
    ];

    return Responsive.isMobile(context)
        ? Column(
            children: services.map((service) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: _buildServiceCard(context, service),
              );
            }).toList(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: services.map((service) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: _buildServiceCard(context, service),
                ),
              );
            }).toList(),
          );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: AppTheme.primary.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            // Add hero image
            HeroImage(
              type: service['imageType'] as String,
              height: 200,
            ),
            const SizedBox(height: 24),
            Text(
              service['title'] as String,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              service['description'] as String,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyChooseSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.surface,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          Text(
            'Why Choose PSEI Australia',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 42,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64),
          
          Responsive.isMobile(context)
              ? Column(
                  children: _buildWhyItems(context),
                )
              : Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: _buildWhyItems(context),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildWhyItems(BuildContext context) {
    final items = [
      {
        'icon': Icons.verified_outlined,
        'title': 'Proven Expertise',
        'description':
            '20+ years programming, 10+ years data analytics, 3+ years cloud management',
      },
      {
        'icon': Icons.groups_outlined,
        'title': 'Dedicated Teams',
        'description':
            'Australian leadership with a dedicated offshore engineering team for 24/7 coverage',
      },
      {
        'icon': Icons.speed,
        'title': 'Rapid Delivery',
        'description':
            'Agile development with global resources for faster time-to-market',
      },
      {
        'icon': Icons.support_agent,
        'title': 'Local Support',
        'description':
            'Australian-based management with direct communication in your timezone',
      },
    ];

    return items.map((item) {
      return Container(
        width: Responsive.isMobile(context)
            ? double.infinity
            : (MediaQuery.of(context).size.width - 192) / 2,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.primary.withOpacity(0.15),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              item['icon'] as IconData,
              size: 48,
              color: AppTheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              item['title'] as String,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              item['description'] as String,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primary,
            AppTheme.primaryDark,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          Text(
            'Ready to Get Started?',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 42,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Let\'s discuss how we can help transform your business with custom software solutions.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppTheme.primary,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text('Contact Us'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text('Learn More'),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primary,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 4.0,
                        ),
                        child: Text('Contact Us'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 4.0,
                        ),
                        child: Text('Learn More'),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}