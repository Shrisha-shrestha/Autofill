
class APIResponseModel {
    int id;
    String category;
    List<String> tags;
    int count;
    String slug;
    dynamic scheduledFor;
    DateTime createdAt;
    dynamic deadline;
    String title;
    String body;
    String headerImg;
    String excerpt;
    String status;
    int metaTag;

    APIResponseModel({
        required this.id,
        required this.category,
        required this.tags,
        required this.count,
        required this.slug,
        this.scheduledFor,
        required this.createdAt,
        this.deadline,
        required this.title,
        required this.body,
        required this.headerImg,
        required this.excerpt,
        required this.status,
        required this.metaTag,
    });

    factory APIResponseModel.fromJson(Map<String, dynamic> json) => APIResponseModel(
        id: json["id"],
        category: json["category"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        count: json["count"],
        slug: json["slug"],
        scheduledFor: json["scheduled_for"],
        createdAt: DateTime.parse(json["created_at"]),
        deadline: json["deadline"],
        title: json["title"],
        body: json["body"],
        headerImg: json["header_img"],
        excerpt: json["excerpt"],
        status: json["status"],
        metaTag: json["meta_tag"],
    );

}