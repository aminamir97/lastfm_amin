class ApiUtils {
  String lastFmAuth = "431fe51ccb0e1f29364ec6cb1da2ad84";

  String get searchEndPoint =>
      "https://ws.audioscrobbler.com/2.0/?method=album.search&limit=50&api_key=$lastFmAuth&format=json&album=";

  static Map apiInternalResponse(bool success, String error, var data) {
    return {"success": success, "api_data": data, "error": error};
  }
}
