import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/localization/app_localization.dart';
import '../bloc/localization_manager_bloc.dart';

class ChangeLocaleDropDownWidget extends StatelessWidget {
  const ChangeLocaleDropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(AppLocalizations.of(context)!.changeLanguage),
        const SizedBox(width: 10),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: BlocProvider.of<LocalizationManagerBloc>(context)
                    .state
                    .locale ??
                const Locale('en'),
            onChanged: (Locale? locale) {
              BlocProvider.of<LocalizationManagerBloc>(context).add(
                ChangeLocale(locale: locale!),
              );
            },
            items: AppLocalizations.supportedLocales
                .map(
                  (e) => DropdownMenuItem<Locale>(
                    value: e,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
