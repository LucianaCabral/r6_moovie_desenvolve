import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_event.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_state.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../../domain/entities/series.dart';
import '../../../domain/usecase/series/get_popular_series_use_case.dart';
import '../../../domain/usecase/series/save_series_use_case.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  final SaveSeriesUseCase saveSeriesUseCase;

  SeriesBloc(this.getPopularSeriesUseCase, this.saveSeriesUseCase)
      : super(InitialSeriesState()) {
    on<LoadingSeriesSuccessEvent>((event, emit) async {
      try {
        emit(LoadingSeriesState());
        final List<Series> series = await getPopularSeriesUseCase.invoke();
        await saveSeriesUseCase.invoke(series);
        emit(LoadedSeriesSuccessState(series));
      } catch (e) {
        emit(const ErrorSeriesState(error: AppStrings.errorMessage));
      }
    });
  }
}
