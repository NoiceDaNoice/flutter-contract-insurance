part of 'combined_bloc.dart';

sealed class CombinedState extends Equatable {
  const CombinedState();

  @override
  List<Object?> get props => [];
}

final class CombinedInitial extends CombinedState {
  const CombinedInitial();
}

final class CombinedLoading extends CombinedState {
  const CombinedLoading();
}

final class CombinedLoaded extends CombinedState {
  final List<CombinedItem> items;
  final bool ascending;

  const CombinedLoaded(this.items, {this.ascending = true});

  @override
  List<Object?> get props => [items, ascending];
}

final class CombinedError extends CombinedState {
  final String message;

  const CombinedError(this.message);

  @override
  List<Object?> get props => [message];
}
