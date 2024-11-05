import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final List<String> _category = ['Blogify', 'Flutter', 'Django', 'C#'];
  String? _selectedCategory;
  String? _selectedPriority;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}"
            .split(' ')[0]; // Format date to YYYY-MM-DD
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        // Format time to HH:MM AM/PM
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: double.infinity,
                  // height: size.height / 4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF3B9DD8), Colors.blue.shade100])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // Align text to the start
                                mainAxisSize: MainAxisSize.min,
                                // Prevents taking too much vertical space
                                children: const [
                                  Text(
                                    "Hello Roman ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      "Toady you have 9 tasks remaining !",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/main_img.jpg',
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            width: size.width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white38,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today Reminder !",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      "Competing Elevator GUI",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/bell1.png',
                                  height: 45,
                                  width: 45,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Second Container
              Positioned(
                top: size.height / 4,
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    height: size.height - size.height / 5,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white, // Fixed color to white
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add TODO",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight
                                      .w600), // Changed text color to black
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 20),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: "Your Todo",
                                        border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 18),
                                        // width: size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // Low Priority
                                            Material(
                                              elevation: 2,
                                              color: Colors.blue.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Row(
                                                  children: [
                                                    Radio<String>(
                                                      value: 'Low',
                                                      groupValue:
                                                          _selectedPriority,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedPriority =
                                                              value; // Update selected priority
                                                        });
                                                      },
                                                    ),
                                                    Icon(Icons.low_priority,
                                                        size: 20,
                                                        color: Colors.green),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('Low'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Material(
                                              elevation: 2,
                                              color: Colors.blue.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Row(
                                                  children: [
                                                    Radio<String>(
                                                      value: 'Medium',
                                                      groupValue:
                                                          _selectedPriority,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedPriority =
                                                              value; // Update selected priority
                                                        });
                                                      },
                                                    ),
                                                    Icon(Icons.priority_high,
                                                        size: 20,
                                                        color: Colors.orange),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('Medium'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Material(
                                              color: Colors.blue.shade50,
                                              elevation: 2,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Row(
                                                  children: [
                                                    Radio<String>(
                                                      value: 'High',
                                                      groupValue:
                                                          _selectedPriority,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedPriority =
                                                              value; // Update selected priority
                                                        });
                                                      },
                                                    ),
                                                    Icon(Icons.warning,
                                                        size: 20,
                                                        color: Colors.red),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('High'),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: DropdownButton<String>(
                                        dropdownColor: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(20),
                                        hint: Text(
                                          "Select Category",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 17), // Hint color
                                        ),
                                        value: _selectedCategory,
                                        items: _category.map((category) {
                                          return DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(
                                              category,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18), // Text color
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCategory = value;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black, // Icon color
                                        ),
                                        isExpanded: false,
                                        underline:
                                            SizedBox(), // Removes the underline
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // Aligns fields evenly
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  // This allows the TextField to take up available space
                                                  child: TextField(
                                                    controller: _dateController,
                                                    decoration: InputDecoration(
                                                      labelText: 'Date',
                                                      // Changed label to "Date"
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  child: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.black54),
                                                ),
                                                // Calendar icon for date
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 30),
                                          // Space between the two main fields
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  // This allows the TextField to take up available space
                                                  child: TextField(
                                                    controller: _timeController,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Time',
                                                      // Changed label to "Time"
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _selectTime(context);
                                                  },
                                                  child: Icon(Icons.access_time,
                                                      color: Colors.black54),
                                                ),
                                                // Time icon for time input
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 20),
                                        child: Material(
                                          elevation: 5,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: size.width / 1.5,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 60),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: const [
                                                      Colors.pink,
                                                      Colors.blue
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.task,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Add Todo",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
