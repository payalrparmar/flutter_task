import 'package:flutter_task/model/variants_bloc.dart';

//"products":[{"id":1,"name":"Nike Sneakers","date_added":"2016-12-09T11:16:11.000Z",
class SubProduts {
  int? id;
  String? name;
  String? dateAdded;
  List<Variants>? variants;

  //Tax? tax;

  SubProduts({this.id, this.name, this.dateAdded, this.variants});

  SubProduts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // dateAdded = json['date_added'];
    if (json['variants'] != null) {
      variants = [];
      json['variants'].forEach((v) {
        variants?.add(new Variants.fromJson(v));
      });
//     }tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['date_added'] = this.dateAdded;
      if (this.variants != null) {
        data['variants'] = this.variants!.map((v) => v.toJson()).toList();
      }

      return data;
    }
  }
}
