import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class MediaResponse {
  const MediaResponse({
    this.resultcount,
    this.results,
  });

  factory MediaResponse.fromJson(Map<String, dynamic> json) {
    final List<Media>? results = json['results'] is List ? <Media>[] : null;
    if (results != null) {
      for (final dynamic item in json['results']!) {
        if (item != null) {
          results.add(Media.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return MediaResponse(
      resultcount: asT<int?>(json['resultCount']),
      results: results,
    );
  }

  final int? resultcount;
  final List<Media>? results;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resultCount': resultcount,
    'results': results,
  };
}

class Media {
  const Media({
    this.wrappertype,
    this.kind,
    this.artistid,
    this.collectionid,
    this.trackid,
    this.artistname,
    this.collectionname,
    this.trackname,
    this.collectioncensoredname,
    this.trackcensoredname,
    this.artistviewurl,
    this.collectionviewurl,
    this.trackviewurl,
    this.previewurl,
    this.artworkurl30,
    this.artworkurl60,
    this.artworkurl100,
    this.collectionprice,
    this.trackprice,
    this.releasedate,
    this.collectionexplicitness,
    this.trackexplicitness,
    this.disccount,
    this.discnumber,
    this.trackcount,
    this.tracknumber,
    this.tracktimemillis,
    this.country,
    this.currency,
    this.primarygenrename,
    this.isstreamable,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    wrappertype: asT<String?>(json['wrapperType']),
    kind: asT<String?>(json['kind']),
    artistid: asT<int?>(json['artistId']),
    collectionid: asT<int?>(json['collectionId']),
    trackid: asT<int?>(json['trackId']),
    artistname: asT<String?>(json['artistName']),
    collectionname: asT<String?>(json['collectionName']),
    trackname: asT<String?>(json['trackName']),
    collectioncensoredname: asT<String?>(json['collectionCensoredName']),
    trackcensoredname: asT<String?>(json['trackCensoredName']),
    artistviewurl: asT<String?>(json['artistViewUrl']),
    collectionviewurl: asT<String?>(json['collectionViewUrl']),
    trackviewurl: asT<String?>(json['trackViewUrl']),
    previewurl: asT<String?>(json['previewUrl']),
    artworkurl30: asT<String?>(json['artworkUrl30']),
    artworkurl60: asT<String?>(json['artworkUrl60']),
    artworkurl100: asT<String?>(json['artworkUrl100']),
    collectionprice: asT<double?>(json['collectionPrice']),
    trackprice: asT<double?>(json['trackPrice']),
    releasedate: asT<String?>(json['releaseDate']),
    collectionexplicitness: asT<String?>(json['collectionExplicitness']),
    trackexplicitness: asT<String?>(json['trackExplicitness']),
    disccount: asT<int?>(json['discCount']),
    discnumber: asT<int?>(json['discNumber']),
    trackcount: asT<int?>(json['trackCount']),
    tracknumber: asT<int?>(json['trackNumber']),
    tracktimemillis: asT<int?>(json['trackTimeMillis']),
    country: asT<String?>(json['country']),
    currency: asT<String?>(json['currency']),
    primarygenrename: asT<String?>(json['primaryGenreName']),
    isstreamable: asT<bool?>(json['isStreamable']),
  );

  final String? wrappertype;
  final String? kind;
  final int? artistid;
  final int? collectionid;
  final int? trackid;
  final String? artistname;
  final String? collectionname;
  final String? trackname;
  final String? collectioncensoredname;
  final String? trackcensoredname;
  final String? artistviewurl;
  final String? collectionviewurl;
  final String? trackviewurl;
  final String? previewurl;
  final String? artworkurl30;
  final String? artworkurl60;
  final String? artworkurl100;
  final double? collectionprice;
  final double? trackprice;
  final String? releasedate;
  final String? collectionexplicitness;
  final String? trackexplicitness;
  final int? disccount;
  final int? discnumber;
  final int? trackcount;
  final int? tracknumber;
  final int? tracktimemillis;
  final String? country;
  final String? currency;
  final String? primarygenrename;
  final bool? isstreamable;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'wrapperType': wrappertype,
    'kind': kind,
    'artistId': artistid,
    'collectionId': collectionid,
    'trackId': trackid,
    'artistName': artistname,
    'collectionName': collectionname,
    'trackName': trackname,
    'collectionCensoredName': collectioncensoredname,
    'trackCensoredName': trackcensoredname,
    'artistViewUrl': artistviewurl,
    'collectionViewUrl': collectionviewurl,
    'trackViewUrl': trackviewurl,
    'previewUrl': previewurl,
    'artworkUrl30': artworkurl30,
    'artworkUrl60': artworkurl60,
    'artworkUrl100': artworkurl100,
    'collectionPrice': collectionprice,
    'trackPrice': trackprice,
    'releaseDate': releasedate,
    'collectionExplicitness': collectionexplicitness,
    'trackExplicitness': trackexplicitness,
    'discCount': disccount,
    'discNumber': discnumber,
    'trackCount': trackcount,
    'trackNumber': tracknumber,
    'trackTimeMillis': tracktimemillis,
    'country': country,
    'currency': currency,
    'primaryGenreName': primarygenrename,
    'isStreamable': isstreamable,
  };
}
