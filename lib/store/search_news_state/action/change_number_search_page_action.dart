import 'package:news_paper/store/base_action.dart';

class ChangeNumberSearchPageAction extends BaseAction {
  final int page;

  ChangeNumberSearchPageAction({
    required this.page,
  }) : super(type: 'ChangeNumberSearchPageAction');
}
