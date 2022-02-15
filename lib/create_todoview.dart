import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create Todo',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              maxLines: 1,
              controller: _titleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: "Please enter your title",
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Color.fromRGBO(37, 42, 103, 1),
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title field is required';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              maxLines: 1,
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: "Please enter your description",
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Color.fromRGBO(37, 42, 103, 1),
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Description field is required';
                }
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      maxLines: 1,
                      controller: _dateController,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((selectedDate) {
                          // ignore: avoid_print
                          print(selectedDate);
                          final DateFormat _dateFormat =
                              DateFormat('dd/MM/yyyy');
                          _dateController.text =
                              _dateFormat.format(selectedDate!);
                        });
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(37, 43, 103, 1))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(37, 43, 103, 1))),
                        hintText: "Please enter your date",
                        labelText: 'Date',
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(37, 42, 103, 1),
                            fontWeight: FontWeight.w600),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date field is required';
                        }
                      }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextFormField(
                      maxLines: 1,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((selectedTime) {
                          // ignore: avoid_print
                          _timeController.text = selectedTime!.format(context);
                        });
                      },
                      controller: _timeController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(37, 43, 103, 1))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(37, 43, 103, 1))),
                        hintText: "Please enter your time",
                        labelText: 'Time',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time field is required';
                        }
                      }),
                )
              ],
            ),
            const SizedBox(height: 35),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
                    padding: const EdgeInsets.all(20)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //send data to backend
                    // ignore: avoid_print
                    print('success');
                    // ignore: avoid_print
                    print(_timeController.text);
                    // ignore: avoid_print
                    print(_descriptionController.text);
                    // ignore: avoid_print
                    print(_dateController.text + "" + _timeController.text);
                  } else {
                    //validation failed!
                    // ignore: avoid_print
                    print('failed');
                  }
                },
                child:
                    const Text('Create', style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
