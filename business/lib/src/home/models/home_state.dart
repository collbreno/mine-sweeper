class HomeState {
  final bool isPlayButtonCollapsed;
  final bool isPromptDialogVisible;

  HomeState({
    this.isPlayButtonCollapsed,
    this.isPromptDialogVisible,
  });

  HomeState copy({
    bool isPlayButtonCollapsed,
    bool isPromptDialogVisible,
  }) =>
      HomeState(
        isPlayButtonCollapsed:
            isPlayButtonCollapsed ?? this.isPlayButtonCollapsed,
        isPromptDialogVisible:
            isPromptDialogVisible ?? this.isPromptDialogVisible,
      );

  static HomeState initialState() => HomeState(
        isPromptDialogVisible: false,
        isPlayButtonCollapsed: true,
      );


  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HomeState && runtimeType == other.runtimeType &&
          isPromptDialogVisible == other.isPromptDialogVisible &&
          isPlayButtonCollapsed == other.isPlayButtonCollapsed;

  @override
  int get hashCode => isPromptDialogVisible.hashCode ^
  isPlayButtonCollapsed.hashCode;
}
