//Format String DateTime To dd/MM/YYYY hh:mm
import 'package:intl/intl.dart';

formatStringToDateTime({required String datetime}) {
  return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(datetime));
}

convertToLocalTime({required String utcDateTime}) {
  DateTime parsedDate = DateTime.parse(utcDateTime);
  DateTime localDate = parsedDate.toLocal();
  return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(localDate.toString()));
}
