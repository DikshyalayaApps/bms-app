import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppVersionBuilder extends StatelessWidget {
  final TextStyle? textStyle;

  const AppVersionBuilder({this.textStyle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("pubspec.yaml"),
        builder: (context, snapshot) {
          var version = "Unknown";
          if (snapshot.hasData) {
            final yaml = loadYaml(snapshot.data as String);
            version = yaml["version"];
          }

          return Text(
            'Version: ${version.split("+")[0]}',
            style: textStyle ?? context.textTheme.bodyLarge,
          );
        });
  }
}
