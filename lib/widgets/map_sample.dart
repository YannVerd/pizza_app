import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';




class MapSample extends StatelessWidget {
  const MapSample({super.key});

  openMapsSheet(context) async {
    try {
       
      final coords = Coords(37.759392, -122.5107336);
      const  title = "Ocean Beach";
      
      final availableMaps = await MapLauncher.installedMaps;

     

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: coords,
                        title: title,
                      ),
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Center(child: Builder(
          builder: (context) {
            return MaterialButton(
              onPressed: () {
               
                openMapsSheet(context);
                },
              child: const Text('Show Location  currrent order'),
            );
          },
        )
    );
     
  }
}