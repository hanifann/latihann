// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';

Color colorFromJson(String str) => Color.fromJson(json.decode(str));

String colorToJson(Color data) => json.encode(data.toJson());

class Color {
    Color({
        this.data,
        this.support,
    });

    Data? data;
    Support? support;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "support": support!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.year,
        this.color,
        this.pantoneValue,
    });

    int? id;
    String? name;
    int? year;
    String? color;
    String? pantoneValue;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
    };
}

class Support {
    Support({
        this.url,
        this.text,
    });

    String? url;
    String? text;

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
