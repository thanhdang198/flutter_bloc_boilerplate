import 'dart:async';
import 'package:gopage_pos/utils/sunmi_t2_printer.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gopage_pos/bloc/order_bloc/order_event.dart';
import 'package:gopage_pos/bloc/order_bloc/order_state.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

import '../../utils/date_time_handle.dart';

class POSOrderBloc extends Bloc<POSOrderEvent, POSOrderState> {
  POSOrderBloc(POSOrderState initialState) : super(initialState) {
    on<CreateOrder>(_onCreateOrder);
    on<StartListenerNetworkStatus>(_onStartListenerNetworkStatus);
  }
  _onStartListenerNetworkStatus(
      StartListenerNetworkStatus event, Emitter<POSOrderState> emit) async {
    _onListenNetworkStatusChange(emit);
    emit(state.copyWith(networkListening: true));
  }

  _onCreateOrder(CreateOrder event, Emitter<POSOrderState> emit) async {
    Printer().t2Printer();
  }

  _onListenNetworkStatusChange(Emitter<POSOrderState> emit) {
    if (state.networkListening) return;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      emit(state.copyWith(
          isConnectingToNetwork: result != ConnectivityResult.none));
    });
  }
}
