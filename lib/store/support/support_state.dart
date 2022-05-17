import 'package:news_paper/domain/entity/support_data.dart';

class SupportState {
  final List<SupportData> supportList;

  factory SupportState.initial() {
    return SupportState(supportList: <SupportData>[]);
  }

  SupportState({
    required this.supportList
  });

  SupportState copyWith({List<SupportData>? supportList}) {
    return SupportState(
      supportList: supportList ?? this.supportList,
    );
  }
}
