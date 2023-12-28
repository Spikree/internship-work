import 'package:flutter/material.dart';

void main() {
  runApp(PersonalDetails());
}

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nmaeController = TextEditingController();
  TextEditingController _employeeCodeController = TextEditingController();
  TextEditingController _currentDesignationController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _alternateMobileNoController = TextEditingController();

  List<String> listItems = [
    "VIT, Pune",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];

  List<String> listGenders = [
    "Male",
    "Female",
    "Others",
  ];

  List<String> listBloodGroup = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  String? _emailError;
  String? _nameError;
  String? _orgError;
  String? _employeeCodeError;
  String? _joiningDateError;
  String? _currentDesignationError;
  String? _dateOfBirthError;
  String? _genderError;
  String? _bloodGroupError;
  String? _mobileNumberError;
  String? _alternateMobileNumberError;

  void _clearErrors() {
    setState(() {
      _nameError = null;
      _emailError = null;
      _orgError = null;
      _employeeCodeError = null;
      _joiningDateError = null;
      _currentDesignationError = null;
      _dateOfBirthError = null;
      _genderError = null;
      _bloodGroupError = null;
      _mobileNumberError = null;
      _alternateMobileNumberError = null;
    });
  }

  String? selectedOrg;
  String? selectedGender;
  String? selectedBloodGroup;

  DateTime? _selectedDateofBirth;
  DateTime? _selectedDateofJoining;

  Future<void> _selectDateofBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDateofBirth) {
      setState(() {
        _selectedDateofBirth = picked;
      });
    }
  }

  Future<void> _selectDateofJoining(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDateofJoining) {
      setState(() {
        _selectedDateofJoining = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SafeArea(
            child: Row(
              children: [
                Image(
                  image: AssetImage('images/signup.png'),
                  height: 60,
                  width: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('John Doe'), // Replace with the user's name
                accountEmail: Text('john.doe@example.com'),
                // Replace with the user's email
                currentAccountPicture: CircleAvatar(
                  // Replace with the user's profile picture
                  backgroundImage: AssetImage('images/profile_picture.jpg'),
                ),
              ),
              ListTile(
                title: const Text(
                  'Personal',
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Photo'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Emergency Contact'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Address'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Family details'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Health details'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Health Insurance'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Journey @ VI group'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Personal details',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _emailError,
                      // errorText: null;
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                        setState(() {
                          _emailError = 'Enter a valid email address';
                        });
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nmaeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _nameError,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _nameError = "Name can't be empty";
                        });
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedOrg,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOrg = newValue!;
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
                      errorText: _orgError,
                    ),
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _orgError = "Please select an organization";
                        });
                        return "Please select an organization";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Employee code',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _employeeCodeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Employee code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _employeeCodeError,
                    ),
                    validator: (value) {
                      // You need to add a condition here. For example:
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _employeeCodeError = "Employee code can't be empty";
                        });
                        return "Employee code can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'joining date',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'DD//MM//YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _joiningDateError,
                    ),
                    readOnly: true,
                    onTap: () => _selectDateofJoining(context),
                    controller: TextEditingController(
                      text: _selectedDateofBirth != null
                          ? "${_selectedDateofJoining!.day}/${_selectedDateofJoining!.month}/${_selectedDateofJoining!.year}"
                          : '',
                    ),
                    validator: (value) {
                      if (_selectedDateofJoining == null) {
                        return 'Please select a joining date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Current Designation',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _currentDesignationController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Current Designation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _currentDesignationError,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _currentDesignationError =
                              "This field cannot be empty";
                        });
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: Null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'DD//MM//YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _dateOfBirthError,
                    ),
                    readOnly: true,
                    onTap: () => _selectDateofBirth(context),
                    controller: TextEditingController(
                      text: _selectedDateofBirth != null
                          ? "${_selectedDateofBirth!.day}/${_selectedDateofBirth!.month}/${_selectedDateofBirth!.year}"
                          : '',
                    ),
                    validator: (value) {
                      if (_selectedDateofBirth == null) {
                        return 'Please select a date of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: listGenders.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.woman_rounded),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Select Gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _genderError,
                    ),
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _genderError = "Please select your gender";
                        });
                        return "Please select your gender";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Blood Group',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedBloodGroup,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBloodGroup = newValue!;
                      });
                    },
                    items: listBloodGroup.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.bloodtype),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'blood group',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _bloodGroupError,
                    ),
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _bloodGroupError = "Please select a blood group";
                        });
                        return "Please select a blood group";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Mobile No.',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _mobileNoController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Mobile no.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _mobileNumberError,
                    ),
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        setState(() {
                          _mobileNumberError =
                              "Enter a valid 10-digit mobile number.";
                        });
                        return "Enter a valid 10-digit mobile number.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Alternate mobile no.',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _alternateMobileNoController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Alternate mobile no.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      errorText: _alternateMobileNumberError,
                    ),
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        setState(() {
                          _alternateMobileNumberError =
                              "Enter a valid 10-digit mobile number.";
                        });
                        return "Enter a valid 10-digit mobile number.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            _clearErrors();
                            // Print all the details
                            print("Email: ${_emailController.text}");
                            print("Full Name: ${_nmaeController.text}");
                            print("Organization: $selectedOrg");
                            print(
                                "Employee Code: ${_employeeCodeController.text}");
                            print("Joining Date: $_selectedDateofJoining");
                            print(
                                "Current Designation: ${_currentDesignationController.text}");
                            print("Date of Birth: $_selectedDateofBirth");
                            print("Gender: $selectedGender");
                            print("Blood Group: $selectedBloodGroup");
                            print("Mobile No.: ${_mobileNoController.text}");
                            print(
                                "Alternate Mobile No.: ${_alternateMobileNoController.text}");

                            // You can add logic to save the data to a database or perform any other actions here
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
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Powered By EduplusCampus-VGESPL',
                          style: TextStyle(
                            color: Color.fromARGB(255, 49, 7, 238),
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
    );
  }
}
