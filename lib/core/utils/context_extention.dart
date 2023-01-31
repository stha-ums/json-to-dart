import 'package:flutter/cupertino.dart';
import '../../config/localization/app_localization.dart';

extension C on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}
