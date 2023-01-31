import 'package:flutter/material.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/code_view.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/json_editor_view.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/modifiers_view.dart';

class LargeScreenView extends StatelessWidget {
  const LargeScreenView({
    Key? key,
    required TextEditingController baseClassController,
    required this.jsonData,
    required this.theme,
  })  : _baseClassController = baseClassController,
        super(key: key);

  final TextEditingController _baseClassController;
  final ValueNotifier<Map<String, dynamic>> jsonData;
  final Map<String, TextStyle> theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: JsonEditorView(
                  baseClassController: _baseClassController,
                  jsonData: jsonData),
            ),
            Expanded(
              flex: 7,
              child: CodeView(jsonData: jsonData, theme: theme),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              child: ModifiersView(jsonData: jsonData)),
        )
      ],
    );
  }
}
