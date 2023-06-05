

import 'package:edu_flex/consts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

   @override
  State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen>{
    FilePickerResult? filePickerResult;

    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;

      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context)=> const PDFScreen(
                    index:0,
                    )));
            } ,
             icon: const Icon(Icons.help, color: btnColor)),
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: Colors.black87,
          ),
          centerTitle: true,
          title: Text(
            "PDF Reader",
            style: textStyle(size: 18),
          ),
         ),
          body: Column(
            children: [
              Expanded(
                child: Container(
               alignment: Alignment.centerLeft,
               child: Image.asset("assets/images/bg.jpg"),
              )),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Recent files", style: textStyle(font: poppins)),
                                  const SizedBox(height: 12),
                                  Container(
                                    height: size.height*0.13,
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                    decoration:  BoxDecoration(
                                      color: bgdark,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index){
                                        return ListTile(
                                          leading: Image.asset('asset/images/pdf.png'),
                                          title: Text(
                                            "Filename",
                                             style: textStyle(font:poppins, Color: Colors.white),
                                          ),
                                          subtitle: Text(
                                            "Path to File",
                                            style: textStyle(font: poppins, Color: Colors.white, size: 14),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {}, icon: const Icon(Icons.cancel ,color: Colors.white) ),
                                        );
                                       }),
                                      separatorBuilder: ((context,index) => const Divider(color: Colors.white)),
                                      itemCount: 3,
                                  ))
                                ],
                              ),
                          ),
                        ),
                       Expanded(
                        flex: 2,
                        child: Container(
                          padding:const EdgeInsets.all(12),
                          color: Colors.amber,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.1,
                                child: Row(
                                  children: [
                                  buttonWidget(
                                    color: blueColor,
                                    ontap: (){
                                       Navigator.push(
                                        context,
                                       MaterialPageRoute(
                                        builder: (context) => const PDFScreen(index: 1,
                                        )));   
                               },
                                    path: 'assets/images/pdf_internet.png',
                                    title: "Open URL",
                                  ),
                                  const SizedBox(width: 12),
                                  buttonWidget(
                                    color: blueColor,
                                    ontap: () async{
                                      
                        
                                      filePickerResult= await FilePicker.platform.pickFiles(
                                        allowedExtensions:['pdf'],
                                        type: FileType.custom,
                                      );
                                      if(filePickerResult!=null){
                                        var path=filePickerResult.files.single.path;
                                        Navigator.push(context, MaterialPageRoute(builder:()  => const PDFScreen(index: 2,path:path)));
                                      }
                                    },
                                    path: 'assets/images/pdf_file.png',
                                    title: "Select file",
                                  ),
                                  ],
                                 ),
                              ),
                             const SizedBox(height: 12),
                              buttonWidget(
                                color: btnColor,
                                ontap: (){},
                                path: 'assets/images/pdf.png',
                                title: "Create PDF",
                              ),
                            ],
                         ),
                      ),
                    ),
                   ],
                  ), 
                 )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(
                      "Devoloped by Baaba Devs",
                    style: textStyle(Color: Colors.black54,font: poppins,size: 14),
                  ),
                  ),
                ],
              ), 
             ); 
           }
  Widget  buttonWidget({color,path,title,ontap}) {
    return Expanded(
      child:GestureDetector(
        onTap: ontap,
                                child: Container(
                                  width:MediaQuery.of(context).size.width ,
                                padding:  const EdgeInsets.all(8),
                                decoration:  BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("$path",width: 45),
                                      Text(
                                          "$title",
                                          style: textStyle(font:poppins, Color:Colors.white),
                                        ),
                                      ],
                                    ),
                              ), 
                              ),
                          );
                        }
                   }
                   
                   class FilePickerResult {
                   }