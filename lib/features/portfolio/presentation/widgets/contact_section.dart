import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 80),
      color: colors.background,
      child: Column(
        children: [
          const SectionTitle(
              title: 'Contact', subtitle: 'Let\'s work together'),
          const SizedBox(height: 48),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactInfo()),
                    const SizedBox(width: 48),
                    Expanded(child: _ContactForm()),
                  ],
                )
              : Column(
                  children: [
                    _ContactInfo(),
                    const SizedBox(height: 40),
                    _ContactForm(),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: TextStyle(
              color: colors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m currently open to new opportunities. Whether you have a project in mind or just want to say hi, my inbox is always open.',
          style: TextStyle(
              color: colors.textSecondary, fontSize: 14, height: 1.7),
        ),
        const SizedBox(height: 32),
        _ContactItem(
            icon: Icons.email,
            label: AppConstants.email,
            url: 'mailto:${AppConstants.email}'),
        _ContactItem(
            icon: Icons.phone,
            label: AppConstants.phone,
            url: 'tel:${AppConstants.phone}'),
        _ContactItem(
            icon: Icons.location_on, label: AppConstants.location),
        const SizedBox(height: 32),
        Row(
          children: [
            _SocialButton(
                icon: FontAwesomeIcons.github, url: AppConstants.githubUrl),
            _SocialButton(
                icon: FontAwesomeIcons.linkedin,
                url: AppConstants.linkedinUrl),
            _SocialButton(
                icon: FontAwesomeIcons.twitter,
                url: AppConstants.twitterUrl),
          ],
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? url;

  const _ContactItem(
      {required this.icon, required this.label, this.url});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: url != null ? () => launchUrl(Uri.parse(url!)) : null,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppTheme.primary, size: 18),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: url != null
                    ? AppTheme.primary
                    : colors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialButton({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: IconButton(
        onPressed: () => launchUrl(Uri.parse(url)),
        icon: FaIcon(icon, color: colors.textSecondary, size: 20),
        style: IconButton.styleFrom(
          backgroundColor: colors.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;
  String? _feedback;
  bool _success = false;

  static const _formspreeUrl = 'https://formspree.io/f/mpqonjpw';

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _sending = true;
      _feedback = null;
    });

    try {
      final response = await http.post(
        Uri.parse(_formspreeUrl),
        headers: {'Accept': 'application/json'},
        body: {
          'name': _nameCtrl.text,
          'email': _emailCtrl.text,
          'message': _messageCtrl.text,
        },
      );

      if (response.statusCode == 200) {
        _nameCtrl.clear();
        _emailCtrl.clear();
        _messageCtrl.clear();
        setState(() {
          _success = true;
          _feedback = 'Message sent! I\'ll get back to you soon.';
        });
      } else {
        setState(() {
          _success = false;
          _feedback = 'Something went wrong. Please try again.';
        });
      }
    } catch (_) {
      setState(() {
        _success = false;
        _feedback = 'Network error. Please check your connection.';
      });
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _FormField(
              controller: _nameCtrl, label: 'Your Name', hint: 'John Doe'),
          const SizedBox(height: 16),
          _FormField(
            controller: _emailCtrl,
            label: 'Email Address',
            hint: 'john@example.com',
            validator: (v) =>
                v != null && v.contains('@') ? null : 'Enter a valid email',
          ),
          const SizedBox(height: 16),
          _FormField(
            controller: _messageCtrl,
            label: 'Message',
            hint: 'Tell me about your project...',
            maxLines: 5,
          ),
          const SizedBox(height: 24),
          if (_feedback != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _success
                    ? AppTheme.secondary.withValues(alpha: 0.15)
                    : AppTheme.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _success ? AppTheme.secondary : AppTheme.accent,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _success ? Icons.check_circle : Icons.error,
                    color: _success ? AppTheme.secondary : AppTheme.accent,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _feedback!,
                      style: TextStyle(
                        color:
                            _success ? AppTheme.secondary : AppTheme.accent,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _sending ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor:
                    AppTheme.primary.withValues(alpha: 0.6),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: _sending
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : const Text('Send Message',
                      style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: colors.textPrimary),
      validator: validator ??
          (v) => v == null || v.isEmpty ? 'This field is required' : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: colors.textSecondary),
        hintStyle:
            TextStyle(color: colors.textSecondary.withValues(alpha: 0.5)),
        filled: true,
        fillColor: colors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: AppTheme.primary.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: AppTheme.primary.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.primary),
        ),
      ),
    );
  }
}
