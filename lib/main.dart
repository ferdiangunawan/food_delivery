import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/cubit/transaction_cubit.dart';
import 'package:food_market/ui/pages/pages.dart';
import 'package:get/get.dart';

import 'cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
        BlocProvider(create: (_) => FoodCubit())
      ],
      child:
          GetMaterialApp(debugShowCheckedModeBanner: false, home: SignInPage()),
    );
  }
}