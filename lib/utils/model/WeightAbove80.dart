import 'package:flutter/material.dart';

class WeightAbove80 {
  const WeightAbove80(
      {required this.id,
      required this.fullDetails,
      required this.sets,
      required this.reps,
      required this.weightLift,
      required this.exerciseName,
      required this.caloriesBurn,
      required this.image});

  final int id;
  final String exerciseName;
  final String caloriesBurn;
  final String sets;
  final String reps;
  final String weightLift;
  final String fullDetails;
  final String image;
}

///-----------------------------  All tournament list  -----------------
const List<WeightAbove80> above80 = <WeightAbove80>[
  WeightAbove80(
    id: 0,
    exerciseName: 'Chest',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
    "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
        "back flat on an incline bench, which is lowered to 30 degrees. "
        "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
        " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
        "and lift your arms above your chest.\n\nInhale and slowly lower your "
        "arms to your sides to the starting position.\n\nContinue to press up "
        "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/chest.jpeg",
  ),
  WeightAbove80(
    id: 0,
    exerciseName: 'Back',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
    "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
        "back flat on an incline bench, which is lowered to 30 degrees. "
        "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
        " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
        "and lift your arms above your chest.\n\nInhale and slowly lower your "
        "arms to your sides to the starting position.\n\nContinue to press up "
        "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/back.jpeg",
  ),
  WeightAbove80(
    id: 0,
    exerciseName: 'Biceps',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
    "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
        "back flat on an incline bench, which is lowered to 30 degrees. "
        "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
        " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
        "and lift your arms above your chest.\n\nInhale and slowly lower your "
        "arms to your sides to the starting position.\n\nContinue to press up "
        "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/biceps.jpeg",
  ),
  WeightAbove80(
    id: 0,
    exerciseName: 'Triceps',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
    "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
        "back flat on an incline bench, which is lowered to 30 degrees. "
        "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
        " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
        "and lift your arms above your chest.\n\nInhale and slowly lower your "
        "arms to your sides to the starting position.\n\nContinue to press up "
        "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/triceps.jpeg",
  ),
  WeightAbove80(
    id: 0,
    exerciseName: 'Legs',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
    "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
        "back flat on an incline bench, which is lowered to 30 degrees. "
        "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
        " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
        "and lift your arms above your chest.\n\nInhale and slowly lower your "
        "arms to your sides to the starting position.\n\nContinue to press up "
        "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/legs.jpeg",
  ),
  WeightAbove80(
    id: 0,
    exerciseName: 'Abs',
    caloriesBurn: "Calories Burn 40",
    sets: "Sets-4",
    reps: "Reps-15",
    weightLift: "Weight Lift-100",
    fullDetails:
        "Equipment needed: set of 2 dumbbells, incline bench \nStart with your "
            "back flat on an incline bench, which is lowered to 30 degrees. "
            "Hold 1 dumbbell in each hand \n \n Start with your arms at chest"
            " level at your sides, elbows bent and pointing out \n\nSlowly exhale "
            "and lift your arms above your chest.\n\nInhale and slowly lower your "
            "arms to your sides to the starting position.\n\nContinue to press up "
            "\n\nPerform 10–15 reps. Perform 3 sets.",
    image: "assets/images/abs.jpeg",
  ),
];
