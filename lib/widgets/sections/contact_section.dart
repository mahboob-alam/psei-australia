import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../../utils/launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _business = TextEditingController();
  String _selectedType = 'Student';
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _business.dispose();
    _message.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you! We\'ll be in touch shortly.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FB),
      padding: EdgeInsets.symmetric(vertical: context.isMobile ? 40 : 64),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ready to Build a Website That Reflects Your Practice?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Text(
                'Let\'s make your online presence as professional and trustworthy as your work.',
              ),
            ),
            const SizedBox(height: 20),
            // Contact Card
            Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mahboob Alam',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Principal Engineer',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => mailTo(email: 'mahboob.alam.uom@gmail.com'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.email,
                            size: 18,
                            color: Color(0xFF2D5BFF),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'mahboob.alam.uom@gmail.com',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: const Color(0xFF2D5BFF),
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => callTo('+61448337022'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 18,
                            color: Color(0xFF2D5BFF),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '+61 (0) 448 337 022',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: const Color(0xFF2D5BFF),
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _Field(
                    label: 'Name',
                    controller: _name,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Required' : null,
                  ),
                  _Field(
                    label: 'Email',
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v != null && v.contains('@')
                        ? null
                        : 'Enter a valid email',
                  ),
                  _Field(
                    label: 'Business / Organization',
                    controller: _business,
                  ),
                  SizedBox(
                    width: context.responsiveValue(
                      mobile: double.infinity,
                      tablet: 360,
                      desktop: 380,
                    ),
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedType,
                      items: const [
                        DropdownMenuItem(
                          value: 'Student',
                          child: Text('Student'),
                        ),
                        DropdownMenuItem(
                          value: 'Business',
                          child: Text('Business'),
                        ),
                        DropdownMenuItem(
                          value: 'University',
                          child: Text('University'),
                        ),
                      ],
                      onChanged: (v) =>
                          setState(() => _selectedType = v ?? 'Student'),
                      decoration: const InputDecoration(labelText: 'Type'),
                    ),
                  ),
                  _Field(label: 'Message', controller: _message, maxLines: 6),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Book a Free Strategy Call'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  const _Field({
    required this.label,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.responsiveValue(
        mobile: double.infinity,
        tablet: 360,
        desktop: 380,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
