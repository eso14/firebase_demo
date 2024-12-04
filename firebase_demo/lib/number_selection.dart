import 'package:flutter/material.dart';

import 'app_state.dart';
import 'src/widgets.dart';

import 'package:flutter/src/services/text_formatter.dart';



class numWidget extends StatefulWidget {
  final Function(int) onAttendeeChange;
  final int attendees;
  const numWidget({Key? key, required this.attendees, required this.onAttendeeChange,}) : super(key: key);

  @override
  State<numWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<numWidget> {

  final _controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("Amount of Attendees"),
              const SizedBox(width: 8),
              SizedBox(width: 60, child: TextField(
                controller: _controler,
                decoration: const InputDecoration(hintText: ''),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly],
              onSubmitted: (value) {
                int attendees = int.tryParse(value)?? 0;
                widget.onAttendeeChange(attendees);

              },
              ),
              ),
              
              const SizedBox(width: 8),
            ],
          ),

              );
       
  }
}