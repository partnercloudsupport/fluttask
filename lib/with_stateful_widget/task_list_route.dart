import 'package:flutter/material.dart';
import 'package:fluttask/with_stateful_widget/task_list_screen.dart';

Route createTaskListRoute() =>
    MaterialPageRoute(builder: (context) => TaskListScreen());
