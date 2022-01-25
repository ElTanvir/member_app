import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/newsportal/data/data_models/category_model.dart';
import 'package:member_app/features/newsportal/data/data_models/gallery_image_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls

class NewsModel {
  int id;
  String post_title;
  String? short_description;
  String long_description;
  String? youtube_video_link;
  int status;
  String uploader_info;
  String? thumbnail_image;
  String created_at;
  String updated_at;
  List<GalleryImageModel> gallery_images;
  List<NewsCategoryModel> categories;
  NewsModel({
    required this.id,
    required this.post_title,
    this.short_description,
    required this.long_description,
    this.youtube_video_link,
    required this.status,
    required this.uploader_info,
    this.thumbnail_image,
    required this.created_at,
    required this.updated_at,
    required this.gallery_images,
    required this.categories,
  });

  NewsModel copyWith({
    int? id,
    String? post_title,
    String? short_description,
    String? long_description,
    String? youtube_video_link,
    int? status,
    String? uploader_info,
    String? thumbnail_image,
    String? created_at,
    String? updated_at,
    List<GalleryImageModel>? gallery_images,
    List<NewsCategoryModel>? categories,
  }) {
    return NewsModel(
      id: id ?? this.id,
      post_title: post_title ?? this.post_title,
      short_description: short_description ?? this.short_description,
      long_description: long_description ?? this.long_description,
      youtube_video_link: youtube_video_link ?? this.youtube_video_link,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
      thumbnail_image: thumbnail_image ?? this.thumbnail_image,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      gallery_images: gallery_images ?? this.gallery_images,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_title': post_title,
      'short_description': short_description,
      'long_description': long_description,
      'youtube_video_link': youtube_video_link,
      'status': status,
      'uploader_info': uploader_info,
      'thumbnail_image': thumbnail_image,
      'created_at': created_at,
      'updated_at': updated_at,
      'gallery_images': gallery_images.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id']?.toInt() ?? 0,
      post_title: map['post_title'] ?? '',
      short_description: map['short_description'],
      long_description: map['long_description'] ?? '',
      youtube_video_link: map['youtube_video_link'],
      status: map['status']?.toInt() ?? 0,
      uploader_info: map['uploader_info'] ?? '',
      thumbnail_image: map['thumbnail_image'],
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      gallery_images: List<GalleryImageModel>.from(
          map['gallery_images']?.map((x) => GalleryImageModel.fromMap(x))),
      categories: List<NewsCategoryModel>.from(
          map['categories']?.map((x) => NewsCategoryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsModel(id: $id, post_title: $post_title, short_description: $short_description, long_description: $long_description, youtube_video_link: $youtube_video_link, status: $status, uploader_info: $uploader_info, thumbnail_image: $thumbnail_image, created_at: $created_at, updated_at: $updated_at, gallery_images: $gallery_images, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.id == id &&
        other.post_title == post_title &&
        other.short_description == short_description &&
        other.long_description == long_description &&
        other.youtube_video_link == youtube_video_link &&
        other.status == status &&
        other.uploader_info == uploader_info &&
        other.thumbnail_image == thumbnail_image &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        listEquals(other.gallery_images, gallery_images) &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        post_title.hashCode ^
        short_description.hashCode ^
        long_description.hashCode ^
        youtube_video_link.hashCode ^
        status.hashCode ^
        uploader_info.hashCode ^
        thumbnail_image.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        gallery_images.hashCode ^
        categories.hashCode;
  }
}
