import 'package:hivefitx/models/workoutModel.dart';

class WorkoutViewModel{

  WorkoutViewModel(Workout workout): _workout = workout;

  final Workout _workout;


  List<WarmUp> get warmUps{
    return _workout.warmUp;
  }

  List<Exercise> get exercises{
    return _workout.exercise;
  }

  List<CoolDown> get coolDowns{
    return _workout.coolDown;
  }

}