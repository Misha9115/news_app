import 'package:news_paper/store/base_action.dart';

class GetSearchNewsAction extends BaseAction {
  final String searchRequest;
  final int pageSize;

  GetSearchNewsAction({
    required this.searchRequest,
    required this.pageSize,
  }) : super(type: 'GetSearchNewsAction');
}
