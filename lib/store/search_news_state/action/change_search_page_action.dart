import 'package:news_paper/store/base_action.dart';

class ChangeSearchPageAction extends BaseAction {
  final int page;
  final String request;

  ChangeSearchPageAction({
    required this.page,
    required this.request,
  }) : super(type: 'ChangeSearchPageAction');
}
