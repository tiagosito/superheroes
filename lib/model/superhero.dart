import 'dart:convert';

class Superhero {
  Superhero({
    required this.id,
    required this.name,
    this.slug,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  final int id;
  final String name;
  final String? slug;
  final Powerstats? powerstats;
  final Appearance? appearance;
  final Biography? biography;
  final Work? work;
  final Connections? connections;
  final Images? images;

  factory Superhero.fromJson(String str) => Superhero.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Superhero.fromMap(Map<String, dynamic> json) => Superhero(
        id: json["id"],
        name: json["name"] ?? 'Name not found',
        slug: json["slug"] ?? 'Not loaded',
        powerstats: json["powerstats"] == null ? null : Powerstats.fromMap(json["powerstats"]),
        appearance: json["appearance"] == null ? null : Appearance.fromMap(json["appearance"]),
        biography: json["biography"] == null ? null : Biography.fromMap(json["biography"]),
        work: json["work"] == null ? null : Work.fromMap(json["work"]),
        connections: json["connections"] == null ? null : Connections.fromMap(json["connections"]),
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "powerstats": powerstats == null ? null : powerstats?.toMap(),
        "appearance": appearance == null ? null : appearance?.toMap(),
        "biography": biography == null ? null : biography?.toMap(),
        "work": work == null ? null : work?.toMap(),
        "connections": connections == null ? null : connections?.toMap(),
        "images": images == null ? null : images?.toMap(),
      };
}

class Appearance {
  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  final String? gender;
  final String? race;
  final List<String>? height;
  final List<String>? weight;
  final String? eyeColor;
  final String? hairColor;

  factory Appearance.fromJson(String str) => Appearance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appearance.fromMap(Map<String, dynamic> json) => Appearance(
        gender: json["gender"],
        race: json["race"] ?? 'Not loaded',
        height: json["height"] == null ? ['0.0 lb', '0.0 kg'] : List<String>.from(json["height"].map((x) => x)),
        weight: json["weight"] == null ? ['0.0 lb', '0.0 kg'] : List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eyeColor"] ?? 'Not loaded',
        hairColor: json["hairColor"] ?? 'Not loaded',
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "race": race,
        "height": height == null ? null : List<dynamic>.from(height!.map((x) => x)),
        "weight": weight == null ? null : List<dynamic>.from(weight!.map((x) => x)),
        "eyeColor": eyeColor,
        "hairColor": hairColor,
      };
}

class Biography {
  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  final String? fullName;
  final String? alterEgos;
  final List<String>? aliases;
  final String? placeOfBirth;
  final String? firstAppearance;
  final String? publisher;
  final String? alignment;

  factory Biography.fromJson(String str) => Biography.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Biography.fromMap(Map<String, dynamic> json) => Biography(
        fullName: (json["fullName"] != null && json["fullName"] != '') ? json["fullName"] : 'Not loaded',
        alterEgos: json["alterEgos"] ?? 'Not loaded',
        aliases: json["aliases"] == null ? ['Not loaded'] : List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["placeOfBirth"] ?? 'Not loaded',
        firstAppearance: json["firstAppearance"] ?? 'Not loaded',
        publisher: json["publisher"] ?? 'Not loaded',
        alignment: json["alignment"] ?? 'Not loaded',
      );

  Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "alterEgos": alterEgos,
        "aliases": aliases == null ? null : List<dynamic>.from(aliases!.map((x) => x)),
        "placeOfBirth": placeOfBirth,
        "firstAppearance": firstAppearance,
        "publisher": publisher,
        "alignment": alignment,
      };
}

class Connections {
  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  final String? groupAffiliation;
  final String? relatives;

  factory Connections.fromJson(String str) => Connections.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Connections.fromMap(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["groupAffiliation"] ?? 'Not loaded',
        relatives: json["relatives"] ?? 'Not loaded',
      );

  Map<String, dynamic> toMap() => {
        "groupAffiliation": groupAffiliation,
        "relatives": relatives,
      };
}

class Images {
  Images({
    this.xs,
    this.sm,
    this.md,
    this.lg,
  });

  final String? xs;
  final String? sm;
  final String? md;
  final String? lg;

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
      );

  Map<String, dynamic> toMap() => {
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
      };
}

class Powerstats {
  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  final int? intelligence;
  final int? strength;
  final int? speed;
  final int? durability;
  final int? power;
  final int? combat;

  factory Powerstats.fromJson(String str) => Powerstats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Powerstats.fromMap(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"] ?? '0',
        strength: json["strength"] ?? '0',
        speed: json["speed"],
        durability: json["durability"] ?? '0',
        power: json["power"] ?? '0',
        combat: json["combat"] ?? '0',
      );

  Map<String, dynamic> toMap() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}

class Work {
  Work({
    this.occupation,
    this.base,
  });

  final String? occupation;
  final String? base;

  factory Work.fromJson(String str) => Work.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Work.fromMap(Map<String, dynamic> json) => Work(
        occupation: json["occupation"] ?? 'Not loaded',
        base: json["base"] ?? 'Not loaded',
      );

  Map<String, dynamic> toMap() => {
        "occupation": occupation,
        "base": base,
      };
}
