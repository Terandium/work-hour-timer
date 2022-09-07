import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../config.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();

}

class _SettingsState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            appTitle,
          ),
        ),
        body: const Center(
          child: ThemeSwitches(),
        )
    );
  }

}

class ThemeSwitches extends StatefulWidget {
  const ThemeSwitches({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeSwitches();

}

class _ThemeSwitches extends State {
  bool isDark = true;
  bool isSystem = true;

  @override
  Widget build(BuildContext context) {
    isDark = AdaptiveTheme.of(context).mode.isDark;
    isSystem = AdaptiveTheme.of(context).mode.isSystem;
    return Column(
      children: [
        const Text("Use system theme:"),
        Switch(
          value: isSystem,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              isSystem = value;
              value ? AdaptiveTheme.of(context).setSystem() : AdaptiveTheme.of(context).setLight();
            });
          },
        ),
        const Text("Dark mode:"),
        Switch(
          value: isDark,
          onChanged: isSystem ? null : (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              isDark = value;
              value ? AdaptiveTheme.of(context).setDark() : AdaptiveTheme.of(context).setLight();
            });
          },
        ),
      ],
    );
  }

}