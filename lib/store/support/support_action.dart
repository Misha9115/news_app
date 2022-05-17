import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/store/base_action.dart';

class AddMassageAction extends BaseAction {
  final SupportData massage;

  AddMassageAction({
    required this.massage,
  }) : super(type: 'AddMassageAction');
}

