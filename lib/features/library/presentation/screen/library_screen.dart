import 'package:flutter/material.dart';
import 'package:jewish_app/features/library/presentation/widgets/library_view.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static const String routeName = '/library';

  @override
  Widget build(BuildContext context) {
    return const LibraryView();
  }
}
