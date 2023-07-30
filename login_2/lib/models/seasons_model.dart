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

class SeasonsModel {
  String name;
  int memberId;
  int productId;
  LogBooks logBook;
  Harvest harvest;
  Pack pack;
  Logistic logistic;

  SeasonsModel({
    required this.name,
    required this.memberId,
    required this.productId,
    required this.logBook,
    required this.harvest,
    required this.pack,
    required this.logistic,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    var logBookJson = json['log_book'];
    var harvestJson = json['harvest'];
    var packJson = json['pack'];
    var logisticJson = json['logistic'];

    return SeasonsModel(
      name: json['name'],
      memberId: json['memberId'],
      productId: json['productId'],
      logBook: LogBooks.fromJson(logBookJson),
      harvest: Harvest.fromJson(harvestJson),
      pack: Pack.fromJson(packJson),
      logistic: Logistic.fromJson(logisticJson),
    );
  }
}

class LogBooks {
  int id;
  List<StepContent> steps;

  LogBooks({required this.id, required this.steps});

  factory LogBooks.fromJson(Map<String, dynamic> json) {
    var contentString = json['content'];
    List<dynamic> contentList = jsonDecode(contentString);

    List<StepContent> stepsList =
        contentList.map((e) => StepContent.fromJson(e)).toList();

    return LogBooks(
      id: json['id'],
      steps: stepsList,
    );
  }
}

class Harvest {
  // Add your Harvest attributes here
  // ...
  Harvest();

  factory Harvest.fromJson(Map<String, dynamic> json) {
    // Parse the JSON and initialize the Harvest object
    // ...
    return Harvest();
  }
}

class Pack {
  // Add your Pack attributes here
  // ...
  Pack();

  factory Pack.fromJson(Map<String, dynamic> json) {
    // Parse the JSON and initialize the Pack object
    // ...
    return Pack();
  }
}

class Logistic {
  // Add your Logistic attributes here
  // ...
  Logistic();

  factory Logistic.fromJson(Map<String, dynamic> json) {
    // Parse the JSON and initialize the Logistic object
    // ...
    return Logistic();
  }
}
