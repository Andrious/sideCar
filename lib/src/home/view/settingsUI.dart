///

import '../../controller.dart';

import '../../view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State createState() => _SettingsPageState();
}

class _SettingsPageState extends StateX<SettingsPage>
    with TickerProviderStateMixin {
  _SettingsPageState() : super(controller: SettingsController()) {
    con = controller as SettingsController;
  }
  late SettingsController con;
  final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'Settings');

  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).shadowColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).shadowColor,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_double_arrow_left,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
//                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        title: InkWell(onTap: () {}, child: const Text('Back')),
        centerTitle: false,
//        actions: [con.popupMenuButton],
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: TabBar(
              labelColor: const Color(0xFFD09F24),
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle: const TextStyle(),
              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              tabs: const [
                Tab(
                  text: 'Map',
                ),
                Tab(
                  text: 'Visibility',
                ),
                Tab(
                  text: 'UI',
                ),
                Tab(
                  text: 'System',
                ),
              ],
              controller: con.tabController,
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: con.tabController,
              children: [
                tabMap,
                const Text(
                  'Visibility',
                ),
                tabUI,
                // const Text(
                //   'System',
                // ),
//// pk.eyJ1IjoiZ3RmcGVycnkiLCJhIjoiY2xtYXo1emdkMDJldjNqbXR2bDJwMTczaSJ9.geVJQ2wYWiltOT7WU7VWJA
                const MapsDemo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get tabMap => ListView(
//        mainAxisSize: MainAxisSize.max,
        children: [
          const TitleText(
            'Unit',
          ),
          TMASettingsContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 170.0,
                  color: con.kilometers ? Colors.yellow : Colors.white24,
                  textColor: con.kilometers ? Colors.black : Colors.white,
                  onPressed: con.onPressed.kilometers,
                  child: const Text('Kilometers'),
                ),
                MaterialButton(
                  minWidth: 170.0,
                  color: !con.kilometers ? Colors.yellow : Colors.white24,
                  textColor: !con.kilometers ? Colors.black : Colors.white,
                  onPressed: con.onPressed.miles,
                  child: const Text('Miles'),
                )
              ],
            ),
          ),
          const TitleText(
            'Map Style',
          ),
          TMASettingsContainer(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TMAImageStyle(
                  con: con.imageStyle.street,
                ),
                TMAImageStyle(
                  con: con.imageStyle.outdoors,
                ),
                TMAImageStyle(
                  con: con.imageStyle.satellite,
                ),
                TMAImageStyle(
                  con: con.imageStyle.satellite02,
                ),
              ],
            ),
          ),
          const TitleText(
            'Dynamic Zoom Speed',
          ),
          TMASettingsContainer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BorderRow(
                  children: [
                    const Expanded(
                      child: Text(
                        'Low: < 18 KPH',
                      ),
                    ),
                    Image.asset(
                      'assets/sideCar/dotYellow.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                BorderRow(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(
                      child: Text(
                        'Medium: 18 KPH - 93 KPH',
                      ),
                    ),
                    Image.asset(
                      'assets/sideCar/dotOrange.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Expanded(
                      child: Text(
                        'High: > 93 KPH',
                      ),
                    ),
                    Image.asset(
                      'assets/sideCar/dotRed.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 0,
                  max: 22,
                  values: con.range,
                  activeColor: Colors.yellowAccent,
                  onChanged: con.onChanged.zoomRange,
                ),
              ],
            ),
          ),
          const TitleText(
            'Dynamic Zoom',
          ),
          TMASettingsContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 50),
                    Text('${con.zoom.toInt()}'),
                  ],
                ),
                Row(
                  children: [
                    const Flexible(flex: 1, child: Text('0')),
                    Flexible(
                      flex: 10,
                      child: Slider(
                        min: 0,
                        max: 22,
                        value: con.zoom,
                        activeColor: Colors.yellowAccent,
                        onChanged: con.onChanged.zoom,
                      ),
                    ),
                    const Flexible(flex: 1, child: Text('22')),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget get tabUI => ListView(
//        mainAxisSize: MainAxisSize.max,
        children: [
          const TitleText(
            'Map UI',
          ),
          TMASettingsContainer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BorderRow(
                  children: [
                    const Text(
                      'Scale',
                    ),
                    Switch.adaptive(
                      value: con.scale,
                      onChanged: con.onChanged.scale,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Text(
                      'Compass',
                    ),
                    Switch.adaptive(
                      value: con.compass,
                      onChanged: con.onChanged.compass,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Text(
                      'Heading Compass',
                    ),
                    Switch.adaptive(
                      value: con.headingCompass,
                      onChanged: con.onChanged.headingCompass,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const TitleText(
            'Dynamic Zoom',
          ),
          TMASettingsContainer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BorderRow(
                  children: [
                    const Text(
                      'Zoom',
                    ),
                    Switch.adaptive(
                      value: con.dynamicZoom,
                      onChanged: con.onChanged.dynamicZoom,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Text(
                      'Collapsible',
                    ),
                    Switch.adaptive(
                      value: con.collapsible,
                      onChanged: con.onChanged.collapsible,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Text(
                      'Display plus/minus buttons',
                    ),
                    Switch.adaptive(
                      value: con.displayPlusMinus,
                      onChanged: con.onChanged.displayPlusMinus,
                      activeColor: const Color(0xFF63E958),
                    )
                  ],
                ),
              ],
            ),
          ),
          const TitleText(
            'Map Tools',
          ),
          TMASettingsContainer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BorderRow(
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.support,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                        'Re-center',
                      ),
                    ),
                    Switch.adaptive(
                      value: con.reCenter,
                      onChanged: con.onChanged.reCenter,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
                BorderRow(
                  children: [
                    const Row(mainAxisSize: MainAxisSize.max, children: [
                      Icon(
                        Icons.assistant_navigation,
                        color: Colors.white,
                        size: 24,
                      ),
                      Text(
                        'Heading',
                      ),
                    ]),
                    Switch.adaptive(
                      value: con.heading,
                      onChanged: con.onChanged.heading,
                      activeColor: const Color(0xFF63E958),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const TitleText(
            'Auto Save',
          ),
          TMASettingsContainer(
            child: BorderRow(
              children: [
                const Text(
                  'Save Icon',
                ),
                Switch.adaptive(
                  value: con.saveIcon,
                  onChanged: con.onChanged.saveIcon,
                  activeColor: const Color(0xFF63E958),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget buildiOS(BuildContext context) => buildAndroid(context);
}
