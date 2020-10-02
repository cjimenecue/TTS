import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:flutter_tts/flutter_tts_web.dart';

class TTSScreen extends StatefulWidget {
  @override
  _TTSScreenState createState() => _TTSScreenState();
}

class _TTSScreenState extends State<TTSScreen> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController _txtfieldController = new TextEditingController();
  String valueList = "Español";
  List<DropdownMenuItem<String>> menuList;
  String valorLista = "Español";

  void initList() {
    menuList = [
      new DropdownMenuItem<String>(
          value: "Español",
          child: Text("Español",
              style: TextStyle(
                color: Colors.white,
              ))),
      new DropdownMenuItem<String>(
          value: "Inglés",
          child: Text("Inglés",
              style: TextStyle(
                color: Colors.white,
              ))),
      new DropdownMenuItem<String>(
          value: "Chino",
          child: Text("Chino",
              style: TextStyle(
                color: Colors.white,
              )))
    ];
  }

  @override
  Widget build(BuildContext context) {
    initList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lector TTS"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Center(
            child: DropdownButton(
              items: menuList,
              /*items: lista.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),*/
              dropdownColor: Colors.green,
              icon: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              value: valueList,
              onChanged: (String valorNuevo) {
                setState(() {
                  valueList = valorNuevo;
                });
              },
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 40.0, top: 8.0, bottom: 8.0),
              child: TextField(
                controller: _txtfieldController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Escriba aquí el texto",
                  icon: Icon(
                    Icons.record_voice_over,
                  ),
                ),
                maxLines: 30,
                minLines: 1,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FloatingActionButton.extended(
                  label: Text("REPRODUCIR"),
                  onPressed: () => _voice(),
                  icon: Icon(Icons.play_arrow)),
              SizedBox(
                width: 25.0,
              ),
              FloatingActionButton.extended(
                  label: Text("DETENER"),
                  onPressed: () => tts.stop(),
                  icon: Icon(Icons.stop)),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  void _voice() {
    // Podríamos haber hecho un mapa, con la clave el nombre del idioma
    // y el valor como el identificador del idioma en el TTS,
    // pero al ser pocos es más sencillo de esta manera.
    if (valueList == "Español") {
      tts.setLanguage("es-Es");
    } else if (valueList == "Chino") {
      tts.setLanguage("zh-CN");
    } else if (valueList == "Inglés") {
      tts.setLanguage("en-US");
    }
    tts.speak(_txtfieldController.text);
  }
}
