import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/store/support/support_action.dart';
import 'package:news_paper/store/support/support_state.dart';

SupportState supportReducer(SupportState state, dynamic action) {
  if (action is AddMassageAction) {
    return _saveNewsAction(state, action);
  }

  return state;
}

SupportState _saveNewsAction(SupportState state, AddMassageAction action) {
  List<SupportData> add = [];
  add = state.supportList;
  add.add(action.massage);



  return state.copyWith(supportList: add);
}
