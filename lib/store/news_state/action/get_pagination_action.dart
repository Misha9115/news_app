import 'package:news_paper/store/base_action.dart';

class GetPaginationAction extends BaseAction {
  final int pageSize;

  GetPaginationAction({
    required this.pageSize,
  }) : super(type: 'GetPaginationAction');
}
