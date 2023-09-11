///

import '../../controller.dart';

class TMASettingsContainer extends StatelessWidget {
  const TMASettingsContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? Colors.blueGrey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: child ?? const SizedBox(),
    );
  }

  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
}

class TitleText extends StatelessWidget {
  const TitleText(this.data, {super.key});
  @override
  Widget build(BuildContext context) => Align(
        alignment: const AlignmentDirectional(-1.00, -1.00),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          child: Text(
            data ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
  final String? data;
}

class BorderRow extends StatelessWidget {
  const BorderRow({
    super.key,
    this.mainAxisAlignment,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.white24, width: 1.0, style: BorderStyle.solid)),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: children ?? [const SizedBox()]),
    );
  }

  final MainAxisAlignment? mainAxisAlignment;
  final List<Widget>? children;
}

///
class TMAImageStyle extends StatelessWidget {
  const TMAImageStyle({
    required this.con,
    super.key,
    this.width,
    this.height,
  });

  final ImageStyleBloc con;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: con.onTap,
        child: Column(children: [
          Container(
            width: width ?? 100,
            height: height ?? 100,
            decoration: con.selected ? con.decoration : null,
            child: Image.asset(con.name),
          ),
          Text(
            con.title,
          ),
        ]),
      );
}
