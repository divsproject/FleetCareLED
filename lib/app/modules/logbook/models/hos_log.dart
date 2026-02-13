import '../../../data/models/duty_status.dart';

class HosLog {
  final DutyStatus status;
  final DateTime startTime;
  DateTime? endTime;

  HosLog({
    required this.status,
    required this.startTime,
    this.endTime,
  });
}
