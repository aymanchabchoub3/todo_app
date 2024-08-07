// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final int index;
  final Function delete;

  const Todocard(
      {super.key,
      required this.vartitle,
      required this.changeStatus,
      required this.index,
      required this.delete,
      required this.doneORnot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  //  condition? true : false
                  color: doneORnot
                      ? Color.fromARGB(255, 27, 26, 26)
                      : Colors.white,
                  fontSize: 22,
                  decoration: doneORnot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneORnot ? Icons.check : Icons.close,
                    size: 27,
                    color: doneORnot ? Colors.green[400] : Colors.red,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 27,
                    color: Color.fromARGB(255, 255, 200, 196),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
