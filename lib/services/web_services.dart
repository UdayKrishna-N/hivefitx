import 'dart:convert';

import 'package:hivefitx/models/workoutModel.dart';
import 'package:http/http.dart' as http;

class WebServices{

  fetchWorkoutPlan(Parameters parameters) async{

    var url = Uri.parse('https://workout-planner1.p.rapidapi.com/?time=${parameters.time}&muscle=${parameters.muscle}&location=${parameters.location}&equipment=${parameters.equipment}');
    var response = await http.get(url,headers: {
      'X-RapidAPI-Key' : '2eb8ec9072mshce8e0d349ce710ep19d613jsn434975de521a',
      'X-RapidAPI-Host' : 'workout-planner1.p.rapidapi.com',
    });

    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      return Workout.fromJson(result);
    }else{
      throw Exception('Failed to get Workout Plan');
    }

  }

}