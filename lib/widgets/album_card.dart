import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastfm_amin/models/album_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModel albumModel;

  // ignore: use_key_in_widget_constructors
  const AlbumCard({
    required this.albumModel,
  });

  Future<void> launchAlbum(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      log("could not launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25.r)),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: EdgeInsets.all(10.w),
          tilePadding: EdgeInsets.only(right: 10.w, top: 0),
          collapsedIconColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl: albumModel.imageUrl.toString(),
                    width: 120.w,
                    height: 120.w,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => SizedBox(
                      width: 120.w,
                      height: 120.w,
                      child: const Icon(Icons.error),
                    ),
                  )),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 200.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      albumModel.name!,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      albumModel.artist.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Stremable : ${albumModel.streamable == "0" ? "NO" : "YES"}",
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).splashColor),
                    onPressed: () async {
                      await launchAlbum(albumModel.url.toString());
                    },
                    child: const Text("Open Album"))
              ],
            )
          ],
        ));
  }
}
