import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/hero_image.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            
            // Company Overview
            _buildCompanyOverview(context),
            
            // Team Structure
            _buildTeamSection(context),
            
            // Experience Highlights
            _buildExperienceSection(context),
            
            // Partner Network
            _buildPartnerSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
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
          // Add hero image
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: const HeroImage(
              type: 'about',
              height: 300,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'About PSEI Australia',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Delivering excellence in software engineering and cloud solutions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyOverview(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Who We Are',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 36,
                ),
          ),
          const SizedBox(height: 32),
          Text(
            'Prince Software Engineering Institute (PSEI) Australia is a leading software development and cloud solutions provider. We specialize in creating custom web and mobile applications, managing cloud infrastructure, and delivering data-driven insights that transform businesses.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  height: 1.8,
                ),
          ),
          const SizedBox(height: 24),
          Text(
            'With a combined experience of 20+ years in software development and 10+ years in data analytics and cloud management, we bring deep technical expertise to every project. Our team is passionate about leveraging cutting-edge technology to solve real-world business challenges.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  height: 1.8,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
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
            'Our Team',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 36,
                ),
          ),
          const SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                  children: [
                    _buildTeamCard(
                      context,
                      title: 'Australia Team',
                      count: '4 Professionals',
                      description:
                          'Skilled part-time resources based in Australia providing local expertise and client engagement.',
                      icon: Icons.people_outline,
                    ),
                    const SizedBox(height: 24),
                    _buildTeamCard(
                      context,
                      title: 'Bangladesh Team',
                      count: '3 Engineers',
                      description:
                          'Full-time software engineers working through our sister company, PSEI Bangladesh, delivering 24/7 development capacity.',
                      icon: Icons.engineering_outlined,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTeamCard(
                        context,
                        title: 'Australia Team',
                        count: '4 Professionals',
                        description:
                            'Skilled part-time resources based in Australia providing local expertise and client engagement.',
                        icon: Icons.people_outline,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _buildTeamCard(
                        context,
                        title: 'Bangladesh Team',
                        count: '3 Engineers',
                        description:
                            'Full-time software engineers working through our sister company, PSEI Bangladesh, delivering 24/7 development capacity.',
                        icon: Icons.engineering_outlined,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(
    BuildContext context, {
    required String title,
    required String count,
    required String description,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shadowColor: AppTheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
                icon,
                size: 40,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.accent,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    final experiences = [
      {
        'years': '20+',
        'title': 'Programming',
        'description': 'Years of hands-on development experience',
      },
      {
        'years': '10+',
        'title': 'Data Analytics',
        'description':
            'Industry experience in analytics, warehousing, and reporting',
      },
      {
        'years': '3+',
        'title': 'Cloud Management',
        'description': 'Years managing enterprise cloud infrastructure',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Our Expertise',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 36,
                ),
          ),
          const SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                  children: experiences.map((exp) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: _buildExperienceCard(context, exp),
                    );
                  }).toList(),
                )
              : Row(
                  children: experiences.map((exp) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: _buildExperienceCard(context, exp),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Map<String, String> exp) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.primary.withOpacity(0.2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            exp['years']!,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppTheme.primary,
                  fontSize: 56,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            exp['title']!,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 24,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            exp['description']!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerSection(BuildContext context) {
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
            'Strategic Ventures & Partnerships',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 36,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                  children: [
                    _buildPartnerCard(
                      context,
                      icon: Icons.analytics_outlined,
                      title: 'Wisam Analytics',
                      description:
                          'Our specialized data analytics venture delivering advanced analytics, business intelligence, and data warehousing solutions. With 10+ years of industry experience, Wisam Analytics transforms complex data into actionable business insights.',
                      url: 'wisam.com.au',
                      color: AppTheme.accent,
                    ),
                    const SizedBox(height: 24),
                    _buildPartnerCard(
                      context,
                      icon: Icons.language,
                      title: 'PSEI Bangladesh',
                      description:
                          'Our sister company in Bangladesh provides additional engineering resources and 24/7 development capabilities. This global partnership allows us to deliver projects faster while maintaining Australian quality standards and project management.',
                      url: 'psei-global.com',
                      color: AppTheme.primary,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildPartnerCard(
                        context,
                        icon: Icons.analytics_outlined,
                        title: 'Wisam Analytics',
                        description:
                            'Our specialized data analytics venture delivering advanced analytics, business intelligence, and data warehousing solutions. With 10+ years of industry experience, Wisam Analytics transforms complex data into actionable business insights.',
                        url: 'wisam.com.au',
                        color: AppTheme.accent,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _buildPartnerCard(
                        context,
                        icon: Icons.language,
                        title: 'PSEI Bangladesh',
                        description:
                            'Our sister company in Bangladesh provides additional engineering resources and 24/7 development capabilities. This global partnership allows us to deliver projects faster while maintaining Australian quality standards and project management.',
                        url: 'psei-global.com',
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildPartnerCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String url,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shadowColor: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: color.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 48,
                color: color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    height: 1.8,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                // Could open URL in browser
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color),
              ),
              icon: const Icon(Icons.open_in_new),
              label: Text('Visit $url'),
            ),
          ],
        ),
      ),
    );
  }
}
