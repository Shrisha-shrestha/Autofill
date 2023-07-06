
// List<SearchOverviewModel> SearchOverviewListFromJson(String str) => List<SearchOverviewModel>.from(json.decode(str).map((x) => SearchOverviewModel.fromJson(x)));

class SearchOverviewModel {
    String title;
    String excerpt;
    String headerImg;
    Category category;
    String slug;
    int count;
    DateTime createdAt;

    SearchOverviewModel({
        required this.title,
        required this.excerpt,
        required this.headerImg,
        required this.category,
        required this.slug,
        required this.count,
        required this.createdAt,
    });

    factory SearchOverviewModel.fromJson(Map<String, dynamic> json) => SearchOverviewModel(
        title: json["title"],
        excerpt: json["excerpt"],
        headerImg: json["header_img"],
        category: categoryValues.map[json["category"]]!,
        slug: json["slug"],
        count: json["count"],
        createdAt: DateTime.parse(json["created_at"]),
    );
}

enum Category { JOB_NEWS, HR_INSIDER, CAREER_DEVELOPMENT, JOB_PREPARATION, TRAINING_AND_EDUCATION }

final categoryValues = EnumValues({
    "Career Development": Category.CAREER_DEVELOPMENT,
    "HR Insider": Category.HR_INSIDER,
    "Job News": Category.JOB_NEWS,
    "Job Preparation": Category.JOB_PREPARATION,
    "Training and Education": Category.TRAINING_AND_EDUCATION
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}


// SearchFailureModel welcomeFromJson(String str) => SearchFailureModel.fromJson(json.decode(str));

class SearchFailureModel {
    String detail;

    SearchFailureModel({
        required this.detail,
    });

    factory SearchFailureModel.fromJson(Map<String, dynamic> json) => SearchFailureModel(
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "detail": detail,
    };
}
