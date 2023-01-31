import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:json_to_dart/core/json_to_dart/json_to_dart.dart';

class CodeView extends StatelessWidget {
  const CodeView({
    Key? key,
    required this.jsonData,
    required this.theme,
  }) : super(key: key);

  final ValueNotifier<Map<String, dynamic>> jsonData;
  final Map<String, TextStyle> theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.primary.withOpacity(.3),
      child: ValueListenableBuilder(
        valueListenable: jsonData,
        builder: (context, data, child) {
          String? generateSourceCode;
          try {
            generateSourceCode = JsonToDart.generate(
              jsonData.value["json"] ?? '',
              baseClass: jsonData.value["baseClass"]!.isEmpty
                  ? 'BaseClass'
                  : jsonData.value["baseClass"] ?? '',
              makeAllFieldNullable: jsonData.value["nullable"],
              makeAllFieldOptional: jsonData.value["optional"],
              implementEquatable: jsonData.value['useEquatable'],
              addTrailingUnderscore: jsonData.value["addTrailingUnderscore"],
              addCopyWith: jsonData.value['addCopyWith'],
              shouldBeMutable: jsonData.value['shouldBeMutable'],
              useFreezed: jsonData.value['useFreezed'],
            );
          } catch (e) {
            return const SizedBox();
          }
          return SingleChildScrollView(
            child: HighlightView(
              DartFormatter().format(generateSourceCode ?? "\n"),
              language: 'dart',
              theme: theme,
              padding: const EdgeInsets.all(12),
            ),
          );
        },
      ),
    );
  }
}
