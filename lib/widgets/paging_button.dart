import 'package:flutter/material.dart';
import 'package:lastfm_amin/controllers/search_controller.dart';
import 'package:provider/provider.dart';

class PagingButton extends StatelessWidget {
  final bool isLoading;
  final bool pageable;
  // ignore: use_key_in_widget_constructors
  const PagingButton({this.isLoading = false, this.pageable = true});

  @override
  Widget build(BuildContext context) {
    if (!pageable) {
      return const SizedBox();
    }
    return Container(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : IconButton(
                onPressed: () {
                  Provider.of<SearchController>(context, listen: false)
                      .searchAlbumController();
                },
                icon: const Icon(
                  Icons.cached,
                  color: Colors.white,
                )));
  }
}
