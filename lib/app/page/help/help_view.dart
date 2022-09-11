import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/page/help/help_controller.dart';

import '../../../constant.dart';
import '../../widgets/help/custom_help_box.dart';


class HelpView extends View {
  const HelpView({Key? key}) : super(key: key);

  @override
  HelpViewState createState() => HelpViewState();
}

class HelpViewState extends ViewState<HelpView, HelpController> {
  HelpViewState() : super(HelpController());

  @override
  Widget get view {
   return ControlledWidgetBuilder<HelpController>(
     builder: (context, controller) {
     return Scaffold(
       key: globalKey,
       appBar: AppBar(
         backgroundColor: Constant.lightColorScheme.primary,
         title:  Text('Help',
           style: GoogleFonts.prompt(
               fontWeight: FontWeight.w500,
               color: Colors.black.withOpacity(0.7)
           ),
         ),)
       ,
       body: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(
               height: MediaQuery.of(context).size.height / 3.1,
               child: Hero(
                 tag: 'mid',
                 child: Container(
                   decoration: const BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage(
                             "assets/images/how.png",
                           ), fit: BoxFit.cover)
                   ),
                 ),
               ) ,),
             SizedBox(
               height: MediaQuery.of(context).size.height / 1.727,
               child: Container(
                 margin: const EdgeInsets.only(top: 5),
                 decoration: const BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(15),
                       topRight: Radius.circular(15),
                     )),
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 35, top: 20, bottom: 20),
                     child: Column(
                       children: const [
                         CustomHelpBox(),
                         SizedBox(height: 25,),
                         CustomHelpBox(
                             image: 'assets/images/tiny_2.png',
                           text: 'After capturing a soil image, just a few '
                               'moments, the results of the soil captured will be'
                               ' displayed. ',
                         ),
                         SizedBox(height: 25,),
                         CustomHelpBox(
                             image: 'assets/images/tiny_3.png',
                           text: 'The results includes: Munsell color notation '
                               'values, Soil classification according to the soil'
                               ' color and the soil\'s nutrients detected '
                               'according to its color. ',
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),);
   },);
  }

}
