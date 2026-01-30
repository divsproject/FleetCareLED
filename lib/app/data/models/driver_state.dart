import 'duty_status.dart';

class DriverState {
  final DutyStatus status;
  final String note;
  final DateTime lastUpdated;

  DriverState({
    required this.status,
    required this.note,
    required this.lastUpdated,
  });
}
