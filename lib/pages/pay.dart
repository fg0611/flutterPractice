import 'package:flutter/material.dart';

import 'codes.dart';
import 'scanner.dart';


class Pay extends StatelessWidget {
  const Pay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Expanded(child: Container()),
        Center(      	
  child: Container(
    width: double.infinity,
    // width: 300,
    margin:
            const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10)
                // topLeft: Radius.circular(10.0),
                // bottomLeft: Radius.circular(10.0),
                // bottomRight: Radius.circular(10.0),
                // topRight: Radius.circular(10.0),
              // border: Border.all(color: Colors.black),
              ),),
    child: TextButton(
          style: TextButton.styleFrom(primary: Colors.white),
          child: const Text('Payment'),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Scanner()),
    );
}
    ),
  )
        ),
      ],
    );
  }
}