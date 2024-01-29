import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_app/Shared/core/utils/cache_helper.dart';
import 'package:theme_app/features/settings/presentation/blocs/localization/local_state.dart';

class LocalCubit extends Cubit<LocalState> {
 LocalCubit() : super(LocalInitState()) {
    getSavedLanguage();
 }

 void getSavedLanguage() {
    final cachedLanguageCode = CacheHelper.getCachedLanguage();
    emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
 }

 Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.cacheLanguage(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
 }
}