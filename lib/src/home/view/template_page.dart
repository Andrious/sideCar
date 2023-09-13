//
import '../../controller.dart';

import '../../view.dart';

abstract class TMAPageState<T extends StatefulWidget>
    extends StateX<StatefulWidget> {
  TMAPageState({
    StateXController? controller,
    this.primary,
    this.leading,
    this.title,
    this.centerTitle,
    this.elevation,
  }) : super(controller: controller);

  bool? primary;
  Widget? leading;
  Widget? title;
  bool? centerTitle;
  double? elevation;

  //
  @override
  void initState() {
    super.initState();
    key = ValueKey<StatefulWidget>(widget);
  }

  late Key key;

  Widget? onAlign(BuildContext context);

  Widget? onFlexible(BuildContext context);

  FloatingActionButton? onFloatingActionButton() => null;

  @override
  Widget buildAndroid(BuildContext context) {
    final align = onAlign(context);

    final flexible = onFlexible(context);

    return Scaffold(
      key: key,
      primary: primary ?? true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).shadowColor,
        automaticallyImplyLeading: false,
        leading: leading,
        title: title,
        centerTitle: centerTitle ?? false,
        elevation: elevation ?? 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (align != null)
            Align(
              alignment: const Alignment(0, 0),
              child: align,
            ),
          if (flexible != null)
            Flexible(
              child: flexible,
            ),
        ],
      ),
      floatingActionButton: onFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  @override
  Widget buildiOS(BuildContext context) => buildAndroid(context);
}

Future<T?> bottomSheetPage<T>(BuildContext context, {required Widget? body}) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Material(child: body),
        );
      },
    );
