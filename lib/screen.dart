// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ChipTextFieldScreen extends StatefulWidget {
  const ChipTextFieldScreen({super.key});

  @override
  State<ChipTextFieldScreen> createState() => _ChipTextFieldScreenState();
}

class _ChipTextFieldScreenState extends State<ChipTextFieldScreen> {
  TextEditingController tagsController = TextEditingController();
  List<String> tags = [];

  void saveTag(String value) {
    print('Adding $value to tags list');
    setState(() {
      tags.add(value);
      tagsController.text = '';
    });
  }

  void deleteTag(String value) {
    print('Removing $value from tags list');
    setState(() {
      tags.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text to Chip Field',
        ),
      ),
      body: Center(
        child: Container(
          width: size.width * 0.9,
          padding: const EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              tags.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: tags.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 45,
                      ),
                      itemBuilder: (context, index) => Chip(
                        label: Text(
                          tags[index],
                        ),
                        padding: const EdgeInsets.all(0),
                        onDeleted: () => deleteTag(tags[index]),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: tags.isNotEmpty ? 20 : 0,
              ),
              TextFormField(
                controller: tagsController,
                cursorColor: Colors.teal,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: "Enter tag here",
                ),
                onFieldSubmitted: (value) => saveTag(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
