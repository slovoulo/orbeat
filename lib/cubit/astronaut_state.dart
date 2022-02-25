part of 'astronaut_cubit.dart';

@immutable
abstract class AstronautState {}

class AstronautInitial extends AstronautState {}
class DetailsLoaded extends AstronautState{
  final List<People>?astronautDetails;
  DetailsLoaded({this.astronautDetails});
}
