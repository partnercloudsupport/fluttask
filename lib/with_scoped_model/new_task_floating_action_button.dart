import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/task.dart';
import 'package:fluttask/with_scoped_model/task_list_model.dart';

class NewTaskFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('New Task'),
        elevation: 2,
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      constraints: BoxConstraints.tightFor(height: 91),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ScopedModelDescendant<TaskListModel>(
                            builder: (context, _, model) => TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'New Task',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  autofocus: true,
                                  onFieldSubmitted: (title) {
                                    Navigator.of(context).pop();

                                    model.addTask(Task(
                                      title: title,
                                      createdAt: DateTime.now(),
                                    ));
                                  },
                                ),
                            rebuildOnChange: false,
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
      );
}

typedef void NewTaskAdditionCallback(Task task);
