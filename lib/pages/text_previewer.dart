import 'package:flutter/material.dart';
import "preview.dart";

class TextPreviewer extends StatefulWidget {
  const TextPreviewer({super.key, required });

@override
State<TextPreviewer> createState() => _TextPreviewerState();
}

class _TextPreviewerState extends State<TextPreviewer> {
  final TextEditingController _controller = TextEditingController();

  String _previewText = "";
  int _sliderValue=0;

  void _showCancelAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Image(image: NetworkImage("https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090"),
            width: 50,
            height: 50,
          ),
          content: const Text("Let`s try sometsing else",
            style: TextStyle(
              fontSize: 24,
            ),

          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showOKAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Cool!",
                style: TextStyle(
                  fontSize: 24,
                ),

              ),
            ],
          ),

          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBackPressedAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Image(image: NetworkImage("https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090"),
            width: 50,
            height: 50,
          ),
          content: const Text("Don't know what to say",
            style: TextStyle(
              fontSize: 24,
            ),

          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text previewer"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 204, 179, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Text",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _previewText = text;
                      });
                    },
                  ),
                ),

              ],
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("Enter some text"),
              ],
            ),
            Row(
              children: [

                Text("Font size $_sliderValue"),

                Expanded(
                  child: Slider(
                    value: _sliderValue.toDouble(),
                    min: 0,
                    max: 100,

                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                FilledButton(onPressed: ()async {
                  final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => PreView(
                    text: _previewText,
                    fontSize: _sliderValue,
                  )));
                  if (result == "Cancel") {
                    _showCancelAlertDialog();
                  }else if(result == "OK"){
                    _showOKAlertDialog();
                  }else if(result == "BackPressed"){
                    _showBackPressedAlertDialog();
                  }
                }, child: const Text("Preview"))

              ],
            )


          ],
        ),
      ),
    );
  }
}