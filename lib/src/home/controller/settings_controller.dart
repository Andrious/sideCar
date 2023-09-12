///
///
import '../../controller.dart';

import '../../view.dart';

class SettingsController extends StateXController {
  SettingsController([super.state]);

  @override
  void initState() {
    super.initState();
    //
    tabController = TabController(
      vsync: state! as TickerProviderStateMixin,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    _changed = _OnChanged(this);

    _imageStyle = _ImageStyle(this);

    _setPrefs();
  }

  late TabController tabController;

  late bool kilometers;
  late double zoom;
  late RangeValues range;

  late bool scale;
  late bool compass;
  late bool headingCompass;
  late bool dynamicZoom;
  late bool collapsible;
  late bool displayPlusMinus;
  late bool reCenter;
  late bool heading;
  late bool saveIcon;

  bool? _setPrefsCalled;

  void _setPrefs() {
    //
    if (_setPrefsCalled == null) {
      //
      _setPrefsCalled = true;

      kilometers = Prefs.getBool('kilometers', false);
      zoom = Prefs.getDouble('zoom', 0);
      final start = Prefs.getDouble('zoomStart', 0.0);
      final end = Prefs.getDouble('zoomEnd', 0.0);
      range = RangeValues(start, end);

      scale = Prefs.getBool('scale', false);
      compass = Prefs.getBool('compass', false);
      headingCompass = Prefs.getBool('headingCompass', false);
      dynamicZoom = Prefs.getBool('dynamicZoom', false);
      collapsible = Prefs.getBool('collapsible', false);
      displayPlusMinus = Prefs.getBool('displayPlusMinus', false);
      reCenter = Prefs.getBool('reCenter', false);
      heading = Prefs.getBool('heading', false);
      saveIcon = Prefs.getBool('saveIcon', false);
    }
  }

  /// Provide a menu to this simple app.
  PopupMenuButton<String> get popupMenuButton {
    //
    const mapBox = 'Mapbox Navigation';

    final popupMenuButton = PopupMenuButton<String>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: mapBox,
          child: Text(mapBox, style: TextStyle(color: Colors.black)),
        ),
      ],
      onSelected: (value) async {
        switch (value) {
          case mapBox:
            // await Navigator.push(
            //   lastContext!,
            //   MaterialPageRoute<void>(
            //     builder: (_) => const SampleNavigationApp(),
            //   ),
            // );
            break;
          default:
        }
      },
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 14,
    );
    return popupMenuButton;
  }

  get onPressed => _changed;
  get onChanged => _changed;
  late _OnChanged _changed;

  get imageStyle => _imageStyle;
  late _ImageStyle _imageStyle;
}

class _OnChanged {
  _OnChanged(this.con);
  final SettingsController con;

  Future<void> miles() async {
    await Prefs.setBool('kilometers', false);
    con.setState(() => con.kilometers = false);
  }

  Future<void> kilometers() async {
    await Prefs.setBool('kilometers', true);
    con.setState(() => con.kilometers = true);
  }

  Future<void> zoom(double value) async {
    await Prefs.setDouble('zoom', value);
    con.setState(() => con.zoom = value);
  }

  Future<void> zoomRange(RangeValues range) async {
    await Prefs.setDouble('zoomStart', range.start);
    await Prefs.setDouble('zoomEnd', range.end);
    con.setState(() => con.range = RangeValues(range.start, range.end));
  }

  Future<void> scale(bool value) async {
    await Prefs.setBool('scale', value);
    con.setState(() => con.scale = value);
  }

  Future<void> compass(bool value) async {
    Prefs.setBool('compass', value);
    con.setState(() => con.compass = value);
  }

  Future<void> headingCompass(bool value) async {
    Prefs.setBool('headingCompass', value);
    con.setState(() => con.headingCompass = value);
  }

  Future<void> dynamicZoom(bool value) async {
    await Prefs.setBool('dynamicZoom', value);
    con.setState(() => con.dynamicZoom = value);
  }

  Future<void> collapsible(bool value) async {
    await Prefs.setBool('collapsible', value);
    con.setState(() => con.collapsible = value);
  }

  Future<void> displayPlusMinus(bool value) async {
    await Prefs.setBool('displayPlusMinus', value);
    con.setState(() => con.displayPlusMinus = value);
  }

  Future<void> reCenter(bool value) async {
    await Prefs.setBool('reCenter', value);
    con.setState(() => con.reCenter = value);
  }

  Future<void> heading(bool value) async {
    await Prefs.setBool('heading', value);
    con.setState(() => con.heading = value);
  }

  Future<void> saveIcon(bool value) async {
    await Prefs.setBool('saveIcon', value);
    con.setState(() => con.saveIcon = value);
  }
}

class _ImageStyle {
  _ImageStyle(this.con) {
    _street =
        _Street(this, name: 'assets/sideCar/streets.png', title: 'Streets');
    _outdoors =
        _Outdoors(this, name: 'assets/sideCar/streets.png', title: 'Outdoors');
    _satellite = _Satellite(this,
        name: 'assets/sideCar/satellite.png', title: 'Satellite');
    _satellite02 = _Satellite02(this,
        name: 'assets/sideCar/satellite.png', title: 'Satellite02');

    _list.add(_street);
    _list.add(_outdoors);
    _list.add(_satellite);
    _list.add(_satellite02);

    final title = Prefs.getString('imgStyle', '');

    // Highlight the last selected image.
    for (final img in _list) {
      if (img.title == title) {
        img.selected = true;
      }
    }
  }

  SettingsController con;
  final List<ImageStyleBloc> _list = [];

  ImageStyleBloc get street => _street;
  late ImageStyleBloc _street;
  ImageStyleBloc get outdoors => _outdoors;
  late ImageStyleBloc _outdoors;
  ImageStyleBloc get satellite => _satellite;
  late ImageStyleBloc _satellite;
  ImageStyleBloc get satellite02 => _satellite02;
  late ImageStyleBloc _satellite02;

  void onTap(ImageStyleBloc bloc) async {
    //
    if (bloc.selected) {
      return;
    }

    for (final img in _list) {
      img.selected = false;
    }
    bloc.selected = true;
    // Save it for next startup
    await Prefs.setString('imgStyle', bloc.title);
    con.setState(() {});
  }
}

class _Street extends ImageStyleBloc {
  _Street(super.con, {required super.name, required super.title});
}

class _Outdoors extends ImageStyleBloc {
  _Outdoors(super.con, {required super.name, required super.title});
}

class _Satellite extends ImageStyleBloc {
  _Satellite(super.con, {required super.name, required super.title});
}

class _Satellite02 extends ImageStyleBloc {
  _Satellite02(super.con, {required super.name, required super.title});
}

class ImageStyleBloc {
  //ignore: library_private_types_in_public_api
  ImageStyleBloc(this.con, {required this.name, required this.title});
  //ignore: library_private_types_in_public_api
  final _ImageStyle con;
  final String name;
  final String title;

  bool selected = false;

  Decoration decoration = BoxDecoration(
      border: Border.all(width: 2, color: Colors.yellowAccent),
      borderRadius: BorderRadius.circular(16));

  void onTap() => con.onTap(this);
}
