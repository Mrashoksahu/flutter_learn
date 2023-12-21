import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculaterView extends StatefulWidget {
  @override
  State<CalculaterView> createState() => _CalculaterViewState();
}

class _CalculaterViewState extends State<CalculaterView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneControler = TextEditingController();
  final displayTwoControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneControler.text = x.toString();
    displayTwoControler.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalclulaterDisplay(
              key: const Key("DisplayOne"),
              hint: "Enter First Number",
              controller: displayOneControler),
          const SizedBox(
            height: 30,
          ),
          CalclulaterDisplay(
              key: const Key("DisplayTwo"),
              hint: "Enter Second Number",
              controller: displayTwoControler),
          const SizedBox(
            height: 30,
          ),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControler.text)! +
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControler.text)! -
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControler.text)! *
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControler.text)! /
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  x = 0;
                  y = 0;
                  z = 0;
                  displayOneControler.clear();
                  displayTwoControler.clear();
                });
              },
              label: const Text("clear")),
        ],
      ),
    );
  }
}

class CalclulaterDisplay extends StatelessWidget {
  const CalclulaterDisplay(
      {super.key, this.hint = "Enter a Number", required this.controller});
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
