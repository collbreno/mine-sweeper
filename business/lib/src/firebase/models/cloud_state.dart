import 'package:business/business.dart';

class CloudState {
  final AsyncData<String> shareCode;
  final bool isRemote;

  CloudState({
    this.shareCode,
    this.isRemote,
  });

  CloudState copy({
    bool isRemote,
    AsyncData<String> shareCode,
  }) {
    return CloudState(
      shareCode: shareCode ?? this.shareCode,
      isRemote: isRemote ?? this.isRemote,
    );
  }

  static CloudState initialState() => CloudState(
        shareCode: AsyncData.nothing(),
        isRemote: false,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudState &&
          runtimeType == other.runtimeType &&
          shareCode == other.shareCode &&
          isRemote == other.isRemote;

  @override
  int get hashCode => shareCode.hashCode ^ isRemote.hashCode;
}
