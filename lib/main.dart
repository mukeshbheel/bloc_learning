import 'package:bloc_learning/AppBlocs.dart';
import 'package:bloc_learning/AppEvents.dart';
import 'package:bloc_learning/AppState.dart';
import 'package:bloc_learning/pages/sign_in/sign_in.dart';
import 'package:bloc_learning/pages/welcome/welcome_blocs.dart';
import 'package:bloc_learning/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // lazy: false,
          create: (context) => WelcomeBlocs(),
        ),
        BlocProvider(
          // lazy: false,
          create: (context) => AppBlocs(),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const WelcomePage(),
            routes: {
              'myHomePage' : (context) => MyHomePage(),
              'signIn' : (context) => SignIn()
            },
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('My Home Page'),
        ),
        body: Center(
          child: BlocBuilder<AppBlocs, AppState>(
            builder: (context, state){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    // '$_counter',
                    '${BlocProvider.of<AppBlocs>(context).state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: 'heroTag1',
              // onPressed: _incrementCounter,
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(IncrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),FloatingActionButton(
              heroTag: 'heroTag2',
              // onPressed: _decrementCounter,
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(DecrementEvent()),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        )
    );
  }
}

