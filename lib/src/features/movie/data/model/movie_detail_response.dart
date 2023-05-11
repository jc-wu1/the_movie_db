import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieDetailResponse extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final num? budget;
  final List<Genre>? genres;
  final String? homepage;
  final num? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final num? revenue;
  final num? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;
  final Reviews? reviews;

  const MovieDetailResponse({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.reviews,
  });

  factory MovieDetailResponse.fromRawJson(String str) =>
      MovieDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      MovieDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "reviews": reviews?.toJson(),
      };

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
        reviews,
      ];
}

class Genre extends Equatable {
  final num? id;
  final String? name;

  const Genre({
    this.id,
    this.name,
  });

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class Reviews extends Equatable {
  final num? page;
  final List<Result>? results;
  final num? totalPages;
  final num? totalResults;

  const Reviews({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Reviews.fromRawJson(String str) => Reviews.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Result extends Equatable {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  const Result({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        author: json["author"],
        authorDetails: json["author_details"] == null
            ? null
            : AuthorDetails.fromJson(json["author_details"]),
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "author_details": authorDetails?.toJson(),
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
      };

  @override
  List<Object?> get props => [
        author,
        authorDetails,
        content,
        createdAt,
        id,
        updatedAt,
        url,
      ];
}

class AuthorDetails extends Equatable {
  final String? name;
  final String? username;
  final String? avatarPath;
  final num? rating;

  const AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromRawJson(String str) =>
      AuthorDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"],
        username: json["username"],
        avatarPath: json["avatar_path"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "avatar_path": avatarPath,
        "rating": rating,
      };

  @override
  List<Object?> get props => [
        name,
        username,
        avatarPath,
        rating,
      ];
}
