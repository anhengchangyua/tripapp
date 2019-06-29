import 'banner_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';
import 'local_nav_list_model.dart';
import 'sales_model.dart';
import 'sub_nav_model.dart';

class HomeModel {
  Config config;
  List<BannerList> bannerList;
  List<LocalNavList> localNavList;
  List<SubNavList> subNavList;
  GridNav gridNav;
  SalesBox salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  HomeModel.fromJson(Map<String, dynamic> json) {
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    if (json['bannerList'] != null) {
      bannerList = new List<BannerList>();
      json['bannerList'].forEach((v) {
        bannerList.add(new BannerList.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = new List<LocalNavList>();
      json['localNavList'].forEach((v) {
        localNavList.add(new LocalNavList.fromJson(v));
      });
    }
    gridNav =
        json['gridNav'] != null ? new GridNav.fromJson(json['gridNav']) : null;
    if (json['subNavList'] != null) {
      subNavList = new List<SubNavList>();
      json['subNavList'].forEach((v) {
        subNavList.add(new SubNavList.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBox.fromJson(json['salesBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}
