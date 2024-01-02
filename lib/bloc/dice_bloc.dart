import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(const DiceState.init()) {
    on<Rand>((event, emit) async {
       emit(
        state.copyWith(
          isLoading: true,
        ),    

      );

    await  Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          num:Random().nextInt(6)+1,
           isLoading: false,
        ),
        
        

      );
      
      
    });
  }
}
