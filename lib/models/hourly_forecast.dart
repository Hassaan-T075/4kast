// To parse this JSON data, do
//
//     final forecast = forecastFromJson(jsonString);

import 'dart:convert';

List<Forecast> forecastFromJson(String str) => List<Forecast>.from(json.decode(str).map((x) => Forecast.fromJson(x)));

String forecastToJson(List<Forecast> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forecast {
    Forecast({
        required this.dateTime,
        required this.epochDateTime,
        required this.weatherIcon,
        required this.iconPhrase,
        required this.hasPrecipitation,
        required this.isDaylight,
        required this.temperature,
        required this.precipitationProbability,
        required this.mobileLink,
        required this.link,
    });

    String dateTime;
    int epochDateTime;
    int weatherIcon;
    IconPhrase? iconPhrase;
    bool hasPrecipitation;
    bool isDaylight;
    Temperature temperature;
    int precipitationProbability;
    String mobileLink;
    String link;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        dateTime: json["DateTime"],
        epochDateTime: json["EpochDateTime"],
        weatherIcon: json["WeatherIcon"],
        iconPhrase: iconPhraseValues.map[json["IconPhrase"]],
        hasPrecipitation: json["HasPrecipitation"],
        isDaylight: json["IsDaylight"],
        temperature: Temperature.fromJson(json["Temperature"]),
        precipitationProbability: json["PrecipitationProbability"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "DateTime": dateTime,
        "EpochDateTime": epochDateTime,
        "WeatherIcon": weatherIcon,
        "IconPhrase": iconPhraseValues.reverse[iconPhrase],
        "HasPrecipitation": hasPrecipitation,
        "IsDaylight": isDaylight,
        "Temperature": temperature.toJson(),
        "PrecipitationProbability": precipitationProbability,
        "MobileLink": mobileLink,
        "Link": link,
    };
}

enum IconPhrase { HAZY_SUNSHINE }

final iconPhraseValues = EnumValues({
    "Hazy sunshine": IconPhrase.HAZY_SUNSHINE
});

class Temperature {
    Temperature({
        required this.value,
        required this.unit,
        required this.unitType,
    });

    double value;
    Unit? unit;
    int unitType;

    factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
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
