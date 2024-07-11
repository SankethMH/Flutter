import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class BloodDonorRegistrationForm extends StatefulWidget {
  @override
  _BloodDonorRegistrationFormState createState() => _BloodDonorRegistrationFormState();
}

class _BloodDonorRegistrationFormState extends State<BloodDonorRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usnController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _additionalMobileNumberController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _numberOfDonationsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  String? _selectedGender;
  String? _selectedBloodGroup;
  String? _selectedPlatelets;
  String? _selectedMedicalCondition;
  String? _selectedDrinkingSmoking;
  String? _selectedDonateBlood;
  String? _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donor Registration'),
        backgroundColor: Colors.red, // Set the app bar color
      ),
      body: Container(
        color: Colors.white, // Set the background color here
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(_emailController, 'Email ID', 'Enter your email ID'),
              _buildTextFormField(_nameController, 'Name of the donor', 'Enter the donor\'s name'),
              _buildTextFormField(_usnController, 'USN', 'Enter your USN'),
              _buildTextFormField(_ageController, 'Age', 'Enter your age', isNumber: true),
              _buildGenderRadio(),
              _buildBloodGroupRadio(),
              _buildTextFormField(_mobileNumberController, 'Mobile Number', 'Enter the mobile number', isNumber: true),
              _buildTextFormField(_additionalMobileNumberController, 'Additional Mobile Number', 'Enter an additional mobile number', isNumber: true, isOptional: true),
              _buildTextFormField(_pinCodeController, 'PIN Code', 'Enter the PIN code', isNumber: true),
              _buildPlateletsRadio(),
              _buildMedicalConditionRadio(),
              _buildDrinkingSmokingRadio(),
              _buildDonateBloodRadio(),
              _buildTextFormField(_numberOfDonationsController, 'Number of Donations', 'Enter the number of donations made', isNumber: true),
              _buildTextFormField(_experienceController, 'Write a few lines about your blood donation experience', 'Enter your experience'),
              _buildFileUploadSection(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Increased weight
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, String hint,
      {bool isNumber = false, bool isOptional = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return isOptional ? null : 'Please enter $label';
          }
          if (isNumber && int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGenderRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Gender', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Male'),
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Non-binary'),
                leading: Radio<String>(
                  value: 'Non-binary',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBloodGroupRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Donor Blood Group', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('A RhD positive(A+)'),
                leading: Radio<String>(
                  value: 'A+',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('A RhD negative(A-)'),
                leading: Radio<String>(
                  value: 'A-',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('B RhD positive(B+)'),
                leading: Radio<String>(
                  value: 'B+',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('B RhD negative(B-)'),
                leading: Radio<String>(
                  value: 'B-',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('O RhD positive(O+)'),
                leading: Radio<String>(
                  value: 'O+',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('O RhD negative(O-)'),
                leading: Radio<String>(
                  value: 'O-',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('AB RhD positive(AB+)'),
                leading: Radio<String>(
                  value: 'AB+',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('AB RhD negative(AB-)'),
                leading: Radio<String>(
                  value: 'AB-',
                  groupValue: _selectedBloodGroup,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    });
                  },
                ),
              ),
            ],
          ),
          if (_selectedBloodGroup == null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please select your blood group',
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlateletsRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Do you have platelets?', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Yes'),
                leading: Radio<String>(
                  value: 'Yes',
                  groupValue: _selectedPlatelets,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPlatelets = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<String>(
                  value: 'No',
                  groupValue: _selectedPlatelets,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPlatelets = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalConditionRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Do you have any medical conditions?', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Yes'),
                leading: Radio<String>(
                  value: 'Yes',
                  groupValue: _selectedMedicalCondition,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedMedicalCondition = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<String>(
                  value: 'No',
                  groupValue: _selectedMedicalCondition,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedMedicalCondition = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrinkingSmokingRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Do you drink or smoke?', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Yes'),
                leading: Radio<String>(
                  value: 'Yes',
                  groupValue: _selectedDrinkingSmoking,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDrinkingSmoking = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<String>(
                  value: 'No',
                  groupValue: _selectedDrinkingSmoking,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDrinkingSmoking = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDonateBloodRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Will you donate blood if you stay close to needy', style: TextStyle(fontSize: 16.0)),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Yes'),
                leading: Radio<String>(
                  value: 'Yes',
                  groupValue: _selectedDonateBlood,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDonateBlood = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<String>(
                  value: 'No',
                  groupValue: _selectedDonateBlood,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDonateBlood = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Upload a relevant file (if any)', style: TextStyle(fontSize: 16.0)),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                setState(() {
                  _filePath = result.files.single.path;
                });
              }
            },
            child: Text('Choose File'),
          ),
          if (_filePath != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected file: $_filePath',
                style: TextStyle(color: Colors.green),
              ),
            ),
        ],
      ),
    );
  }
}

