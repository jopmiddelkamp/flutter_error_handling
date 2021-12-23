import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';
import 'package:get_it/get_it.dart';

import '../../../flutter_error_handling_ui.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  Widget _blocProvider({
    required Widget child,
  }) {
    return BlocProvider(
      create: (_) => UsersCubit(
        userRepository: GetIt.instance(),
      )..init(),
      child: child,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocConsumer<UsersCubit, UsersState>(
      listenWhen: (_, current) => current is UsersStateFailed,
      listener: (context, state) {
        if (state is UsersStateFailed) {
          showFailureDialog(
            context,
            state.failure,
          );
        }
      },
      buildWhen: (_, current) => current is! UsersStateFailed,
      builder: (context, state) {
        return state.map(
          loading: (_) => const _LoadingIndicator(),
          loaded: (state) => _List(
            state: state,
          ),
          failed: (state) => PullToRefresh(
            onRefresh: context.read<UsersCubit>().reload,
            child: FailurePlaceholder(
              state.failure,
            ),
          ),
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UsersStateLoaded state;

  @override
  Widget build(
    BuildContext context,
  ) {
    return PullToRefresh(
      onRefresh: context.read<UsersCubit>().reload,
      child: ListView.builder(
        itemBuilder: (_, index) => _ListItem(
          user: state.users[index],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListTile(
      title: Text(user.fullName),
      subtitle: Text(user.email),
    );
  }
}
