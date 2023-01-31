import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_to_dart/config/service_locator/service_locator.dart';
import 'package:json_to_dart/core/json_to_dart/json_to_dart.dart';
import 'package:json_to_dart/core/utils/context_extention.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModifiersView extends StatelessWidget {
  const ModifiersView({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  final ValueNotifier<Map<String, dynamic>> jsonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(.5),
      child: ValueListenableBuilder<Map<String, dynamic>>(
        valueListenable: jsonData,
        builder: (context, data, child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width > 450
                ? 300
                : MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.useFreezed),
                  value: data['useFreezed'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": !jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>()
                        .setBool('useFreezed', jsonData.value['useFreezed']);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.makeFieldsAllOptional),
                  value: data['optional'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": !jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };
                    sl<SharedPreferences>()
                        .setBool('optional', jsonData.value['optional']);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.addTrallingUnderscore),
                  value: data['addTrailingUnderscore'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          !jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>().setBool('addTrailingUnderscore',
                        jsonData.value['addTrailingUnderscore']);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.mutable),
                  value: data['shouldBeMutable'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": !jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>()
                        .setBool('addCopyWith', jsonData.value['addCopyWith']);
                  },
                ),
                const Divider(),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.makeFieldsAllNullable),
                  value: data['nullable'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": !jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>()
                        .setBool('nullable', jsonData.value['nullable']);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.useEquatable),
                  value: data['useEquatable'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": !jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>().setBool(
                        'useEquatable', jsonData.value['useEquatable']);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  title: Text(context.locale.addCopyWithMethod),
                  value: data['addCopyWith'],
                  onChanged: (value) {
                    jsonData.value = {
                      "baseClass": jsonData.value["baseClass"] ?? '',
                      "json": jsonData.value['json'],
                      "nullable": jsonData.value['nullable'],
                      "optional": jsonData.value['optional'],
                      "useEquatable": jsonData.value['useEquatable'],
                      "addTrailingUnderscore":
                          jsonData.value['addTrailingUnderscore'],
                      "addCopyWith": !jsonData.value['addCopyWith'],
                      "shouldBeMutable": jsonData.value['shouldBeMutable'],
                      "useFreezed": jsonData.value['useFreezed']
                    };

                    sl<SharedPreferences>()
                        .setBool('addCopyWith', jsonData.value['addCopyWith']);
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: DartFormatter().format(
                          JsonToDart.generate(
                            jsonData.value["json"] ?? '',
                            baseClass: jsonData.value["baseClass"]!.isEmpty
                                ? 'BaseClass'
                                : jsonData.value["baseClass"] ?? '',
                            makeAllFieldNullable: jsonData.value["nullable"],
                            makeAllFieldOptional: jsonData.value["optional"],
                            implementEquatable: jsonData.value["useEquatable"],
                            addCopyWith: jsonData.value['addCopyWith'],
                            addTrailingUnderscore:
                                jsonData.value["addTrailingUnderscore"],
                            shouldBeMutable: jsonData.value['shouldBeMutable'],
                            useFreezed: jsonData.value['useFreezed'],
                          ),
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.5),
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 200,
                            right: 32,
                            bottom: 20),
                        padding: const EdgeInsets.all(8),
                        content: Text(
                          context.locale.codeCopied,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Text(context.locale.copyCode),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
