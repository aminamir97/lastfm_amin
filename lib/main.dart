import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastfm_amin/controllers/search_controller.dart';
import 'package:lastfm_amin/screens/search_screen.dart';
import 'package:lastfm_amin/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(433, 922),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => SearchController()),
              ],
              child: MaterialApp(
                  title: 'Last Fm',
                  theme: CustomeStyles.lightTheme,
                  home: const SearchScreen()));
        });
  }
}
