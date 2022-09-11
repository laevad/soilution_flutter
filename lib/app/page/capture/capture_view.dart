import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/page/capture/capture_controller.dart';

import '../../../constant.dart';
import '../../widgets/capture/custom_button.dart';

class CaptureView extends View {
  final List<CameraDescription>? cameras;
  const CaptureView({Key? key, this.cameras}) : super(key: key);

  @override
  CaptureViewState createState() => CaptureViewState();
}

class CaptureViewState extends ViewState<CaptureView, CaptureController> {
  CaptureViewState() : super(CaptureController()) ;

  late CameraController cameraController;
  XFile? pictureFile;
  int direction = 0;

  @override
  void initState() {
    super.initState();
    startCamera(0);
  }


  void startCamera(int direction) async{
    cameraController = CameraController(
      widget.cameras![direction],
      ResolutionPreset.max,enableAudio: false,
    );
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }


  @override
  Widget get view {
    return ControlledWidgetBuilder<CaptureController>(
      builder: (context, controller) {
        return Scaffold(
          backgroundColor: Constant.lightColorScheme.primary,
          key: globalKey,
          appBar: AppBar(
            backgroundColor: Constant.lightColorScheme.primary,
            title:  Text('Capture',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7)
              ),
            ),actions: [
            GestureDetector(
              onTap: controller.onPressedHelp,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/cq_0.png',
                  height: 40,),
              ),
            ),
          ],),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: SizedBox(
                    width: double.infinity,
                    child: CameraPreview(cameraController),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        const CaptureCustomButton(icon: Icons.image_outlined),
                        GestureDetector(
                            onTap: (){
                              cameraController.takePicture().then(
                                      (XFile? file) {
                                    if(mounted){
                                      if(file != null){
                                        print("Picture save to ${file.path}"
                                        );
                                      }
                                    }
                                  });
                            },
                            child: const CaptureCustomButton(
                                icon: Icons.camera_outlined
                            )
                        ),
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                direction = direction == 0 ? 1: 0;
                                startCamera(direction);
                              });
                            },
                            child: const CaptureCustomButton(
                                icon: Icons.flip_camera_ios_outlined
                            )
                        ),
                      ])
                  ,)
              ],
            ),
          ),

        );
      },);
  }



}
