import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  final _formKey = GlobalKey<FormState>();

  final kanjiController = TextEditingController();
  final significationController = TextEditingController();
  final descriptionController = TextEditingController();
  final lignesController = TextEditingController();
  String selectedJLPT = '5';

  @override
  void dispose() {
    super.dispose();

    kanjiController.dispose();
    significationController.dispose();
    descriptionController.dispose();
    lignesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Kanji',
                      hintText: 'Entrez le kanji',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Tu dois completer ce champ';
                    }
                  },
                  controller: kanjiController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Signification',
                      hintText: 'Entrez la signification',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Tu dois completer ce champ';
                    }
                  },
                  controller: significationController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Entrez la description',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Tu dois completer ce champ';
                    }
                  },
                  controller: descriptionController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Lignes',
                      hintText: 'Entrez le nombre de lignes',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Tu dois completer ce champ';
                    }
                  },
                  controller: lignesController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value:'1', child: Text('1')),
                      DropdownMenuItem(value:'2', child: Text('2')),
                      DropdownMenuItem(value:'3', child: Text('3')),
                      DropdownMenuItem(value:'4', child: Text('4')),
                      DropdownMenuItem(value:'5', child: Text('5'))
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    value: selectedJLPT,
                    onChanged: (value){
                      setState(() {
                        selectedJLPT = value!;
                      });
                    }
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){

                        final kanji = kanjiController.text;
                        final signification = significationController.text;
                        final description = descriptionController.text;
                        final lignes = lignesController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Envoie en cours...'))
                        );
                        FocusScope.of(context).requestFocus(FocusNode());

                        var url = Uri.parse('https://ishigami.mogax.fr/words');
                        await http.post(url,
                            body: json.encode({
                              kanji:kanji,
                              signification:signification,
                              description:description,
                              lignes:lignes,
                              selectedJLPT:selectedJLPT
                            })
                        );
                      }
                    },
                    child: Text("Envoyer")
                ),
              )
            ],
          )
      ),
    );
  }
}

