import 'package:flutter/material.dart';
import 'package:json_editor/json_editor.dart';
import 'package:json_to_dart/config/service_locator/service_locator.dart';
import 'package:json_to_dart/core/utils/context_extention.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonEditorView extends StatelessWidget {
  const JsonEditorView({
    Key? key,
    required TextEditingController baseClassController,
    required this.jsonData,
  })  : _baseClassController = baseClassController,
        super(key: key);

  final TextEditingController _baseClassController;
  final ValueNotifier<Map<String, dynamic>> jsonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.primary.withOpacity(.3),
      child: Column(
        children: [
          TextFormField(
            controller: _baseClassController,
            decoration: InputDecoration(
              hintText: context.locale.baseClassName,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              child: JsonEditor.string(
                openDebug: true,
                jsonString: jsonData.value["json"],
                onValueChanged: (value) {
                  sl<SharedPreferences>().setString(
                    'json',
                    value.toString(),
                  );
                  jsonData.value = {
                    "baseClass": jsonData.value["baseClass"] ?? '',
                    "json": value.toString(),
                    "nullable": jsonData.value['nullable'],
                    "optional": jsonData.value['optional'],
                    "useEquatable": jsonData.value['useEquatable'],
                    "addTrailingUnderscore":
                        jsonData.value['addTrailingUnderscore'],
                    "addCopyWith": jsonData.value['addCopyWith'],
                    "shouldBeMutable": jsonData.value['shouldBeMutable'],
                    "useFreezed": jsonData.value['useFreezed']
                  };
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
