part of 'localization_manager_bloc.dart';

class LocalizationManagerState extends Equatable {
  final Locale? locale;
  const LocalizationManagerState({this.locale});
  @override
  List<Object?> get props => [locale];
}
