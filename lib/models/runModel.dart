import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunModel {
  final DateTime dateTime;
  final double distanceInMetres;
  final List<RunSplit> runSplits;
  final List<LatLng> positions;
  final LatLng boundNE;
  final LatLng boundSW;

  RunModel({
    required this.dateTime,
    required this.distanceInMetres,
    required this.runSplits,
    required this.positions,
    required this.boundNE,
    required this.boundSW,
  });


  factory RunModel.fromSnapshot(DocumentSnapshot snapshot) {
    Iterable runSplitsList = snapshot.get('runSplits');
    Iterable positionsList = snapshot.get('positions');
    var boundne = snapshot.get('boundNE');
    var boundsw = snapshot.get('boundSW');

    return RunModel(
      dateTime: snapshot.get('dateTime'),
      distanceInMetres: snapshot.get('distanceInMetres'),
      runSplits: runSplitsList.map((json) => RunSplit.fromJson(json)).toList(),
      positions: positionsList.map((position) => LatLng(position.latitude, position.longitude)).toList(),
      boundNE: LatLng(boundne.latitude, boundne.longitude),
      boundSW: LatLng(boundsw.latitude, boundsw.longitude),
    );
  }
}

class RunSplit {
  final int kilometre;
  final int pace;

  RunSplit({required this.kilometre, required this.pace});

  factory RunSplit.fromJson(Map<String, dynamic> json){
    return RunSplit(kilometre: json['kilometre'], pace: json['pace'],);
  }

}
