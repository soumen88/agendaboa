import 'package:agendaboa/state/CounterBloc.dart';
import 'package:agendaboa/state/PageNotifierBloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider.autoDispose<CounterBloc>((ref) {
  return CounterBloc();
});