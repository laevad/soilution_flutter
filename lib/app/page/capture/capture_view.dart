import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_maven/tflite.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../constant.dart';
import '../../../api.dart';
import '../../widgets/capture/custom_button.dart';
import '../result/result_view.dart';
import 'capture_controller.dart';

class CaptureView extends View {
  final List<CameraDescription>? cameras;
  const CaptureView({Key? key, this.cameras}) : super(key: key);

  @override
  CaptureViewState createState() => CaptureViewState();
}

class CaptureViewState extends ViewState<CaptureView, CaptureController> {
  CaptureViewState() : super(CaptureController());

  late CameraController cameraController;
  XFile? pictureFile;
  int direction = 0;
  File? _image;
  List? _output;

  @override
  void initState() {
    super.initState();
    startCamera(0);
    loadModel().then((value) => setState(() {

    }));
  }

  void startCamera(int direction) async {
    cameraController = CameraController(
      widget.cameras![direction],
      ResolutionPreset.max,
      enableAudio: false,
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
    Tflite.close();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/data/model.tflite',
        labels: 'assets/data/labels.txt');
  }

  Future _pickImage(ImageSource source) async {
    try {
      EasyLoading.show(status: 'loading...');

      final image = await ImagePicker().pickImage(source: source);
      if (image == null){
        EasyLoading.dismiss();

        return;
      }
      EasyLoading.show(status: 'loading...');
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      if(img!=null){
        var output = await Tflite.runModelOnImage(
            path: image.path,
            numResults: 2,
            threshold: 0.5,
            imageMean: 127.5,
            imageStd: 127.5);
        Map<String, String> body = {
          'clusters': "1",};
        var munsell = await Api().getSoil(body,image.path);

        setState(() {
          _image = img;
          EasyLoading.dismiss();
          Navigator.pushNamed(context, ResultView.routeName,
              arguments: {'image': _image, 'output': output, 'munsell': munsell});
        });
      }
      EasyLoading.dismiss();

    } on PlatformException catch (e) {
      print("================*********=========================");
      print(e);
      EasyLoading.dismiss();
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ], sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
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
            title: Text(
              'Capture',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7)),
            ),
            actions: [
              GestureDetector(
                onTap: controller.onPressedHelp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/cq_0.png',
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pickImage(ImageSource.gallery);
                          },
                          child: const CaptureCustomButton(
                            icon: Icons.image_outlined,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              cameraController
                                  .takePicture()
                                  .then((XFile? file) async {
                                if (mounted) {
                                  if (file != null) {
                                    File? img = File(file.path);
                                    img = await _cropImage(imageFile: img);
                                    if(img!=null){
                                      var output = await Tflite.runModelOnImage(
                                          path: file.path,
                                          numResults: 2,
                                          threshold: 0.5,
                                          imageMean: 127.5,
                                          imageStd: 127.5);
                                      Map<String, String> body = {
                                        'clusters': "1",};
                                      EasyLoading.show(status: 'loading...');
                                      var munsell = await Api().getSoil(body,file.path);

                                      setState(() {
                                        _image = img;
                                        EasyLoading.dismiss();
                                        Navigator.pushNamed(context, ResultView.routeName,
                                            arguments: {'image': _image, 'output': output, 'munsell': munsell});
                                      });
                                    }
                                  }
                                }
                              });
                            },
                            child: const CaptureCustomButton(
                                icon: Icons.camera_outlined
                            ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                direction = direction == 0 ? 1 : 0;
                                startCamera(direction);
                              });
                            },
                            child: const CaptureCustomButton(
                                icon: Icons.flip_camera_ios_outlined
                            ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
