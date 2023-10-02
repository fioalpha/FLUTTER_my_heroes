class StatusResponse<T> {
  final int code;
  final String status;
  final DataResponse<List<T>> data;

  StatusResponse(this.code, this.status, this.data);

  static StatusResponse<HeroResponse> from(Map<String, dynamic> convert) {
    return StatusResponse<HeroResponse>(
        convert['code'],
        convert['status'],
        DataResponse.from(convert['data'])
    );
  }
}


class DataResponse<T> {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final T results;

  DataResponse(this.offset, this.limit, this.total, this.count, this.results);

  static DataResponse<List<HeroResponse>> from(Map<String, dynamic> convert) {
    return DataResponse(
        convert['offset'],
        convert['limit'],
        convert['total'],
        convert['count'],
        HeroResponse.from(convert['results'])
    );
  }
}


class HeroResponse {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;

  HeroResponse(this.id, this.name, this.description, this.thumbnail);

  static List<HeroResponse> from(List data) {
    return data.map((item) => HeroResponse.fromObject(item))
        .toList();
  }

  static HeroResponse fromObject(Map<String, dynamic> convert) {
    return HeroResponse(
        convert['id'],
        convert['name'],
        convert['description'],
        Thumbnail.from(convert['thumbnail'])
    );
  }
}

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail(this.path, this.extension);

   static Thumbnail from(Map<String, dynamic> convert) {
      return Thumbnail(convert['path'], convert['extension']);
  }
}