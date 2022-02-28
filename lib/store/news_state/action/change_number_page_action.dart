import 'package:news_paper/store/base_action.dart';

class ChangeNumberPageAction extends BaseAction {
  final int page;

  ChangeNumberPageAction({
    required this.page,
  }) : super(type: 'ChangeNumberPageAction');
}
