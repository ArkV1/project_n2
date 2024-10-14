import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:project_n2/core/models/app_settings.dart';
import 'package:project_n2/core/models/objectbox.dart';
import 'package:project_n2/core/models/shared_prefs.dart';

class DatabaseManagerDialog extends ConsumerStatefulWidget {
  const DatabaseManagerDialog({super.key});

  @override
  ConsumerState<DatabaseManagerDialog> createState() => _DatabaseManagerDialogState();
}

class _DatabaseManagerDialogState extends ConsumerState<DatabaseManagerDialog> {
  File? imported;
  File? current;

  @override
  void initState() {
    final currentDirectory = ref.read(currentDirectoryProvider);
    if (currentDirectory.hasValue && !currentDirectory.isLoading) {
      current = File(ref.read(currentDirectoryProvider).value!.path);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentDirectory = ref.watch(currentDirectoryProvider);
    if (current == null && currentDirectory.hasValue) {
      current = File(currentDirectory.value!.path);
    }
    return AlertDialog(
      title: const Text('Database Manager'),
      content: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Text('This is an empty dialog.'),
            // TODO Database cleanup
            // Container(
            //   margin: const EdgeInsets.only(bottom: 8),
            //   decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(32),
            //     ),
            //     border: Border.all(
            //       width: 1,
            //       style: BorderStyle.solid,
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextButton(
            //         onPressed: () async {
            //           db.close();
            //           Directory docDir =
            //               await getApplicationDocumentsDirectory();
            //           print(docDir);
            //           Directory(
            //             path.join(docDir.path, 'objectbox', '/data.mdb'),
            //           ).delete();
            //         },
            //         child: const Text(
            //           'Database cleanup',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.red,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (currentDirectory.hasValue) {
                              final docsDir = currentDirectory.value!;
                              final params = SaveFileDialogParams(
                                sourceFilePath: path.join(docsDir.path, "objectbox", "data.mdb"),
                              );
                              FlutterFileDialog.saveFile(params: params);
                            }
                            //
                          },
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                currentDirectory.when(
                                  data: (docsDir) {
                                    final size = File(
                                      path.join(docsDir.path, "objectbox", "data.mdb"),
                                    ).lengthSync();
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Current',
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          MdiIcons.fileDocumentOutline,
                                          size: 56,
                                        ),
                                        Text(
                                          'Size: ${size / 1024} KB',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                                  loading: () => const CircularProgressIndicator(),
                                  error: (error, stackTrace) {
                                    return Text(
                                      'Error: $error',
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              '\nExport',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Create backup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              if (currentDirectory.hasValue) {
                                const params = OpenFileDialogParams(
                                  dialogType: OpenFileDialogType.document,
                                  // sourceType: SourceType.photoLibrary,
                                );
                                final filePath = await FlutterFileDialog.pickFile(
                                  params: params,
                                );
                                if (filePath != null) {
                                  setState(() {
                                    imported = File(filePath);
                                  });
                                }
                                debugPrint(filePath);
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        imported == null ? '' : 'Imported',
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                        imported == null
                                            ? MdiIcons.fileHidden
                                            : MdiIcons.fileDocumentArrowRightOutline,
                                        size: 56,
                                      ),
                                      Text(
                                        imported == null
                                            ? 'Empty'
                                            : 'Size: ${imported!.lengthSync() / 1024} MB',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              '\nImport',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Restore backup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () async {
            //         const params = OpenFileDialogParams(
            //           dialogType: OpenFileDialogType.document,

            //           // sourceType: SourceType.photoLibrary,
            //         );
            //         final filePath =
            //             await FlutterFileDialog.pickFile(params: params);
            //         print(filePath);
            //       },
            //       child: const Text(
            //         'Import\nRestore',
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     ElevatedButton(
            //       onPressed: () async {
            //         final docsDir = await getApplicationDocumentsDirectory();
            //         debugPrint('Database file exists???: ${File(
            //           path.join(docsDir.path, "objectbox", "data.mdb"),
            //         ).existsSync()}');
            //         final params = SaveFileDialogParams(
            //           sourceFilePath:
            //               path.join(docsDir.path, "objectbox", "data.mdb"),
            //           // fileName: 'data.mdb',
            //         );
            //         final filePath =
            //             await FlutterFileDialog.saveFile(params: params);
            //         print(filePath);
            //       },
            //       child: const Text(
            //         'Export\nBackup',
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            if (imported != null)
              Expanded(
                child: TextButton(
                    child: const Text(
                      'Restore\nfrom backup',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      await ObjectBox().databaseOverwrite(imported!.readAsBytesSync()).then(
                        (_) {
                          ref.invalidate(sharedPrefsProvider);
                          ref.invalidate(themeManagerProvider);
                          ref.invalidate(componentMapProvider);
                        },
                      );
                      setState(
                        () {
                          current = null;
                          imported = null;
                        },
                      );
                    }),
              ),
            if (imported != null)
              Expanded(
                child: TextButton(
                  child: const Text(
                    'Clean\nimported file',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    setState(() {
                      imported = null;
                    });
                    //
                  },
                ),
              ),
          ],
        ),
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
