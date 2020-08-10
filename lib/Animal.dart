import 'dart:convert';

class Animal {
  final String name;
  final String slug;
  final String sound;
  Animal({
    this.name,
    this.slug,
    this.sound,
  });

  Animal copyWith({
    String name,
    String slug,
    String sound,
  }) {
    return Animal(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      sound: sound ?? this.sound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'slug': slug,
      'sound': sound,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Animal(
      name: map['name'],
      slug: map['slug'],
      sound: map['sound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source));

  @override
  String toString() => 'Animal(name: $name, slug: $slug, sound: $sound)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Animal && o.name == name && o.slug == slug && o.sound == sound;
  }

  @override
  int get hashCode => name.hashCode ^ slug.hashCode ^ sound.hashCode;
}
