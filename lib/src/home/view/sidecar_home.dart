///
import '../../controller.dart';

import '../../view.dart';

class SideCarHome extends StatefulWidget {
  const SideCarHome({Key? key}) : super(key: key);

  @override
  State createState() => _SideCarHomeState();
}

class _SideCarHomeState extends TMAPageState<SideCarHome>
    with TickerProviderStateMixin {
  _SideCarHomeState()
      : super(
          primary: false,
          controller: SettingsController(),
        ) {
    con = controller as SettingsController;
  }

  late SettingsController con;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget? onAlign(BuildContext context) => null;

//   @override
//   Widget? onFlexible(BuildContext context) => MapboxMap(
//         accessToken:
//             'pk.eyJ1IjoiZ3RmcGVycnkiLCJhIjoiY2xtYXo1emdkMDJldjNqbXR2bDJwMTczaSJ9.geVJQ2wYWiltOT7WU7VWJA',
// //                  onMapCreated: _onMapCreated,
//         onCameraIdle: () => print("onCameraIdle"),
//         initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
//       );
  @override
  Widget? onFlexible(BuildContext context) => const SettingsPage();

  // @override
  // FloatingActionButton? onFloatingActionButton() => FloatingActionButton(
  //       key: const Key('settings'),
  //       backgroundColor: Colors.amberAccent,
  //       onPressed: () async {
  //         await bottomSheetPage<void>(
  //           lastContext!,
  //           body: const SettingsPage(),
  //         );
  //       },
  //       child: const Icon(Icons.settings),
  //     );
}
