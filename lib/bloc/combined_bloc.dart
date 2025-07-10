import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../api/service.dart';
import '../model/combined_model.dart';

part 'combined_event.dart';
part 'combined_state.dart';

class CombinedBloc extends Bloc<CombinedEvent, CombinedState> {
  final ApiService apiService;

  CombinedBloc(this.apiService) : super(const CombinedInitial()) {
    on<FetchCombinedData>(_onFetch);
    on<SortCombinedData>(_onSort);
  }

  Future<void> _onFetch(
    FetchCombinedData event,
    Emitter<CombinedState> emit,
  ) async {
    emit(const CombinedLoading());
    try {
      final contracts = await apiService.fetchContracts();
      final insurances = await apiService.fetchInsurances();

      final List<CombinedItem> combined = [
        ...contracts.map((c) => CombinedContract(c)),
        ...insurances.map((i) => CombinedInsurance(i)),
      ];

      combined.sort((a, b) => a.sortDate.compareTo(b.sortDate));

      emit(CombinedLoaded(combined, ascending: true));
    } catch (e) {
      emit(CombinedError(e.toString()));
    }
  }

  void _onSort(
    SortCombinedData event,
    Emitter<CombinedState> emit,
  ) {
    if (state is CombinedLoaded) {
      final current = state as CombinedLoaded;
      final sorted = [...current.items];
      sorted.sort((a, b) => event.ascending
          ? a.sortDate.compareTo(b.sortDate)
          : b.sortDate.compareTo(a.sortDate));
      emit(CombinedLoaded(sorted, ascending: event.ascending));
    }
  }
}
