import 'weight.dart';
import 'cat_image.dart';

class CatBreed {
  final Weight weight;
  final String id;
  final String name;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int? lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String? wikipediaUrl;
  final int hypoallergenic;
  final String? referenceImageId;
  final CatImage? image;

  CatBreed({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    this.referenceImageId,
    this.image,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      weight: Weight.fromJson(json['weight'] ?? {}),
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      cfaUrl: json['cfa_url'],
      vetstreetUrl: json['vetstreet_url'],
      vcahospitalsUrl: json['vcahospitals_url'],
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      countryCodes: json['country_codes'] ?? '',
      countryCode: json['country_code'] ?? '',
      description: json['description'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      indoor: json['indoor'] ?? 0,
      lap: json['lap'],
      altNames: json['alt_names'] ?? '',
      adaptability: json['adaptability'] ?? 0,
      affectionLevel: json['affection_level'] ?? 0,
      childFriendly: json['child_friendly'] ?? 0,
      dogFriendly: json['dog_friendly'] ?? 0,
      energyLevel: json['energy_level'] ?? 0,
      grooming: json['grooming'] ?? 0,
      healthIssues: json['health_issues'] ?? 0,
      intelligence: json['intelligence'] ?? 0,
      sheddingLevel: json['shedding_level'] ?? 0,
      socialNeeds: json['social_needs'] ?? 0,
      strangerFriendly: json['stranger_friendly'] ?? 0,
      vocalisation: json['vocalisation'] ?? 0,
      experimental: json['experimental'] ?? 0,
      hairless: json['hairless'] ?? 0,
      natural: json['natural'] ?? 0,
      rare: json['rare'] ?? 0,
      rex: json['rex'] ?? 0,
      suppressedTail: json['suppressed_tail'] ?? 0,
      shortLegs: json['short_legs'] ?? 0,
      wikipediaUrl: json['wikipedia_url'],
      hypoallergenic: json['hypoallergenic'] ?? 0,
      referenceImageId: json['reference_image_id'],
      image: json['image'] != null ? CatImage.fromJson(json['image']) : null,
    );
  }
} 