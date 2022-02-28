import 'package:news_paper/store/base_action.dart';

class PaginationSearchNewsAction extends BaseAction {
  final int page;
  final String q;

  PaginationSearchNewsAction({
    required this.q,
    required this.page,
  }) : super(type: 'ChangePageAction');
}
