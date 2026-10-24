import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/theme/theme.dart';

final class AppPreview extends Preview {
  const AppPreview({
    super.name,
    super.group,
    super.size,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
  }) : super(theme: AppPreviewTheme.new);
}

final class AppPreviewTheme extends PreviewThemeData {
  @override
  Widget apply(BuildContext context, Widget child) {
    return Theme(data: theme, child: child);
    // return switch (MediaQuery.platformBrightnessOf(context)) {
    //   .light => ,
    //   .dark => ,
    // };
  }
}
