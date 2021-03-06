import 'package:flutter_picgo/components/manage_item.dart';

class GiteeContent {
  FileContentType type;
  int size;
  String name;
  String path;
  String sha;
  String url;
  String htmlUrl;
  String downloadUrl;

  GiteeContent(
      {this.type,
      this.size,
      this.name,
      this.path,
      this.sha,
      this.url,
      this.htmlUrl,
      this.downloadUrl});

  GiteeContent.fromJson(Map<String, dynamic> json) {
    type = json['type'] == 'file' ? FileContentType.FILE : FileContentType.DIR;
    size = json['size'];
    name = json['name'];
    path = json['path'];
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
    downloadUrl = json['download_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type == FileContentType.FILE ? 'file' : 'dir';
    data['size'] = this.size;
    data['name'] = this.name;
    data['path'] = this.path;
    data['sha'] = this.sha;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['download_url'] = this.downloadUrl;
    return data;
  }
}
