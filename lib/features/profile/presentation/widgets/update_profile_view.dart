import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/ui/widgets/custom_text_form_field.dart';
import 'package:jewish_app/export_files.dart';

class UpdateProfileView extends StatefulWidget {
  final VoidCallback onBack;

  const UpdateProfileView({
    super.key,
    required this.onBack,
  });

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'John Paul Smith');
  final _phoneController = TextEditingController(text: '591 4585471');
  final _countryController = TextEditingController(text: 'Bolivia');

  static const Color _purple = Color(0xFF8A5694);
  static const Color _orange = Color(0xFFF2A41E);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Wave background at top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: WaveStrip.defaultWave(
            visibleHeight: 100,
            imageHeight: 357,
          ),
        ),

        // Main content
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)
                          .copyWith(right: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: widget.onBack,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: _purple,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Update Profile',
                        style: TextStyle(
                          fontFamily: 'Taz',
                          fontSize: 18,
                          color: _purple,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _saveProfile,
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Color(0xFF62606E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: 3, color: _orange),

              // Form content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Name field
                        _buildFormField(
                          fieldLabel: 'Name',
                          controller: _nameController,
                          hintText: 'John Paul Smith',
                        ),
                        AppSpaces.md,

                        // Phone field
                        _buildFormField(
                          fieldLabel: 'Phone',
                          controller: _phoneController,
                          hintText: '591 4585471',
                          textInputType: TextInputType.phone,
                        ),
                        AppSpaces.md,

                        // Country field
                        _buildFormField(
                          fieldLabel: 'Country',
                          controller: _countryController,
                          hintText: 'Bolivia',
                        ),
                        AppSpaces.lg,

                        // Horizontal divider line
                        Container(
                          height: 1,
                          color: const Color(0xFFE9EFFF),
                        ),
                        AppSpaces.lg,

                        // Update Profile button
                        SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            style: CustomButtonStyles.fillPurple,
                            onPressed: _updateProfile,
                            child: Text(
                              'Update Profile',
                              style: CustomTextStyles.buttonSignIn(context),
                            ),
                          ),
                        ),
                        AppSpaces.xl,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String fieldLabel,
    required TextEditingController controller,
    required String hintText,
    TextInputType? textInputType,
  }) {
    return CustomTextFormField(
      controller: controller,
      fieldLabel: fieldLabel,
      hintText: hintText,
      textInputType: textInputType,
      textStyle: const TextStyle(
        fontFamily: 'Futura Std',
        fontSize: 16,
        color: Color(0xFF62606E),
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Futura Std',
        fontSize: 16,
        color: Color(0xFF62606E),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  void _saveProfile() {
    // Handle save logic here
    if (_formKey.currentState?.validate() ?? false) {
      // Save profile data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully!')),
      );
    }
  }

  void _updateProfile() {
    // Handle update profile logic here
    if (_formKey.currentState?.validate() ?? false) {
      // Update profile data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
      widget.onBack(); // Go back to main profile view
    }
  }
}
