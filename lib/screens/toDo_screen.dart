import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/todo/todo_list.dart';
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
    final bool editing = ref.watch(screenEditingProvider);
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(toDoLists[i].name),
                  ),
                  ReorderableColumn(
                    scrollController: ScrollController(),
                    children: [
                      for (var y = 0; y < toDoLists[i].tasks.length; y++)
                        Row(
                          key: UniqueKey(),
                          children: [
                            Expanded(
                              child: Card(
                                child: CheckboxListTile(
                                  title: Text(toDoLists[i].tasks[y].task),
                                  value: toDoLists[i].tasks[y].complete,
                                  onChanged: (newComplete) {
                                    ToDoTask newTask = toDoLists[i].tasks[y];
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
                            if (editing)
                              IconButton(
                                onPressed: () {
                                  ref.read(dataManagerProvider).deleteToDoTask(
                                      toDoLists[i].tasks[y], toDoLists[i].id!);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                          ],
                        ),
                      // const ListTile(
                      //   title: Text('Title'),
                      //   subtitle: Text('Subtitle'),
                      // ),
                    ],
                    onReorder: (int oldIndex, int newIndex) => ref
                        .read(dataManagerProvider)
                        .reorderToDoTask(oldIndex, newIndex, toDoLists[i].id!),
                  ),
                ],
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
