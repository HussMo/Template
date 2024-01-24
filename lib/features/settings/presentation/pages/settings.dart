import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_app/features/settings/presentation/blocs/localization/local_cubit.dart';
import 'package:theme_app/features/settings/presentation/blocs/localization/local_state.dart';

class SettingsPage extends StatefulWidget {
 const SettingsPage({Key? key}) : super(key: key);

 @override
 State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 String? currentLanguage;

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              if (state is ChangeLocalState) {
                currentLanguage = state.locale.languageCode;
              }
              return ListTile(
                title: const Text('Language'),
                trailing: DropdownButton<String>(
                 value: currentLanguage,
                 items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                 ],
                 onChanged: (value) {
                    context.read<LocalCubit>().changeLanguage(value!);
                 },
                ),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
 }
}
