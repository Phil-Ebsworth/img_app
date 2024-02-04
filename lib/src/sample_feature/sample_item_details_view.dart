import 'package:bildverarbeitung/src/sample_feature/sample_item.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key, this.item});

  final SampleItem? item;
  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details of item ${item?.id}'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
