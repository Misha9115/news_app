import 'package:news_paper/store/base_action.dart';

class ChangePaginationLoader extends BaseAction {
  final bool paginationLoader;

  ChangePaginationLoader({
    required this.paginationLoader,
  }) : super(type: 'ChangePaginationLoader');
}
