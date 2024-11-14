import 'package:flutter/material.dart';

class PreView extends StatelessWidget {

  final String text;
  final int fontSize;


  const PreView({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          title: const Text("Preview"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 204, 179, 253),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$text",
                  style: TextStyle(
                    fontSize: fontSize.toDouble(),
                  ),
                ),
              ],

            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(onPressed: (){
                  Navigator.pop(context, "OK");
                }, child: const Text("OK")),
                const SizedBox(width: 20,),
                OutlinedButton(onPressed: (){
                  Navigator.pop(context, "Cancel");
                }, child: const Text("Cancel"))
              ],
            )
          ],
        )
    ),
      onWillPop: () async{

        Navigator.of(context).pop("BackPressed");
        return false;
      },);
  }
}