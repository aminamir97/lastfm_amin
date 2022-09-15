import 'package:flutter/material.dart';
import 'package:lastfm_amin/controllers/search_controller.dart';
import 'package:lastfm_amin/widgets/album_card.dart';
import 'package:lastfm_amin/widgets/empty_search.dart';
import 'package:lastfm_amin/widgets/paging_button.dart';
import 'package:lastfm_amin/widgets/search_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchController>(context, listen: false)
          .controllerStarter(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(child:
          Consumer<SearchController>(builder: (context, controller, child) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(6, 160, 181, 0.84),
                      Color.fromRGBO(16, 43, 45, 0.84),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100.r))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/fmlogo.png",
                        height: 90.h,
                        width: 90.w,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        "Last.Fm",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                  SearchField(
                    node: controller.searchNode,
                    isSearching: controller.isSearching,
                    hint: "Search Albums",
                    fieldController: controller.searchController,
                    submitFx: (txt) {
                      if (txt!.isNotEmpty) {
                        controller.setLatestSearch(txt);
                        controller.searchAlbumController();
                      }
                    },
                    resetFx: () => controller.resetSearch(),
                    changeFx: (txt) {
                      if (txt!.isEmpty) controller.resetSearch();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.loading && controller.page == 1
                  ? const Center(child: CircularProgressIndicator())
                  : controller.albums.isEmpty
                      ? const EmptySearch()
                      : ListView.builder(
                          itemCount: controller.albums.length + 1,
                          itemBuilder: (ctx, index) {
                            if (index == controller.albums.length) {
                              return PagingButton(
                                  isLoading: controller.loading,
                                  pageable: controller.isPageable());
                            }
                            return AlbumCard(
                              albumModel: controller.albums[index],
                            );
                          }),
            )
          ],
        );
      })),
    );
  }
}
