import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final geolocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final historicLocationState = historicLocationBloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${historicLocationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: historicLocationState.howManyLocations,
        itemBuilder: (BuildContext context, int index) {
          final (lat, lng) = historicLocationState.locations[index];
          return ListTile(
            title: Text('Lat: $lat, Lng: $lng'),
          );
        },
      ),
    );
  }
}
