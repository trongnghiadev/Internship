import 'dart:convert';

class StepContent {
  int numberOfDay;
  String content;

  StepContent({required this.numberOfDay, required this.content});

  factory StepContent.fromJson(Map<String, dynamic> json) {
    return StepContent(
      numberOfDay: json['number_of_day'],
      content: json['content'],
    );
  }
}

class LogBooks {
  int id;
  int productId;
  List<StepContent> steps;

  LogBooks({required this.id, required this.productId, required this.steps});

  factory LogBooks.fromJson(Map<String, dynamic> json) {
    var contentString = json['content'];
    List<dynamic> contentList = jsonDecode(contentString);

    List<StepContent> stepsList =
    contentList.map((e) => StepContent.fromJson(e)).toList();

    return LogBooks(
      id: json['id'],
      productId: json['productId'],
      steps: stepsList,
    );
  }
}
