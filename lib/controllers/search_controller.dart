import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lastfm_amin/api/album_api.dart';
import 'package:lastfm_amin/models/album_model.dart';

class SearchController extends ChangeNotifier {
  bool loading = false;
  List<AlbumModel> albums = [];
  String errorMessage = "";
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  bool isSearching = false;
  bool morePaging = true;
  String latestSearch = "";
  int page = 1;
  late BuildContext btx;

  void controllerStarter(BuildContext ctx) {
    btx = ctx;
    notifyListeners();
  }

  void setLoading(bool state) {
    loading = state;
    notifyListeners();
  }

  void setSearching(bool state) {
    isSearching = state;
    notifyListeners();
  }

  //saving the last search content
  void setLatestSearch(String txt) {
    if (latestSearch == txt) {
      latestSearch = txt;
      notifyListeners();
    } else {
      searchChanged();
      latestSearch = txt;
      notifyListeners();
    }
  }

  //find the search result of entered input
  Future searchAlbumController() async {
    setLoading(true);
    setSearching(true);
    var apiResponse =
        await AlbumApi().searchAlbumsHandler(latestSearch, page: page);
    if (apiResponse["success"]) {
      albums += apiResponse["api_data"];
      if (apiResponse["api_data"].isEmpty ||
          apiResponse["api_data"].length != 50) morePaging = false;
      page++;
    } else {
      showErrorMessage(apiResponse["error"]);
    }
    setLoading(false);
  }

  //handling search resetting by clicking on the reset button
  void resetSearch() {
    log("resetting search");
    setSearching(false);
    albums = [];
    page = 1;
    morePaging = true;
    searchNode.unfocus();
    searchController.clear();

    notifyListeners();
  }

  //when user is on search mood but user changed the search content without using teh reset button
  void searchChanged() {
    log("changing search content");
    albums = [];
    page = 1;
    morePaging = true;
    searchNode.unfocus();
    notifyListeners();
  }

  //finding if there will be next pages of data from the api or not
  bool isPageable() {
    if (page <= 200 && morePaging == true) {
      return true;
    } else {
      return false;
    }
  }

  //error handler by showing snack message
  void showErrorMessage(String err) {
    var snackBar = SnackBar(
      content: Text("error: $err"),
    );
    ScaffoldMessenger.of(btx).showSnackBar(snackBar);
  }
}
