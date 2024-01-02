part of 'dice_bloc.dart';


  // ignore: must_be_immutable
  class DiceState extends Equatable {
   final int? num;
   final bool? isLoading;

   const DiceState({this.num,this.isLoading});

    const DiceState.init():num=null,isLoading=false;

  DiceState  copyWith(
      {
        int? num,
        bool? isLoading
      }
    )
    {
      return DiceState(num: num??this.num,
      isLoading:isLoading??this.isLoading);
    }

      @override
  List get props => [num,isLoading];


  }
