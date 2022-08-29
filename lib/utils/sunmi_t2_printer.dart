library sunmi_printer;

import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

import 'date_time_handle.dart';

class Printer {
  t2Printer() async {
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.startTransactionPrint(true);

    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER); // Center align

    await SunmiPrinter.printText('GoPage POS Shop',
        style: SunmiStyle(bold: true));
    await SunmiPrinter.resetBold();
    await SunmiPrinter.printText('Quang Trung, TP.Vinh, Nghệ An',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));
    await SunmiPrinter.printText('0238.999.9999',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.printText('----------------------------------------',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.printText('HOÁ ĐƠN BÁN HÀNG',
        style: SunmiStyle(bold: true, align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.resetBold();
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Số: HĐ09438', width: 20, align: SunmiPrintAlign.LEFT),
      ColumnMaker(text: 'Ngày: ${getDateTime()}', width: 100)
    ]);

    await SunmiPrinter.printText('────────────────────────────────────────',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Khách hàng: ', width: 20),
      ColumnMaker(text: 'Anh Lâm GoStream', width: 200)
    ]);

    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Địa chỉ: ', width: 20),
      ColumnMaker(text: 'Quang Trung, Vinh, Nghệ An', width: 200)
    ]);

    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Điện thoại: ', width: 20),
      ColumnMaker(text: '0999888999', width: 200)
    ]);

    await SunmiPrinter.printText('----------------------------------------',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'SL', width: 15, align: SunmiPrintAlign.LEFT),
      ColumnMaker(text: 'Đơn giá', width: 15),
      ColumnMaker(text: 'Thành tiền', width: 15)
    ]);
    await SunmiPrinter.printText('────────────────────────────────────────',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));
    await SunmiPrinter.printText('Heineiken');
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: '51', width: 15, align: SunmiPrintAlign.LEFT),
      ColumnMaker(text: '30.000', width: 15),
      ColumnMaker(text: '1.530.000', width: 15)
    ]);
    await SunmiPrinter.printText('﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));
    await SunmiPrinter.printText('Hoa quả');
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: '2', width: 15, align: SunmiPrintAlign.LEFT),
      ColumnMaker(text: '400.000', width: 15),
      ColumnMaker(text: '800.000', width: 15)
    ]);

    await SunmiPrinter.printText('────────────────────────────────────────',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Tổng tiền: ', width: 35),
      ColumnMaker(text: '4.630.000', width: 200)
    ]);
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Chiết khấu: ', width: 35),
      ColumnMaker(text: '463.000', width: 200)
    ]);
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Khách phải trả: ', width: 35),
      ColumnMaker(text: '4.167.000', width: 200)
    ]);
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Tiền khách đưa: ', width: 35),
      ColumnMaker(text: '4.167.000', width: 200)
    ]);
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(text: 'Trả lại: ', width: 35),
      ColumnMaker(text: '4.167.000', width: 200)
    ]);

    await SunmiPrinter.printText('---------------------------------------',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));

    await SunmiPrinter.printText('Cảm ơn quý khách. Hẹn gặp lại!',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER));
    await SunmiPrinter.printText('');
    await SunmiPrinter.printText('');
    await SunmiPrinter.submitTransactionPrint(); // SUBMIT
    await SunmiPrinter.cut(); //cut paper
    await SunmiPrinter.exitTransactionPrint(true); // Close the transaction
  }
}
