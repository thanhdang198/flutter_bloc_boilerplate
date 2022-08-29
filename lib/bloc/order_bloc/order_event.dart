abstract class POSOrderEvent {
  const POSOrderEvent();
}

class CreateOrder extends POSOrderEvent {}

class StartListenerNetworkStatus extends POSOrderEvent {}
