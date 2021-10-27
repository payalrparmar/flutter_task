/// id : 1
/// view_count : 56700
import 'Products.dart';

import 'package:flutter_task/model/variants_bloc.dart';

class Products {
  Products({
    this.id,
    this.viewCount,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    viewCount = json['view_count'];
  }
  int? id;
  int? viewCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['view_count'] = viewCount;
    return map;
  }
}
