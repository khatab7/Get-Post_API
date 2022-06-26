import 'package:flutter/material.dart';
import 'package:getandpost/model.dart';
import 'package:getandpost/service.dart';

class Postdata extends StatefulWidget {
  const Postdata({Key? key}) : super(key: key);

  @override
  State<Postdata> createState() => _PostdataState();
}

class _PostdataState extends State<Postdata> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController bodycontroller = TextEditingController();
  Future<Post>? futureCreatPost;
  SendPost sendPost = SendPost();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Create Post')),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (futureCreatPost == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: titlecontroller,
          decoration: const InputDecoration(hintText: 'Enter title'),
        ),
        TextField(
          controller: bodycontroller,
          decoration: const InputDecoration(hintText: 'Enter body'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureCreatPost = sendPost.createPost(
                  titlecontroller.text, bodycontroller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder<Post>(
      future: futureCreatPost!,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print(snapshot.data);
          var finaldata = snapshot.data;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  finaldata!.id.toString() + ' ' + finaldata.title.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(finaldata.body.toString()),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
