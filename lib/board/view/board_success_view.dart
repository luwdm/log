import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_repository/task_repository.dart';

class BoardSuccessView extends StatelessWidget {
  const BoardSuccessView({
    required this.tasks,
    super.key,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return ListTile(
          leading: Checkbox(value: true, onChanged: (value) {}),
          title: Text(task.description),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
