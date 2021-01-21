import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on String {
  String get formated {
    initializeDateFormatting('pt_BR', null);

    return DateFormat.yMd('pt_BR').add_Hm().format(DateTime.parse(this));
  }
}