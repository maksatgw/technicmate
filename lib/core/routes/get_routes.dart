import 'package:get/get.dart';
import 'package:technicmate/features/feed/view/feed_view.dart';
import 'package:technicmate/features/search/view/search_view.dart';

abstract class Routes {
  static const FEED = '/';
  static const SEARCH = '/SEARCH';
  static const PAGE2 = '/page2';
  static const PAGE3 = '/page3';
  static const PAGE4 = '/page4';
  static const PAGE5 = '/page5';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.FEED, page: () => FeedView()),
    GetPage(name: Routes.SEARCH, page: () => const SearchView()),
  ];
}