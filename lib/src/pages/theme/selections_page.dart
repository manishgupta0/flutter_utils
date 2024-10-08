import 'package:flutter/material.dart';
import 'package:flutter_utils/src/pages/theme/widgets/custom_list_view.dart';
import 'package:intl/intl.dart';

class SelectionsPage extends StatelessWidget {
  const SelectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SwitchEnabled(),
        _SwitchDisabled(),
        const Divider(height: 0),
        _CheckboxEnabled(),
        _CheckboxDisabled(),
        const Divider(height: 0),
        _Radio(),
        const Divider(height: 0),
        const Text(
          'Sliders',
          style: TextStyle(fontSize: 16),
        ),
        _SliderEnabled(),
        _SliderEnabledDivisions(),
        _SliderDisabled(),
        const Divider(height: 0),
        _DatePicker(),
        _TimePicker(),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _SwitchEnabled extends StatefulWidget {
  @override
  _SwitchEnabledState createState() => _SwitchEnabledState();
}

class _SwitchEnabledState extends State<_SwitchEnabled> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Switch enabled'),
      trailing: Switch(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

class _SwitchDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Switch disabled'),
      textColor: Theme.of(context).disabledColor,
      trailing: const Switch(
        value: true,
        onChanged: null,
      ),
    );
  }
}

class _CheckboxEnabled extends StatefulWidget {
  @override
  _CheckboxEnabledState createState() => _CheckboxEnabledState();
}

class _CheckboxEnabledState extends State<_CheckboxEnabled> {
  bool? _value = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Checkbox enabled'),
      trailing: Checkbox(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

class _CheckboxDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Checkbox disabled'),
      textColor: Theme.of(context).disabledColor,
      trailing: const Checkbox(
        value: true,
        onChanged: null,
      ),
    );
  }
}

class _Radio extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<_Radio> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [0, 1, 2].map(
        (value) {
          return ListTile(
            title: Text('Radio ${value + 1}'),
            trailing: Radio(
              value: value,
              groupValue: _groupValue,
              onChanged: (int? newValue) => setState(() {
                _groupValue = newValue;
              }),
            ),
          );
        },
      ).toList()
        ..add(
          ListTile(
            title: const Text('Radio disabled'),
            textColor: Theme.of(context).disabledColor,
            trailing: const Radio(
              value: null,
              groupValue: null,
              onChanged: null,
            ),
          ),
        ),
    );
  }
}

class _SliderEnabled extends StatefulWidget {
  @override
  _SliderEnabledState createState() => _SliderEnabledState();
}

class _SliderEnabledState extends State<_SliderEnabled> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 0,
      max: 100,
      label: _value.round().toString(),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

class _SliderEnabledDivisions extends StatefulWidget {
  @override
  _SliderEnabledDivisionsState createState() => _SliderEnabledDivisionsState();
}

class _SliderEnabledDivisionsState extends State<_SliderEnabledDivisions> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 0,
      max: 100,
      divisions: 5,
      label: _value.round().toString(),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

class _SliderDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Slider(
      value: 20,
      min: 0,
      max: 100,
      onChanged: null,
    );
  }
}

class _DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  final _firstDate = DateTime(2018, 12, 4);
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(_dateTime);
    return ListTile(
      title: Text('Date picker: $formattedDate'),
      trailing: ElevatedButton(
        onPressed: () async {
          final dateTime = await showDatePicker(
            context: context,
            initialDate: _dateTime,
            firstDate: _firstDate,
            lastDate: DateTime.now(),
          );

          if (dateTime != null) setState(() => _dateTime = dateTime);
        },
        child: const Text('Pick date'),
      ),
    );
  }
}

class _TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Time picker: ${_timeOfDay.format(context)}'),
      trailing: ElevatedButton(
        onPressed: () async {
          final timeOfDay =
              await showTimePicker(context: context, initialTime: _timeOfDay);

          if (timeOfDay != null) setState(() => _timeOfDay = timeOfDay);
        },
        child: const Text('Pick time'),
      ),
    );
  }
}
