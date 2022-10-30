import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    required this.version,
    required this.key,
    required this.type,
    required this.rank,
    required this.localizedName,
    required this.englishName,
    required this.primaryPostalCode,
    required this.region,
    required this.country,
    required this.administrativeArea,
    required this.timeZone,
    required this.geoPosition,
    required this.isAlias,
    required this.supplementalAdminAreas,
    required this.dataSets,
    required this.details,
  });

  int version;
  String key;
  String type;
  int rank;
  String localizedName;
  String englishName;
  String primaryPostalCode;
  Country region;
  Country country;
  AdministrativeArea administrativeArea;
  TimeZone timeZone;
  GeoPosition geoPosition;
  bool isAlias;
  List<SupplementalAdminArea> supplementalAdminAreas;
  List<String> dataSets;
  Details details;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        primaryPostalCode: json["PrimaryPostalCode"],
        region: Country.fromJson(json["Region"]),
        country: Country.fromJson(json["Country"]),
        administrativeArea:
            AdministrativeArea.fromJson(json["AdministrativeArea"]),
        timeZone: TimeZone.fromJson(json["TimeZone"]),
        geoPosition: GeoPosition.fromJson(json["GeoPosition"]),
        isAlias: json["IsAlias"],
        supplementalAdminAreas: List<SupplementalAdminArea>.from(
            json["SupplementalAdminAreas"]
                .map((x) => SupplementalAdminArea.fromJson(x))),
        dataSets: List<String>.from(json["DataSets"].map((x) => x)),
        details: Details.fromJson(json["Details"]),
      );

  Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "PrimaryPostalCode": primaryPostalCode,
        "Region": region.toJson(),
        "Country": country.toJson(),
        "AdministrativeArea": administrativeArea.toJson(),
        "TimeZone": timeZone.toJson(),
        "GeoPosition": geoPosition.toJson(),
        "IsAlias": isAlias,
        "SupplementalAdminAreas":
            List<dynamic>.from(supplementalAdminAreas.map((x) => x.toJson())),
        "DataSets": List<dynamic>.from(dataSets.map((x) => x)),
        "Details": details.toJson(),
      };
}

class AdministrativeArea {
  AdministrativeArea({
    required this.id,
    required this.localizedName,
    required this.englishName,
    required this.level,
    required this.localizedType,
    required this.englishType,
    required this.countryId,
  });

  String id;
  String localizedName;
  String englishName;
  int level;
  String localizedType;
  String englishType;
  String countryId;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      AdministrativeArea(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        level: json["Level"],
        localizedType: json["LocalizedType"],
        englishType: json["EnglishType"],
        countryId: json["CountryID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "Level": level,
        "LocalizedType": localizedType,
        "EnglishType": englishType,
        "CountryID": countryId,
      };
}

class Country {
  Country({
    required this.id,
    required this.localizedName,
    required this.englishName,
  });

  String id;
  String localizedName;
  String englishName;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
      };
}

class Details {
  Details({
    required this.key,
    required this.stationCode,
    required this.stationGmtOffset,
    required this.bandMap,
    required this.climo,
    required this.localRadar,
    required this.mediaRegion,
    required this.metar,
    required this.nxMetro,
    required this.nxState,
    required this.population,
    required this.primaryWarningCountyCode,
    required this.primaryWarningZoneCode,
    required this.satellite,
    required this.synoptic,
    required this.marineStation,
    required this.marineStationGmtOffset,
    required this.videoCode,
    required this.locationStem,
    required this.partnerId,
    required this.sources,
    required this.canonicalPostalCode,
    required this.canonicalLocationKey,
    required this.dma,
  });

  String key;
  String stationCode;
  double stationGmtOffset;
  String bandMap;
  String climo;
  String localRadar;
  String? mediaRegion;
  String metar;
  String nxMetro;
  String nxState;
  int? population;
  String primaryWarningCountyCode;
  String primaryWarningZoneCode;
  String satellite;
  String synoptic;
  String marineStation;
  dynamic marineStationGmtOffset;
  String videoCode;
  String locationStem;
  dynamic partnerId;
  List<SourceElement> sources;
  String canonicalPostalCode;
  String canonicalLocationKey;
  Dma? dma;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        key: json["Key"],
        stationCode: json["StationCode"],
        stationGmtOffset: json["StationGmtOffset"],
        bandMap: json["BandMap"],
        climo: json["Climo"],
        localRadar: json["LocalRadar"],
        mediaRegion: json["MediaRegion"] == null ? null : json["MediaRegion"],
        metar: json["Metar"],
        nxMetro: json["NXMetro"],
        nxState: json["NXState"],
        population: json["Population"] == null ? null : json["Population"],
        primaryWarningCountyCode: json["PrimaryWarningCountyCode"],
        primaryWarningZoneCode: json["PrimaryWarningZoneCode"],
        satellite: json["Satellite"],
        synoptic: json["Synoptic"],
        marineStation: json["MarineStation"],
        marineStationGmtOffset: json["MarineStationGMTOffset"],
        videoCode: json["VideoCode"],
        locationStem: json["LocationStem"],
        partnerId: json["PartnerID"],
        sources: List<SourceElement>.from(
            json["Sources"].map((x) => SourceElement.fromJson(x))),
        canonicalPostalCode: json["CanonicalPostalCode"],
        canonicalLocationKey: json["CanonicalLocationKey"],
        dma: json["DMA"] == null ? null : Dma.fromJson(json["DMA"]),
      );

  Map<String, dynamic> toJson() => {
        "Key": key,
        "StationCode": stationCode,
        "StationGmtOffset": stationGmtOffset,
        "BandMap": bandMap,
        "Climo": climo,
        "LocalRadar": localRadar,
        "MediaRegion": mediaRegion == null ? null : mediaRegion,
        "Metar": metar,
        "NXMetro": nxMetro,
        "NXState": nxState,
        "Population": population == null ? null : population,
        "PrimaryWarningCountyCode": primaryWarningCountyCode,
        "PrimaryWarningZoneCode": primaryWarningZoneCode,
        "Satellite": satellite,
        "Synoptic": synoptic,
        "MarineStation": marineStation,
        "MarineStationGMTOffset": marineStationGmtOffset,
        "VideoCode": videoCode,
        "LocationStem": locationStem,
        "PartnerID": partnerId,
        "Sources": List<dynamic>.from(sources.map((x) => x.toJson())),
        "CanonicalPostalCode": canonicalPostalCode,
        "CanonicalLocationKey": canonicalLocationKey,
        "DMA": dma == null ? null : dma?.toJson(),
      };
}

class Dma {
  Dma({
    required this.id,
    required this.englishName,
  });

  String id;
  String englishName;

  factory Dma.fromJson(Map<String, dynamic> json) => Dma(
        id: json["ID"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "EnglishName": englishName,
      };
}

class SourceElement {
  SourceElement({
    required this.dataType,
    required this.source,
    required this.sourceId,
  });

  String dataType;
  SourceEnum? source;
  int sourceId;

  factory SourceElement.fromJson(Map<String, dynamic> json) => SourceElement(
        dataType: json["DataType"],
        source: sourceEnumValues.map[json["Source"]],
        sourceId: json["SourceId"],
      );

  Map<String, dynamic> toJson() => {
        "DataType": dataType,
        "Source": sourceEnumValues.reverse[source],
        "SourceId": sourceId,
      };
}

enum SourceEnum { PLUME_LABS, ACCU_WEATHER, U_S_NATIONAL_WEATHER_SERVICE }

final sourceEnumValues = EnumValues({
  "AccuWeather": SourceEnum.ACCU_WEATHER,
  "Plume Labs": SourceEnum.PLUME_LABS,
  "U.S. National Weather Service": SourceEnum.U_S_NATIONAL_WEATHER_SERVICE
});

class GeoPosition {
  GeoPosition({
    required this.latitude,
    required this.longitude,
    required this.elevation,
  });

  double latitude;
  double longitude;
  Elevation elevation;

  factory GeoPosition.fromJson(Map<String, dynamic> json) => GeoPosition(
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        elevation: Elevation.fromJson(json["Elevation"]),
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "Elevation": elevation.toJson(),
      };
}

class Elevation {
  Elevation({
    required this.metric,
    required this.imperial,
  });

  Imperial metric;
  Imperial imperial;

  factory Elevation.fromJson(Map<String, dynamic> json) => Elevation(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "Imperial": imperial.toJson(),
      };
}

class Imperial {
  Imperial({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  double value;
  String unit;
  int unitType;

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"],
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}

class SupplementalAdminArea {
  SupplementalAdminArea({
    required this.level,
    required this.localizedName,
    required this.englishName,
  });

  int level;
  String localizedName;
  String englishName;

  factory SupplementalAdminArea.fromJson(Map<String, dynamic> json) =>
      SupplementalAdminArea(
        level: json["Level"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
      );

  Map<String, dynamic> toJson() => {
        "Level": level,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
      };
}

class TimeZone {
  TimeZone({
    required this.code,
    required this.name,
    required this.gmtOffset,
    required this.isDaylightSaving,
    required this.nextOffsetChange,
  });

  String code;
  String name;
  double gmtOffset;
  bool isDaylightSaving;
  DateTime? nextOffsetChange;

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
        code: json["Code"],
        name: json["Name"],
        gmtOffset: json["GmtOffset"],
        isDaylightSaving: json["IsDaylightSaving"],
        nextOffsetChange: json["NextOffsetChange"] == null
            ? null
            : DateTime.parse(json["NextOffsetChange"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "GmtOffset": gmtOffset,
        "IsDaylightSaving": isDaylightSaving,
        "NextOffsetChange": nextOffsetChange == null
            ? null
            : nextOffsetChange?.toIso8601String(),
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
