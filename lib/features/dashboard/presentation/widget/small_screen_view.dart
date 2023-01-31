import 'package:flutter/material.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/code_view.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/json_editor_view.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/modifiers_view.dart';

class SmallScreenView extends StatelessWidget {
  const SmallScreenView({
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ModifiersView(jsonData: jsonData),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            child: JsonEditorView(
                baseClassController: _baseClassController, jsonData: jsonData),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: CodeView(jsonData: jsonData, theme: theme)),
        ],
      ),
    );
  }
}
