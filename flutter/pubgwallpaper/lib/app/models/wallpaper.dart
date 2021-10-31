// To parse this JSON data, do
//
//     final wallPaper = wallPaperFromJson(jsonString);

import 'dart:convert';

List<WallPaper> wallPaperFromJson(String str) => List<WallPaper>.from(json.decode(str).map((x) => WallPaper.fromJson(x)));

String wallPaperToJson(List<WallPaper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WallPaper {
    WallPaper({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.urls,
        this.links,
        this.categories,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.user,
    });

    String id;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    String description;
    String altDescription;
    Urls urls;
    WallPaperLinks links;
    List<dynamic> categories;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    Sponsorship sponsorship;
    TopicSubmissions topicSubmissions;
    User user;

    factory WallPaper.fromJson(Map<String, dynamic> json) => WallPaper(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"] == null ? null : json["description"],
        altDescription: json["alt_description"] == null ? null : json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: WallPaperLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt == null ? null : promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description == null ? null : description,
        "alt_description": altDescription == null ? null : altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship == null ? null : sponsorship.toJson(),
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
    };
}

class WallPaperLinks {
    WallPaperLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    String self;
    String html;
    String download;
    String downloadLocation;

    factory WallPaperLinks.fromJson(Map<String, dynamic> json) => WallPaperLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Sponsorship {
    Sponsorship({
        this.impressionUrls,
        this.tagline,
        this.taglineUrl,
        this.sponsor,
    });

    List<String> impressionUrls;
    String tagline;
    String taglineUrl;
    User sponsor;

    factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: User.fromJson(json["sponsor"]),
    );

    Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor.toJson(),
    };
}

class User {
    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    String id;
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String lastName;
    String twitterUsername;
    String portfolioUrl;
    String bio;
    String location;
    UserLinks links;
    ProfileImage profileImage;
    String instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;
    bool forHire;
    Social social;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
        portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
        bio: json["bio"] == null ? null : json["bio"],
        location: json["location"] == null ? null : json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
        "bio": bio == null ? null : bio,
        "location": location == null ? null : location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
    };
}

class UserLinks {
    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    String self;
    String html;
    String photos;
    String likes;
    String portfolio;
    String following;
    String followers;

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    String small;
    String medium;
    String large;

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    String instagramUsername;
    String portfolioUrl;
    String twitterUsername;
    dynamic paypalEmail;

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
        twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class TopicSubmissions {
    TopicSubmissions({
        this.interiors,
        this.businessWork,
    });

    BusinessWork interiors;
    BusinessWork businessWork;

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
        interiors: json["interiors"] == null ? null : BusinessWork.fromJson(json["interiors"]),
        businessWork: json["business-work"] == null ? null : BusinessWork.fromJson(json["business-work"]),
    );

    Map<String, dynamic> toJson() => {
        "interiors": interiors == null ? null : interiors.toJson(),
        "business-work": businessWork == null ? null : businessWork.toJson(),
    };
}

class BusinessWork {
    BusinessWork({
        this.status,
        this.approvedOn,
    });

    String status;
    DateTime approvedOn;

    factory BusinessWork.fromJson(Map<String, dynamic> json) => BusinessWork(
        status: json["status"],
        approvedOn: DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn.toIso8601String(),
    };
}

class Urls {
    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
    });

    String raw;
    String full;
    String regular;
    String small;
    String thumb;

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
    };
}
