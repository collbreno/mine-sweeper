class AsyncData<T> {
  final T data;
  final ProgressState _state;

  AsyncData._internal(
    this._state,
    this.data,
  );

  bool get hasError => _state == ProgressState.hasError;
  bool get isWaiting => _state == ProgressState.isWaiting;
  bool get hasData => _state == ProgressState.done && data != null;

  AsyncData.nothing() : this._internal(ProgressState.none, null);

  AsyncData.withError() : this._internal(ProgressState.hasError, null);

  AsyncData.withData(T data) : this._internal(ProgressState.done, data);

  AsyncData.waiting() : this._internal(ProgressState.isWaiting, null);
}

enum ProgressState {
  none,
  hasError,
  isWaiting,
  done,
}
