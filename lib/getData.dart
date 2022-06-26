import 'package:flutter/material.dart';
import 'package:getandpost/service.dart';

import 'package:getandpost/model.dart';

class Getdata extends StatefulWidget {
  const Getdata({
    Key? key,
  }) : super(key: key);

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  Getpost getPost = Getpost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Get data")),
      ),
      body: Center(
          child: FutureBuilder<Post>(
        future: getPost.getpost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var finldata = snapshot.data;
            return ListTile(
              title: Text(finldata!.title.toString()),
              subtitle: Text(finldata.body.toString()),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
