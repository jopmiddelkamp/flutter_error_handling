import 'package:flutter/material.dart';

class PullToRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const PullToRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    if (child is ScrollView) {
      return child;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: constraints.maxHeight,
            child: child,
          ),
        );
      },
    );
  }
}
