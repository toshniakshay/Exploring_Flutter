import 'package:flutter/material.dart';
import 'package:userregistration/utils/ConfigurationUtils.dart';
import 'package:userregistration/utils/device_config_helper.dart';

class BaseWidget extends StatelessWidget {

  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key key, this.builder}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight)
        );
        builder(context, sizingInformation);
      },
    );
  }
}
