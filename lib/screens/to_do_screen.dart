import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_task.dart';
import 'package:project_n2/providers/providers.dart';

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

    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) {
        ref.read(screenIndexProvider.notifier).state = value;
      },
      itemBuilder: (context, i) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(toDoLists[i].name),
            ),
            Expanded(
              child: ReorderableListView.builder(
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, y) {
                  return GestureDetector(
                    key: ValueKey('${toDoLists[i].tasks[y].id}'),
                    onLongPress: isEditing ? null : () {},
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AnimatedCrossFade(
                              key: ValueKey(
                                  '${toDoLists[i].tasks[y].id}dragHandle'),
                              duration: const Duration(milliseconds: 125),
                              firstChild: const Icon(
                                Icons.drag_handle,
                              ),
                              secondChild: const SizedBox.shrink(),
                              crossFadeState: isEditing
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                            Expanded(
                              child: Card(
                                child: CheckboxListTile(
                                  enabled: !isEditing,
                                  title: Text(toDoLists[i].tasks[y].task ?? ''),
                                  value: toDoLists[i].tasks[y].complete,
                                  onChanged: (newComplete) {
                                    ToDoTask newTask = toDoLists[i].tasks[y];
                                    newTask.complete = newComplete!;
                                    ref
                                        .read(dataManagerProvider)
                                        .insertToDoTask(
                                          newTask,
                                        );
                                  },
                                ),
                              ),
                            ),
                            AnimatedCrossFade(
                              key: ValueKey(
                                  '${toDoLists[i].tasks[y].id}removeButton'),
                              duration: const Duration(milliseconds: 125),
                              firstChild: IntrinsicHeight(
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  margin: const EdgeInsets.only(right: 4.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      foregroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(dataManagerProvider)
                                          .deleteToDoTask(
                                              toDoLists[i].tasks[y]);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: const SizedBox.shrink(),
                              crossFadeState: isEditing
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
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
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  newIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
                  ref
                      .read(dataManagerProvider)
                      .reorderToDoTask(oldIndex, newIndex, toDoLists[i]);
                },
                itemCount: toDoLists[i].tasks.length,
              ),
            ),
          ],
        );
      },
      itemCount: toDoLists.length,
    );
  }
}
