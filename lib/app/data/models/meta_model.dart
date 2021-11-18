class Meta {
  int? count;
  int? totalCount;
  int? totalPages;
  int? currentPage;

  Meta({this.count, this.totalCount, this.totalPages, this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['total_count'] = totalCount;
    data['total_pages'] = totalPages;
    data['current_page'] = currentPage;
    return data;
  }
}
