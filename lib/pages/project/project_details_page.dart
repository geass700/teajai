import 'package:flutter/material.dart';
import 'package:teajai/models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            project.title,
            overflow: TextOverflow.ellipsis,
          )),
      body: Container(),
    );
  }
}