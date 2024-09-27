import 'package:flutter/material.dart';

import 'widget/domi_docs_widget.dart';
import 'widget/domin_widget.dart';

/// Class for detail screen design
/// Bottom sheet design
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(height: 8, width: double.infinity),
          Container(
            height: 4,
            width: 36,
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16.0)),
          ),
          const SizedBox(height: 16),
          const DominWidget(),
          const SizedBox(height: 24),
          const DomiDocsWidget(),
        ],
      ),
    );
  }
}
