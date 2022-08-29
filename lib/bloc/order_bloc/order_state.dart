import 'package:equatable/equatable.dart';

class POSOrderState extends Equatable {
  final String id;
  final bool networkListening;
  final bool isConnectingToNetwork;

  const POSOrderState(
      {required this.networkListening,
      required this.isConnectingToNetwork,
      required this.id});

  POSOrderState copyWith(
      {String? id, bool? networkListening, bool? isConnectingToNetwork}) {
    return POSOrderState(
        id: id ?? this.id,
        isConnectingToNetwork:
            isConnectingToNetwork ?? this.isConnectingToNetwork,
        networkListening: networkListening ?? this.networkListening);
  }

  factory POSOrderState.initial() {
    return const POSOrderState(
        id: '', networkListening: false, isConnectingToNetwork: false);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, isConnectingToNetwork, networkListening];
}
