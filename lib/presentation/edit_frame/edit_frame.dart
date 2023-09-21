import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furrl/values/app_constants.dart';
import '../../bloc/edit_frame_cubit.dart';
import '../../bloc/edit_frame_state.dart';
import '../../values/app_strings.dart';
import '../../values/app_values.dart';
import 'components/custom_app_bar.dart';
import 'components/images_frame.dart';
import 'components/pick_images.dart';

class EditFrame extends StatelessWidget {
  const EditFrame({super.key});

  static const id = 'edit_frame';

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(AppStrings.editFrame),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: ClipRRect(
                child: GestureDetector(
                  onTap: () {
                    context.read<EditFrameCubit>().pickImages(width);
                  },
                  onScaleStart: (details) {
                    context.read<EditFrameCubit>().getSelectedImageIndex(top: details.localFocalPoint.dy, left: details.localFocalPoint.dx);
                  },
                  onTapDown: (details) {
                    context.read<EditFrameCubit>().changeMoveImageTo(true);
                    context.read<EditFrameCubit>().getSelectedImageIndex(top: details.localPosition.dy, left: details.localPosition.dx);
                  },
                  onScaleUpdate: (details) {
                    context.read<EditFrameCubit>().zoomInOutOrMoveImage(details);
                  },
                  child: RepaintBoundary(
                    key: globalKey,
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        color: AppColors.primaryColor.withOpacity(0.06),
                        child: BlocBuilder<EditFrameCubit, EditFrameState>(
                          builder: (BuildContext context, state) {
                            return SizedBox(
                              height: height * 0.7,
                              width: width,
                              child: state.images.isEmpty ? const PickImages() : ImagesFrame(images: state.images),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<EditFrameCubit>().saveImage(context);
                  },
                  child: Text(
                    AppStrings.save,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppStrings.cancel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryColor),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
