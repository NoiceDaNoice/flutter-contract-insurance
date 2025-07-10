part of 'combined_bloc.dart';

sealed class CombinedEvent extends Equatable {
  const CombinedEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCombinedData extends CombinedEvent {
  const FetchCombinedData();
}

final class SortCombinedData extends CombinedEvent {
  final bool ascending;

  const SortCombinedData(this.ascending);

  @override
  List<Object?> get props => [ascending];
}
