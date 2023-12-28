import 'package:flutter/material.dart';

void main() {
  runApp(EnterDetails());
}

class EnterDetails extends StatefulWidget {
  const EnterDetails({super.key});

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _employeeCodeController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _employeeCodeError;
  String? _mobileNumberError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? selectedValue;
  String? _organizationError;

  bool _obscurePassword = true;

  List<String> listItems = [
    "VIT, Pune",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];

  void _clearNameError() {
    setState(() {
      _nameError = null;
    });
  }

  void _clearEmployeeError() {
    setState(() {
      _employeeCodeError = null;
    });
  }

  void _clearMobileNumberError() {
    setState(() {
      _mobileNumberError = null;
    });
  }

  void _clearPasswordError() {
    setState(() {
      _passwordError = null;
    });
  }

  void _clearConfirmPasswordError() {
    setState(() {
      _confirmPasswordError = null;
    });
  }

  void _clearOrgError() {
    setState(() {
      _organizationError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Image.asset('images/signup.png'),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Sign-up',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Full name',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_3),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _nameError,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _nameError = 'Enter your full name';
                          });
                          return 'Enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Employee Code',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _employeeCodeController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.badge),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Employee code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _employeeCodeError,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _employeeCodeError = 'Enter your employee code';
                          });
                          return 'Enter your employee code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Mobile No',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _mobileNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.call),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Mobile No',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _mobileNumberError,
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length > 10 ||
                            value.length < 10) {
                          setState(() {
                            _mobileNumberError = 'Enter a valid mobile number';
                          });
                          return 'Enter a valid mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Organization',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: listItems.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.corporate_fare),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Select organization',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _organizationError,
                      ),
                      validator: (value) {
                        if (value == null) {
                          setState(() {
                            _organizationError =
                                "Please select an organization";
                          });
                        }
                      },
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Set password',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Set password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _passwordError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _passwordError = 'Enter a password';
                          });
                          return 'Enter a password';
                        } else if (value.length < 8) {
                          setState(() {
                            _passwordError =
                                'Password should be at least 8 characters long';
                          });
                          return 'passwords must contain more than 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Confirm password',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        errorText: _confirmPasswordError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _confirmPasswordError = 'Confirm your password';
                          });
                          return 'Confirm your password';
                        } else if (value != _passwordController.text) {
                          setState(() {
                            _confirmPasswordError = 'Passwords do not match';
                          });
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _clearNameError();
                              _clearEmployeeError();
                              _clearMobileNumberError();
                              _clearOrgError();
                              _clearPasswordError();
                              _clearConfirmPasswordError();
                              // Extract values from controllers
                              String fullName = _fullNameController.text;
                              int employeeCode =
                                  int.parse(_employeeCodeController.text);
                              int mobileNo =
                                  int.parse(_mobileNumberController.text);
                              String password = _passwordController.text;
                              String confirmPassword =
                                  _confirmPasswordController.text;

                              print('Full Name: $fullName');
                              print('Employee Code: $employeeCode');
                              print('Mobile No: $mobileNo');
                              print('Password: $password');
                              print('Confirm Password: $confirmPassword');
                              print('selected value: $selectedValue');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                                height: 3,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Powered By EduplusCampus-VGESPL',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'images/logo.png',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
