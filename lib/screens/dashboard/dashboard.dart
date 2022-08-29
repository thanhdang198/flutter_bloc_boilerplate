import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopage_pos/bloc/order_bloc/order_bloc.dart';
import 'package:gopage_pos/components/pos_appbar.dart';
import 'package:gopage_pos/style/style.dart';

import '../../bloc/order_bloc/order_event.dart';
import 'components/functions_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late POSOrderBloc _posOrderBloc;
  @override
  void initState() {
    _posOrderBloc = BlocProvider.of<POSOrderBloc>(context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              DashboardFunctionItem(
                title: 'Bán hàng tại quầy',
                onPressed: () {
                  _posOrderBloc.add(StartListenerNetworkStatus());
                },
                icon: const Icon(
                  Icons.sell,
                  color: white,
                ),
              ),
              DashboardFunctionItem(
                title: 'In đơn',
                onPressed: () {
                  _posOrderBloc.add(CreateOrder());
                },
                icon: const Icon(
                  Icons.note_add_sharp,
                  color: white,
                ),
              ),
              DashboardFunctionItem(
                title: 'Sản phẩm',
                onPressed: () {},
                icon: const Icon(
                  Icons.grid_on_outlined,
                  color: white,
                ),
              ),
              DashboardFunctionItem(
                title: 'Báo cáo',
                onPressed: () {},
                icon: const Icon(
                  Icons.analytics,
                  color: white,
                ),
              ),
              DashboardFunctionItem(
                title: 'Cài đặt',
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: white,
                ),
              ),
              DashboardFunctionItem(
                title: 'Đăng xuất',
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: white,
                ),
              ),
            ]),
      ),
    );
  }
}
