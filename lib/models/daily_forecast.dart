// To parse this JSON data, do
//
//     final dailyForecast = dailyForecastFromJson(jsonString);

import 'dart:convert';

DailyForecast dailyForecastFromJson(String str) => DailyForecast.fromJson(json.decode(str));

String dailyForecastToJson(DailyForecast data) => json.encode(data.toJson());

class DailyForecast {
    DailyForecast({
        required this.headline,
        required this.dailyForecasts,
    });

    Headline headline;
    List<DailyForecastElement> dailyForecasts;

    factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        headline: Headline.fromJson(json["Headline"]),
        dailyForecasts: List<DailyForecastElement>.from(json["DailyForecasts"].map((x) => DailyForecastElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Headline": headline.toJson(),
        "DailyForecasts": List<dynamic>.from(dailyForecasts.map((x) => x.toJson())),
    };
}

class DailyForecastElement {
    DailyForecastElement({
        required this.date,
        required this.epochDate,
        required this.temperature,
        required this.day,
        required this.night,
        required this.sources,
        required this.mobileLink,
        required this.link,
    });

    DateTime date;
    int epochDate;
    Temperature temperature;
    Day day;
    Day night;
    List<String> sources;
    String mobileLink;
    String link;

    factory DailyForecastElement.fromJson(Map<dynamic, dynamic> json) => DailyForecastElement(
        date: DateTime.parse(json["Date"]),
        epochDate: json["EpochDate"],
        temperature: Temperature.fromJson(json["Temperature"]),
        day: Day.fromJson(json["Day"]),
        night: Day.fromJson(json["Night"]),
        sources: List<String>.from(json["Sources"].map((x) => x)),
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "Date": date.toIso8601String(),
        "EpochDate": epochDate,
        "Temperature": temperature.toJson(),
        "Day": day.toJson(),
        "Night": night.toJson(),
        "Sources": List<dynamic>.from(sources.map((x) => x)),
        "MobileLink": mobileLink,
        "Link": link,
    };
}

class Day {
    Day({
        required this.icon,
        required this.iconPhrase,
        required this.hasPrecipitation,
    });

    int icon;
    IconPhrase? iconPhrase;
    bool hasPrecipitation;

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json["Icon"],
        iconPhrase: iconPhraseValues.map[json["IconPhrase"]],
        hasPrecipitation: json["HasPrecipitation"],
    );

    Map<String, dynamic> toJson() => {
        "Icon": icon,
        "IconPhrase": iconPhraseValues.reverse[iconPhrase],
        "HasPrecipitation": hasPrecipitation,
    };
}

enum IconPhrase { HOT, HAZY_SUNSHINE, CLEAR }

final iconPhraseValues = EnumValues({
    "Clear": IconPhrase.CLEAR,
    "Hazy sunshine": IconPhrase.HAZY_SUNSHINE,
    "Hot": IconPhrase.HOT
});

class Temperature {
    Temperature({
        required this.minimum,
        required this.maximum,
    });

    Imum minimum;
    Imum maximum;

    factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        minimum: Imum.fromJson(json["Minimum"]),
        maximum: Imum.fromJson(json["Maximum"]),
    );

    Map<String, dynamic> toJson() => {
        "Minimum": minimum.toJson(),
        "Maximum": maximum.toJson(),
    };
}

class Imum {
    Imum({
        required this.value,
        required this.unit,
        required this.unitType,
    });

    double value;
    Unit? unit;
    int unitType;

    factory Imum.fromJson(Map<String, dynamic> json) => Imum(
        value: json["Value"].toDouble(),
        unit: unitValues.map[json["Unit"]],
        unitType: json["UnitType"],
    );

    Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unitValues.reverse[unit],
        "UnitType": unitType,
    };
}

enum Unit { C }

final unitValues = EnumValues({
    "C": Unit.C
});

class Headline {
    Headline({
        required this.effectiveDate,
        required this.effectiveEpochDate,
        required this.severity,
        required this.text,
        required this.category,
        //required this.endDate,
        //required this.endEpochDate,
        required this.mobileLink,
        required this.link,
    });

    DateTime effectiveDate;
    int effectiveEpochDate;
    int severity;
    String text;
    String category;
    //DateTime endDate;
    //int endEpochDate;
    String mobileLink;
    String link;

    factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        effectiveDate: DateTime.parse(json["EffectiveDate"]),
        effectiveEpochDate: json["EffectiveEpochDate"],
        severity: json["Severity"],
        text: json["Text"],
        category: json["Category"],
        //endDate: DateTime.parse(json["EndDate"]),
        //endEpochDate: json["EndEpochDate"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "EffectiveDate": effectiveDate.toIso8601String(),
        "EffectiveEpochDate": effectiveEpochDate,
        "Severity": severity,
        "Text": text,
        "Category": category,
        //"EndDate": endDate.toIso8601String(),
        //"EndEpochDate": endEpochDate,
        "MobileLink": mobileLink,
        "Link": link,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
