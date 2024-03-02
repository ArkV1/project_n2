import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_task.dart';

final _formKey = GlobalKey<FormState>();

class ToDoListsDialog extends ConsumerStatefulWidget {
  const ToDoListsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ToDoListsDialogState();
}

class _ToDoListsDialogState extends ConsumerState<ToDoListsDialog> {
  TextEditingController toDoListsNameController = TextEditingController();

  ToDoList? toDoList;
  bool creation = false;
  bool listViewActions = true;
  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    //final userData = ref.watch(userDataProvider);
    final toDoLists = ref.watch(toDoListsProvider);
    toDoList != null
        ? toDoListsNameController.text = toDoList!.name
        : toDoListsNameController.text = '';
    return AlertDialog(
      title: Row(
        children: [
          const Spacer(),
          const Expanded(
            flex: 5,
            child: Text(
              'To Do Lists managment',
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: !creation
                ? Container(
                    margin: const EdgeInsets.only(left: 6),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: InkWell(
                      child: listViewActions
                          ? const Icon(Icons.settings_applications_outlined)
                          : const Icon(Icons.settings_applications),
                      onTap: () {
                        setState(() {
                          listViewActions = !listViewActions;
                        });
                      },
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      content: toDoLists.when(
        data: (toDoLists) {
          return Container(
            width: double.maxFinite,
            constraints: const BoxConstraints(minHeight: 200),
            child: () {
              if (creation) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          constraints: const BoxConstraints(minWidth: 225),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "To Do List's name",
                                  errorMaxLines: 3,
                                  errorStyle: TextStyle(
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                controller: toDoListsNameController,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      advancedSettings = !advancedSettings;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Advanced settings'),
                                      Icon(
                                        advancedSettings
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (advancedSettings)
                                const Text('Advanced settings enabled'),
                            ],
                          ),
                        ),
                      ),

                      ///////////////////////////////////////////////////////////////////////////
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 48.0),
                      //   child: Text(
                      //     'Adding wallet',
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() {
                              advancedSettings = false;
                              creation = false;
                            }),
                            child: const Row(
                              children: [
                                Text('Return'),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(Icons.keyboard_return),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() {
                              advancedSettings = false;
                              if (toDoList == null) {
                                ref
                                    .read(toDoListsProvider.notifier)
                                    .insertToDoList(
                                      ToDoList(
                                        name: toDoListsNameController.text,
                                        tasksRelation: ToMany<ToDoTask>(),
                                      ),
                                    );
                              } else {
                                ref
                                    .read(toDoListsProvider.notifier)
                                    .insertToDoList(
                                      toDoList!.copyWith(
                                        name: toDoListsNameController.text,
                                      ),
                                    );
                              }
                              creation = false;
                            }),
                            child: const Row(
                              children: [
                                Text('Add'),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.0),
                                  child: Icon(Icons.add_box_outlined),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (toDoLists.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Text(
                          'No to do lists added yet',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        for (var toDoList in toDoLists)
                          ListTile(
                            title: Text(toDoList.name),
                            //subtitle: Text(wallet.defaultCurrency),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (listViewActions)
                                  InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.edit),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        this.toDoList = toDoList;
                                        creation = true;
                                        // listViewActions = false;
                                      });
                                    },
                                  ),
                                if (listViewActions)
                                  InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 3),
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(Icons.remove),
                                    ),
                                    onTap: () {
                                      ref
                                          .read(toDoListsProvider.notifier)
                                          .deleteToDoList(toDoList);
                                      // ref
                                      //     .read(dataManagerProvider)
                                      //     .deleteAppWidget(wallet.id!);
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ///////////////////////////////////////////////////
                        if (listViewActions)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  advancedSettings = !advancedSettings;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Advanced settings'),
                                  Icon(
                                    advancedSettings
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (advancedSettings && listViewActions)
                      DropdownButtonFormField<ToDoList>(
                        focusNode: FocusNode(canRequestFocus: false),
                        //isExpanded: true,
                        decoration: const InputDecoration(
                          labelText: 'Default to do list:',
                          prefixIcon: Icon(Icons.wallet),
                        ),
                        value: toDoLists.firstOrNull,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        onChanged: (ToDoList? toDoList) {
                          //This is called when the user selects an item.
                          // setState(() {
                          //   ref.read(creationQuizProvider.notifier).category = category;
                          // });
                        },
                        items: toDoLists.map<DropdownMenuItem<ToDoList>>(
                            (ToDoList toDoList) {
                          return DropdownMenuItem<ToDoList>(
                            value: toDoList,
                            child: Text(
                              toDoList.name,
                            ),
                          );
                        }).toList(),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Row(
                              children: [
                                Text('Return'),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(Icons.keyboard_return),
                                )
                              ],
                            ),
                          ),
                          if (listViewActions)
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  advancedSettings = false;
                                  toDoList = null;
                                  creation = true;
                                  // listViewActions = false;
                                });

                                // ref.read(walletsProvider).addWallet(
                                //     Wallet('Wallet ${wallets.length + 1}', 'USD'));
                              },
                              child: const Row(
                                children: [
                                  Text('Add'),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Icon(Icons.add_box_outlined),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                );
              }
            }(),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
