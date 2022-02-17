import 'package:news_paper/store/base_action.dart';

class ChangePageAction extends BaseAction {
  final int page;

  ChangePageAction({
    required this.page,
  }) : super(type: 'ChangePageAction');
}
