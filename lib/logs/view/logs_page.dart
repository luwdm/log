import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';
import 'package:work_log/logs/cubit/logs_cubit.dart';

class const LogsPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogsCubit(context.read<LogRepository>()),
      child: const LogsPageView(),
    );
  }
}

@Preview()
Widget logsPageViewPreview() {
  return LogsPageView();
}

class const LogsPageView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text('Logs')),
          const _SliverLogsBody(),
        ],
      ),
    );
  }
}

class const _SliverLogsBody({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.select((LogsCubit cubit) => cubit.state);

    return switch (state) {
      LogsLoadingState() => const SliverToBoxAdapter(child: LoadingIndicator()),
      LogsFailureState() => const SliverToBoxAdapter(child: LogsError()),
      LogsSuccessState() => SliverLogList(logs: state.logs),
    };
  }
}

class const LoadingIndicator({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class const LogsError({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Error');
  }
}

class const SliverLogList({required final List<LogTableData> logs, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {},
      separatorBuilder: (context, index) {},
    );
  }
}
