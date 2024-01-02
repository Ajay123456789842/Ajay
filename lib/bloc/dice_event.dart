// ignore_for_file: must_be_immutable

part of 'dice_bloc.dart';

@immutable
abstract class DiceEvent extends Equatable {
 const DiceEvent();
  @override
  List get props => [];
}

class Rand extends DiceEvent{
  int? n;
  Rand({this.n=1});
}