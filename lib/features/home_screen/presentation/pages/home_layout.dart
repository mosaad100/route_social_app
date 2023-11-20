import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:social_media_app/features/home_screen/presentation/pages/tabs/home_tab.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit()..getPosts(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text("HomeScreen"),
              ),
              backgroundColor: Colors.blueGrey,
              body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverPadding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 0),
                      )
                    ];
                  },
                  body: HomeTab()),
            ),
          );
        },
      ),
    );
  }
}
