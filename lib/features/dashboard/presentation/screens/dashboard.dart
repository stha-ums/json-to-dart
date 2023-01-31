import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import 'package:json_to_dart/config/service_locator/service_locator.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/large_screen_view.dart';
import 'package:json_to_dart/features/dashboard/presentation/widget/small_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/localization_manager/widgets/change_locale_dropdown_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late final TextEditingController _baseClassController;
  late final ValueNotifier<Map<String, dynamic>> jsonData;

  @override
  void initState() {
    jsonData = ValueNotifier(
      {
        "baseClass": sl<SharedPreferences>().getString('base') ?? '',
        "nullable": sl<SharedPreferences>().getBool('nullable') ?? true,
        "optional": sl<SharedPreferences>().getBool('optional') ?? false,
        "addTrailingUnderscore":
            sl<SharedPreferences>().getBool('addTrailingUnderscore') ?? false,
        "useEquatable":
            sl<SharedPreferences>().getBool('useEquatable') ?? false,
        "addCopyWith": sl<SharedPreferences>().getBool('addCopyWith') ?? false,
        "shouldBeMutable":
            sl<SharedPreferences>().getBool('shouldBeMutable') ?? false,
        "useFreezed": sl<SharedPreferences>().getBool('useFreezed') ?? false,
        "json": sl<SharedPreferences>().getString('json') ??
            '''{ "name": "young chan", "number": 100, "boo": true, "user": {"age": 20, "tall": 1.8},"cities": ["beijing", "shanghai", "shenzhen"] } '''
      },
    );
    _baseClassController = TextEditingController(
        text: sl<SharedPreferences>().getString('base') ?? '');
    _baseClassController.addListener(
      () {
        sl<SharedPreferences>().setString('base', _baseClassController.text);
        jsonData.value = {
          "baseClass": _baseClassController.text.trim(),
          "json": jsonData.value["json"] ?? "",
          "nullable": jsonData.value['nullable'],
          "optional": jsonData.value['optional'],
          "useEquatable": jsonData.value['useEquatable'],
          "addTrailingUnderscore": jsonData.value['addTrailingUnderscore'],
          "addCopyWith": jsonData.value['addCopyWith'],
          "shouldBeMutable": jsonData.value['shouldBeMutable'],
          "useFreezed": jsonData.value['useFreezed']
        };
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _baseClassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = {
      ...obsidianTheme,
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Center(
          child: Text(
            "DG",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        actions: [
          const ChangeLocaleDropDownWidget(),
          IconButton(
            onPressed: () {
              launchUrl(Uri.parse('https://github.com/stha-ums/json-to-dart'));
            },
            icon: Image.asset('asset/github.png'),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          if (constraints.maxWidth > 450) {
            return LargeScreenView(
              baseClassController: _baseClassController,
              jsonData: jsonData,
              theme: theme,
            );
          }
          return SmallScreenView(
            baseClassController: _baseClassController,
            jsonData: jsonData,
            theme: theme,
          );
        }),
      ),
    );
  }
}
