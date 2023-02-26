// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const List<String> currencyList = <String>[
  'USD',
  'EURO',
  'RUB',
  'NIS',
];

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  String? validatorIsEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void snackBar(String snackText) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(content: Text(snackText)),
        )
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }

  final _subFormKey = GlobalKey<FormState>();

  TextEditingController walletNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String currencyListDropdownValue = currencyList.first;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Add wallet'),
          content: StatefulBuilder(
            builder: (
              BuildContext context,
              StateSetter setState,
            ) {
              return Form(
                key: _subFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Wallet name',
                      ),
                      controller: walletNameController,
                      validator: validatorIsEmpty,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Default currency',
                      ),
                      value: currencyListDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      //style: const TextStyle(color: Colors.deepPurple),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          // switch (value) {
                          //   case 'System Default':
                          //     theme.changeTheme(ThemeMode.system);
                          //     break;
                          //   case 'Black (OLED)':
                          //     // theme.changeTheme(ThemeMode.dark, 'OLED');
                          //     break;
                          //   case 'Dark':
                          //     theme.changeTheme(ThemeMode.dark);
                          //     break;
                          //   case 'Light':
                          //     theme.changeTheme(ThemeMode.light);
                          //     break;
                          // }
                          // themeListdropdownValue = value!;
                        });
                      },
                      items: currencyList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondary)),
                        onPressed: () {
                          if (_subFormKey.currentState!.validate()) {
                            Navigator.pop(context);
                            snackBar('Processing Data');
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
    ;
  }
}
