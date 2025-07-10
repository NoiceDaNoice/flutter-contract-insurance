import 'package:intl/intl.dart';
import 'contract_model.dart';
import 'insurance_model.dart';

abstract class CombinedItem {
  DateTime get sortDate;
}

class CombinedContract extends CombinedItem {
  final Contract contract;

  CombinedContract(this.contract);

  @override
  DateTime get sortDate => _convert(contract.dueDate);
}

class CombinedInsurance extends CombinedItem {
  final Insurance insurance;

  CombinedInsurance(this.insurance);

  @override
  DateTime get sortDate => _convert(insurance.createdDate);
}

DateTime _convert(String dateStr) {
  try {
    return DateFormat('d MMMM yyyy', 'en').parseLoose(dateStr);
  } catch (e) {
    return DateTime(1900); 
  }
}
