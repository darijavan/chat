import 'package:flutter/material.dart';

class RouteUtils {
  RouteUtils._();

  static goTo({
    @required BuildContext context,
    @required Widget child,
    bool replace = false,
    bool removeAllRoutes = false,
  }) {
    MaterialPageRoute route = MaterialPageRoute(builder: (_) => child);
    if (replace)
      Navigator.of(context).pushReplacement(
        route,
      );
    else if (removeAllRoutes)
      Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
    else
      Navigator.of(context).push(route);
  }
}
