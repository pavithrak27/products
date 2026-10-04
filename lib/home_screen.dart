import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/bloc/signup/signup_bloc.dart';
import 'package:products/bloc/signup/signup_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          if (state is SignupSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(maxRadius: 50,),
                    SizedBox(height: 20),
                    Text(state.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(state.phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),
                        Spacer(),
                        Text(state.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox(height: 20);
        },
      ),
    );
  }
}
