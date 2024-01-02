import 'package:dice/bloc/dice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:const RollingDice(),
    );
  }
}

class RollingDice extends StatefulWidget {
  const RollingDice({super.key});

  @override
  State<RollingDice> createState() => _RollingDiceState();
}

class _RollingDiceState extends State<RollingDice> {
  DiceBloc? d;
  @override
  void initState() {
    d=DiceBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roll Dice"),
        
      ),
      body: BlocProvider<DiceBloc>(
        create: (context) => d!..add(Rand(n: 1)),
        child: BlocBuilder<DiceBloc,DiceState>(
          builder: (context,stat){
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 6, 247, 130),
                    height: 250,
                    width: 250,
                    child:
                     Center(
                      
                      child:stat.isLoading==true?
                     const Center(child: CircularProgressIndicator(),)
                       :Text('${stat.num}',
                      
                      style:const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      
                      ),),
                    ),
                  
                  ),
                const  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    d!.add(Rand(n:stat.num));

                  }, 
                  child: const Text('Roll Dice')
                  )
                ],
              ),
              
            );
          }
          ),
        ),
    );
  }
}