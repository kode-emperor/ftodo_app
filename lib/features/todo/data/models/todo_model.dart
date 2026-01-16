import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  const TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt
  });

  //covert to entity
  TodoEntity toEntity() {
    return TodoEntity( 
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt
    );
  }

  //covert from JSON 
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '', 
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? '',
      createdAt: DateTime.parse(json['createdAt'])
    );
  }

  // convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title ,
      'description': description, 
      'isCompleted': isCompleted,
      'createdAt': createdAt
    };
  }

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoModel( 
      id: id ?? this.id,
      title: title ?? this.title, 
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted, createdAt];
}