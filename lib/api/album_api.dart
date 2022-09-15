import 'dart:convert';
import 'dart:developer';

import 'package:lastfm_amin/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'package:lastfm_amin/utils/api_utils.dart';

class AlbumApi {
  Future<Map> searchAlbumsHandler(String searchText, {int page = 1}) async {
    List<AlbumModel> dataList = [];
    try {
      log("${ApiUtils().searchEndPoint}${searchText.toLowerCase()}&page=$page");
      var preparedUrl = Uri.parse(
          "${ApiUtils().searchEndPoint}${searchText.toLowerCase()}&page=$page");
      http.Response response = await http.get(preparedUrl);
      if (response.statusCode != 200) throw "not successfull request";
      var json = jsonDecode(response.body);
      List data = json["results"]["albummatches"]["album"];
      for (var element in data) {
        dataList.add(AlbumModel.fromJson(element));
      }

      return ApiUtils.apiInternalResponse(true, "", dataList);
    } catch (e) {
      return ApiUtils.apiInternalResponse(false, e.toString(), []);
    }
  }
}
