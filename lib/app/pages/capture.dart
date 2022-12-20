import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../widgets/custom_capture_buttton.dart';
import 'help.dart';
import 'result.dart';

class Capture extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const Capture({Key? key, this.cameras}) : super(key: key);

  @override
  State<Capture> createState() => _CaptureState();
}

class _CaptureState extends State<Capture> {
  late CameraController cameraController;
  XFile? pictureFile;
  int direction = 0;

  void onPressedHelp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Help()));
  }

  @override
  void initState() {
    super.initState();
    startCamera(0);
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
  }

  Future _pickImage(ImageSource source) async {
    try {
      EasyLoading.show(status: 'loading...');

      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        EasyLoading.dismiss();

        return;
      }
      EasyLoading.show(status: 'loading...');
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);

      if (img == null) {
        EasyLoading.dismiss();
        return;
      } else {
        setState(() {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, Result.routeName,
              arguments: {'image_path': image.path, 'image': img});
        });
      }

      // TODO: transfer this to result
      // var output = await Tflite.runModelOnImage(
      //     path: image.path,
      //     numResults: 2,
      //     threshold: 0.5,
      //     imageMean: 127.5,
      //     imageStd: 127.5);
      // print("**********************************************************************");
      // Map<String, String> body = {
      //   'clusters': "1",};
      // var munsell = await Api().getSoil(body,image.path);
      //
      // setState(() {
      //   _image = img;
      //   EasyLoading.dismiss();
      //   Navigator.pushNamed(context, ResultView.routeName,
      //       arguments: {'image': _image, 'output': output, 'munsell': munsell});
      // });
      // if(img!=null){
      //
      // }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.lightColorScheme.primary,
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
            onTap: () => onPressedHelp(),
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
                      child: const CustomCaptureButton(
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
                            }
                          }
                        });
                      },
                      child: const CustomCaptureButton(
                          icon: Icons.camera_outlined),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          direction = direction == 0 ? 1 : 0;
                          startCamera(direction);
                        });
                      },
                      child: const CustomCaptureButton(
                          icon: Icons.flip_camera_ios_outlined),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
