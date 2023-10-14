import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_task.dart';
import 'package:project_n2/providers/providers.dart';
import 'package:reorderables/reorderables.dart';

// final _walletsScaffoldKey = GlobalKey<ScaffoldState>();

class ToDoScreen extends ConsumerStatefulWidget {
  const ToDoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends ConsumerState<ToDoScreen> {
  late final PageController _pageController =
      PageController(initialPage: ref.read(screenIndexProvider));

  @override
  Widget build(BuildContext context) {
    final bool isEditing = ref.watch(screenEditingProvider);
    final dataManager = ref.watch(dataManagerProvider);
    final toDoLists = dataManager.toDoLists;
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            ref.read(screenIndexProvider.notifier).state = value;
          },
          children: [
            for (var i = 0; i < toDoLists.length; i++)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(toDoLists[i].name),
                    ),
                    Builder(builder: (context) {
                      final children = [
                        for (var y = 0; y < toDoLists[i].tasks.length; y++)
                          Column(
                            key: UniqueKey(),
                            children: [
                              Row(
                                children: [
                                  if (isEditing)
                                    const Icon(
                                      Icons.drag_handle,
                                    ),
                                  Expanded(
                                    child: Card(
                                      child: CheckboxListTile(
                                        enabled: !isEditing,
                                        title: Text(toDoLists[i].tasks[y].task),
                                        value: toDoLists[i].tasks[y].complete,
                                        onChanged: (newComplete) {
                                          ToDoTask newTask =
                                              toDoLists[i].tasks[y];
                                          newTask.complete = newComplete!;
                                          ref
                                              .read(dataManagerProvider)
                                              .insertToDoTaskByListID(
                                                newTask,
                                                toDoLists[i].id!,
                                              );
                                        },
                                      ),
                                    ),
                                  ),
                                  if (isEditing)
                                    IconButton(
                                      onPressed: () {
                                        ref
                                            .read(dataManagerProvider)
                                            .deleteToDoTask(
                                                toDoLists[i].tasks[y],
                                                toDoLists[i].id!);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                ],
                              ),
                              if (toDoLists[i].tasks[y].isDaily && kDebugMode)
                                Text(
                                    'Creation Date: ${toDoLists[i].tasks[y].creationDate.toString()}'),
                              if (toDoLists[i].tasks[y].isDaily && kDebugMode)
                                Text(
                                    'Completion Date: ${toDoLists[i].tasks[y].completionDate.toString()}'),
                            ],
                          ),
                        // const ListTile(
                        //   title: Text('Title'),
                        //   subtitle: Text('Subtitle'),
                        // ),
                      ];
                      return isEditing
                          ? ReorderableColumn(
                              scrollController: ScrollController(),
                              children: children,
                              onReorder: (int oldIndex, int newIndex) => ref
                                  .read(dataManagerProvider)
                                  .reorderToDoTask(
                                      oldIndex, newIndex, toDoLists[i].id!),
                            )
                          : Column(
                              children: children,
                            );
                    }),
                  ],
                ),
              ),
          ],
        ),
        // Positioned(
        //   right: 0,
        //   top: 0,
        //   child: Material(
        //     color: Colors.transparent,
        //     clipBehavior: Clip.antiAlias,
        //     shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(20))),
        //     child: IconButton(
        //       onPressed: () {
        //         //
        //       },
        //       icon: const Icon(
        //         Icons.menu,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
