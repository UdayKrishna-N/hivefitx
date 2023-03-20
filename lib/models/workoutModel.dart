class Workout {
  List<WarmUp> warmUp;
  List<Exercise> exercise;
  List<CoolDown> coolDown;

  Workout({
    required this.warmUp,
    required this.exercise,
    required this.coolDown,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    Iterable warmUpList = json['Warm Up'];
    Iterable exerciseList = json['Exercises'];
    Iterable coolDownList = json['Cool Down'];

    return Workout(
      warmUp: warmUpList.map((json) => WarmUp.fromJson(json)).toList(),
      exercise: exerciseList.map((json) => Exercise.fromJson(json)).toList(),
      coolDown: coolDownList.map((json) => CoolDown.fromJson(json)).toList(),
    );
  }
}

class Exercise {
  String exercise;
  String sets;
  String reps;

  Exercise({
    required this.exercise,
    required this.sets,
    required this.reps,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exercise: json['Exercise'],
      sets: json['Sets'],
      reps: json['Reps'],
    );
  }
}

class WarmUp {
  String exercise;
  String time;

  WarmUp({
    required this.exercise,
    required this.time,
  });

  factory WarmUp.fromJson(Map<String, dynamic> json) {
    return WarmUp(
      exercise: json['Exercise'],
      time: json['Time'],
    );
  }

}

class CoolDown extends WarmUp {
  CoolDown({
    required super.exercise,
    required super.time,
  });

  factory CoolDown.fromJson(Map<String, dynamic> json) {
    return CoolDown(
      exercise: json['Exercise'],
      time: json['Time'],
    );
  }

}

class Parameters{

  String? location;
  String? muscle;
  String? equipment;
  String? time;

  Parameters({required this.location, required this.muscle, required this.equipment, required this.time});

}
