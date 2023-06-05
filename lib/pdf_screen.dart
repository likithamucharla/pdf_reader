import 'dart:html';

import 'package:edu_flex/consts.dart';
import 'package:flutter/material.dart';

class PDFScreen extends StatefulWidget {
  final int index;
  final String? path;
  const PDFScreen({super.key, required this.path, required this.index});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
    late PdfController pdfController;
    var url="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

   loadController() async{
     switch(widget.index){
      case 0:
      pdfController = pdfController(document:PdfDocument.openAsset('assets/sample.pdf'));
      break;
      case 1:
      pdfController= pdfController(document:PdfDocument.openData(InternetFile.get(url)));
      break;
      case 2:
      pdfController=pdfController(document:PdfDocument.openFile(widget.path));
      default:
     }     
    Future.delayed(const Duration(seconds: 2),() {
      setState((){});
    });
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const  EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Text(
          pdfController.pagesCount ==null? '': "Pages: ${pdfController.pagesCount}",
          style: textStyle(font: poppins),
          ),
          )
        ],
        title: Text("Filename",style: textStyle()),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back_ios_new_rounded,color: btnColor)),
      ),
      body: Center(
      child: PdfView(controller:pdfController),
      ),
    );
  }
}