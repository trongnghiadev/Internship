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

  Map<String, dynamic> toJson() {
    return {
      'number_of_day': numberOfDay,
      'content': content,
    };
  }
}

class SeasonsModel {
  String? name;
  int? memberId;
  int? productId;
  String? logBook;

  // LogBooks logBook;
  int? harvest;
  int? pack;
  String? logistic;

  SeasonsModel({
    this.name,
    this.memberId,
    this.productId,
    this.logBook,
    this.harvest,
    this.pack,
    this.logistic,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    // TODO: Err Loi o day
    var logBookJson = json['logbook'];
    var harvestJson = json['harvest'];
    var packJson = json['pack'];
    var logisticJson = json['logistic'];
    var productIdJson = json['productId'];
    var memberIdJson = json['memberId'];
    var nameJson = json['name'];

    return SeasonsModel(
      name: nameJson,
      memberId: memberIdJson,
      productId: productIdJson,
      logBook: logBookJson,
      harvest: harvestJson,
      pack: packJson,
      logistic: logisticJson,
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

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> stepsListJson =
        steps.map((step) => step.toJson()).toList();

    return {
      'id': id,
      'steps': stepsListJson,
    };
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
