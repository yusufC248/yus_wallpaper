class Data {
  final int? total;
  final int? totalPages;
  final List<Results>? results;

  Data({
    this.total,
    this.totalPages,
    this.results,
  });

  Data.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        totalPages = json['total_pages'] as int?,
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'total' : total,
    'total_pages' : totalPages,
    'results' : results?.map((e) => e.toJson()).toList()
  };
}

class Results {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final Links? links;
  final List<dynamic>? categories;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final dynamic sponsorship;
  final TopicSubmissions? topicSubmissions;
  final User? user;
  final List<TagsPreview>? tagsPreview;

  Results({
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
    this.tagsPreview,
  });

  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        promotedAt = json['promoted_at'] as String?,
        width = json['width'] as int?,
        height = json['height'] as int?,
        color = json['color'] as String?,
        blurHash = json['blur_hash'] as String?,
        description = json['description'] as String?,
        altDescription = json['alt_description'] as String?,
        urls = (json['urls'] as Map<String,dynamic>?) != null ? Urls.fromJson(json['urls'] as Map<String,dynamic>) : null,
        links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
        categories = json['categories'] as List?,
        likes = json['likes'] as int?,
        likedByUser = json['liked_by_user'] as bool?,
        currentUserCollections = json['current_user_collections'] as List?,
        sponsorship = json['sponsorship'],
        topicSubmissions = (json['topic_submissions'] as Map<String,dynamic>?) != null ? TopicSubmissions.fromJson(json['topic_submissions'] as Map<String,dynamic>) : null,
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
        tagsPreview = (json['tags_preview'] as List?)?.map((dynamic e) => TagsPreview.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'promoted_at' : promotedAt,
    'width' : width,
    'height' : height,
    'color' : color,
    'blur_hash' : blurHash,
    'description' : description,
    'alt_description' : altDescription,
    'urls' : urls?.toJson(),
    'links' : links?.toJson(),
    'categories' : categories,
    'likes' : likes,
    'liked_by_user' : likedByUser,
    'current_user_collections' : currentUserCollections,
    'sponsorship' : sponsorship,
    'topic_submissions' : topicSubmissions?.toJson(),
    'user' : user?.toJson(),
    'tags_preview' : tagsPreview?.map((e) => e.toJson()).toList()
  };
}

class Urls {
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  Urls.fromJson(Map<String, dynamic> json)
      : raw = json['raw'] as String?,
        full = json['full'] as String?,
        regular = json['regular'] as String?,
        small = json['small'] as String?,
        thumb = json['thumb'] as String?,
        smallS3 = json['small_s3'] as String?;

  Map<String, dynamic> toJson() => {
    'raw' : raw,
    'full' : full,
    'regular' : regular,
    'small' : small,
    'thumb' : thumb,
    'small_s3' : smallS3
  };
}

class Links {
  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  Links({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  Links.fromJson(Map<String, dynamic> json)
      : self = json['self'] as String?,
        html = json['html'] as String?,
        download = json['download'] as String?,
        downloadLocation = json['download_location'] as String?;

  Map<String, dynamic> toJson() => {
    'self' : self,
    'html' : html,
    'download' : download,
    'download_location' : downloadLocation
  };
}

class TopicSubmissions {
  final Animals? animals;
  final Wallpapers? wallpapers;

  TopicSubmissions({
    this.animals,
    this.wallpapers,
  });

  TopicSubmissions.fromJson(Map<String, dynamic> json)
      : animals = (json['animals'] as Map<String,dynamic>?) != null ? Animals.fromJson(json['animals'] as Map<String,dynamic>) : null,
        wallpapers = (json['wallpapers'] as Map<String,dynamic>?) != null ? Wallpapers.fromJson(json['wallpapers'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'animals' : animals?.toJson(),
    'wallpapers' : wallpapers?.toJson()
  };
}

class Animals {
  final String? status;
  final String? approvedOn;

  Animals({
    this.status,
    this.approvedOn,
  });

  Animals.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        approvedOn = json['approved_on'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'approved_on' : approvedOn
  };
}

class Wallpapers {
  final String? status;
  final String? approvedOn;

  Wallpapers({
    this.status,
    this.approvedOn,
  });

  Wallpapers.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        approvedOn = json['approved_on'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'approved_on' : approvedOn
  };
}

class User {
  final String? id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final dynamic lastName;
  final dynamic twitterUsername;
  final dynamic portfolioUrl;
  final dynamic bio;
  final dynamic location;
  final Links? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final Social? social;

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

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        updatedAt = json['updated_at'] as String?,
        username = json['username'] as String?,
        name = json['name'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'],
        twitterUsername = json['twitter_username'],
        portfolioUrl = json['portfolio_url'],
        bio = json['bio'],
        location = json['location'],
        links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
        profileImage = (json['profile_image'] as Map<String,dynamic>?) != null ? ProfileImage.fromJson(json['profile_image'] as Map<String,dynamic>) : null,
        instagramUsername = json['instagram_username'] as String?,
        totalCollections = json['total_collections'] as int?,
        totalLikes = json['total_likes'] as int?,
        totalPhotos = json['total_photos'] as int?,
        acceptedTos = json['accepted_tos'] as bool?,
        forHire = json['for_hire'] as bool?,
        social = (json['social'] as Map<String,dynamic>?) != null ? Social.fromJson(json['social'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'updated_at' : updatedAt,
    'username' : username,
    'name' : name,
    'first_name' : firstName,
    'last_name' : lastName,
    'twitter_username' : twitterUsername,
    'portfolio_url' : portfolioUrl,
    'bio' : bio,
    'location' : location,
    'links' : links?.toJson(),
    'profile_image' : profileImage?.toJson(),
    'instagram_username' : instagramUsername,
    'total_collections' : totalCollections,
    'total_likes' : totalLikes,
    'total_photos' : totalPhotos,
    'accepted_tos' : acceptedTos,
    'for_hire' : forHire,
    'social' : social?.toJson()
  };
}



class ProfileImage {
  final String? small;
  final String? medium;
  final String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  ProfileImage.fromJson(Map<String, dynamic> json)
      : small = json['small'] as String?,
        medium = json['medium'] as String?,
        large = json['large'] as String?;

  Map<String, dynamic> toJson() => {
    'small' : small,
    'medium' : medium,
    'large' : large
  };
}

class Social {
  final String? instagramUsername;
  final dynamic portfolioUrl;
  final dynamic twitterUsername;
  final dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  Social.fromJson(Map<String, dynamic> json)
      : instagramUsername = json['instagram_username'] as String?,
        portfolioUrl = json['portfolio_url'],
        twitterUsername = json['twitter_username'],
        paypalEmail = json['paypal_email'];

  Map<String, dynamic> toJson() => {
    'instagram_username' : instagramUsername,
    'portfolio_url' : portfolioUrl,
    'twitter_username' : twitterUsername,
    'paypal_email' : paypalEmail
  };
}

class TagsPreview {
  final String? type;
  final String? title;
  final Source? source;

  TagsPreview({
    this.type,
    this.title,
    this.source,
  });

  TagsPreview.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        title = json['title'] as String?,
        source = (json['source'] as Map<String,dynamic>?) != null ? Source.fromJson(json['source'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'title' : title,
    'source' : source?.toJson()
  };
}

class Source {
  final Ancestry? ancestry;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? metaTitle;
  final String? metaDescription;
  final CoverPhoto? coverPhoto;

  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  Source.fromJson(Map<String, dynamic> json)
      : ancestry = (json['ancestry'] as Map<String,dynamic>?) != null ? Ancestry.fromJson(json['ancestry'] as Map<String,dynamic>) : null,
        title = json['title'] as String?,
        subtitle = json['subtitle'] as String?,
        description = json['description'] as String?,
        metaTitle = json['meta_title'] as String?,
        metaDescription = json['meta_description'] as String?,
        coverPhoto = (json['cover_photo'] as Map<String,dynamic>?) != null ? CoverPhoto.fromJson(json['cover_photo'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'ancestry' : ancestry?.toJson(),
    'title' : title,
    'subtitle' : subtitle,
    'description' : description,
    'meta_title' : metaTitle,
    'meta_description' : metaDescription,
    'cover_photo' : coverPhoto?.toJson()
  };
}

class Ancestry {
  final Type? type;
  final Category? category;
  final Subcategory? subcategory;

  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  Ancestry.fromJson(Map<String, dynamic> json)
      : type = (json['type'] as Map<String,dynamic>?) != null ? Type.fromJson(json['type'] as Map<String,dynamic>) : null,
        category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null,
        subcategory = (json['subcategory'] as Map<String,dynamic>?) != null ? Subcategory.fromJson(json['subcategory'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'type' : type?.toJson(),
    'category' : category?.toJson(),
    'subcategory' : subcategory?.toJson()
  };
}

class Type {
  final String? slug;
  final String? prettySlug;

  Type({
    this.slug,
    this.prettySlug,
  });

  Type.fromJson(Map<String, dynamic> json)
      : slug = json['slug'] as String?,
        prettySlug = json['pretty_slug'] as String?;

  Map<String, dynamic> toJson() => {
    'slug' : slug,
    'pretty_slug' : prettySlug
  };
}

class Category {
  final String? slug;
  final String? prettySlug;

  Category({
    this.slug,
    this.prettySlug,
  });

  Category.fromJson(Map<String, dynamic> json)
      : slug = json['slug'] as String?,
        prettySlug = json['pretty_slug'] as String?;

  Map<String, dynamic> toJson() => {
    'slug' : slug,
    'pretty_slug' : prettySlug
  };
}

class Subcategory {
  final String? slug;
  final String? prettySlug;

  Subcategory({
    this.slug,
    this.prettySlug,
  });

  Subcategory.fromJson(Map<String, dynamic> json)
      : slug = json['slug'] as String?,
        prettySlug = json['pretty_slug'] as String?;

  Map<String, dynamic> toJson() => {
    'slug' : slug,
    'pretty_slug' : prettySlug
  };
}

class CoverPhoto {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final Links? links;
  final List<dynamic>? categories;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final dynamic sponsorship;
  final TopicSubmissions? topicSubmissions;
  final User? user;

  CoverPhoto({
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

  CoverPhoto.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        promotedAt = json['promoted_at'] as String?,
        width = json['width'] as int?,
        height = json['height'] as int?,
        color = json['color'] as String?,
        blurHash = json['blur_hash'] as String?,
        description = json['description'] as String?,
        altDescription = json['alt_description'] as String?,
        urls = (json['urls'] as Map<String,dynamic>?) != null ? Urls.fromJson(json['urls'] as Map<String,dynamic>) : null,
        links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
        categories = json['categories'] as List?,
        likes = json['likes'] as int?,
        likedByUser = json['liked_by_user'] as bool?,
        currentUserCollections = json['current_user_collections'] as List?,
        sponsorship = json['sponsorship'],
        topicSubmissions = (json['topic_submissions'] as Map<String,dynamic>?) != null ? TopicSubmissions.fromJson(json['topic_submissions'] as Map<String,dynamic>) : null,
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'promoted_at' : promotedAt,
    'width' : width,
    'height' : height,
    'color' : color,
    'blur_hash' : blurHash,
    'description' : description,
    'alt_description' : altDescription,
    'urls' : urls?.toJson(),
    'links' : links?.toJson(),
    'categories' : categories,
    'likes' : likes,
    'liked_by_user' : likedByUser,
    'current_user_collections' : currentUserCollections,
    'sponsorship' : sponsorship,
    'topic_submissions' : topicSubmissions?.toJson(),
    'user' : user?.toJson()
  };
}


