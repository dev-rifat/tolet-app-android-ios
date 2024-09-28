class GoogleApiModel {
  List<Predictions>? predictions;

  GoogleApiModel({this.predictions});

  GoogleApiModel.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions!.add(new Predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.predictions != null) {
      data['predictions'] = this.predictions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Predictions {
  String? description;
  StructuredFormatting? structuredFormatting;
  String? placeId;
  String? reference;
  List<Terms>? terms;
  List<String>? types;

  Predictions(
      {this.description,
        this.structuredFormatting,
        this.placeId,
        this.reference,
        this.terms,
        this.types});

  Predictions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    structuredFormatting = json['structured_formatting'] != null
        ? new StructuredFormatting.fromJson(json['structured_formatting'])
        : null;
    placeId = json['place_id'];
    reference = json['reference'];
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(new Terms.fromJson(v));
      });
    }
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.structuredFormatting != null) {
      data['structured_formatting'] = this.structuredFormatting!.toJson();
    }
    data['place_id'] = this.placeId;
    data['reference'] = this.reference;
    if (this.terms != null) {
      data['terms'] = this.terms!.map((v) => v.toJson()).toList();
    }
    data['types'] = this.types;
    return data;
  }
}

class StructuredFormatting {
  String? mainText;
  String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    secondaryText = json['secondary_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_text'] = this.mainText;
    data['secondary_text'] = this.secondaryText;
    return data;
  }
}

class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['value'] = this.value;
    return data;
  }
}
