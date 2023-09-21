import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furrl/presentation/edit_frame/edit_frame.dart';
import 'package:furrl/presentation/frames_page/frames_page.dart';
import 'package:furrl/presentation/home_page/home_page.dart';
import 'package:furrl/router/screen_arguments.dart';

import '../bloc/edit_frame_cubit.dart';
import '../bloc/home_page_bloc.dart';
import '../values/app_assets.dart';
import '../values/app_enums.dart';

class AppRouter {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.id:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomePageBloc>(create: (context) => HomePageBloc(), child: const HomePage()),
        );

      case EditFrame.id:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<EditFrameCubit>(
            create: (BuildContext context) => EditFrameCubit(),
            child: const EditFrame(),
          ),
        );

      case FramesPage.id:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (context) => FramesPage(
            frameType: args.frameType,
            framePath: args.framePath,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const FramesPage(
            framePath: AppAssets.framePicture,
            frameType: FrameType.preSaved,
          ),
        );
    }
  }
}
