import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final String contractNumber;
  final String status;
  final String dueDate;
  final String createdDate;
  final Amount? dueAmount;
  final ContractInfo? contractInfo;

  const Contract({
    required this.contractNumber,
    required this.status,
    required this.dueDate,
    required this.createdDate,
    this.dueAmount,
    this.contractInfo,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        contractNumber: json['contractNumber'],
        status: json['status'],
        dueDate: json['dueDate'],
        createdDate: json['createdDate'],
        dueAmount: json['dueAmount'] != null
            ? Amount.fromJson(json['dueAmount'])
            : null,
        contractInfo: json['contractInfo'] != null
            ? ContractInfo.fromJson(json['contractInfo'])
            : null,
      );

  @override
  List<Object?> get props => [contractNumber, status, dueDate];
}

class Amount {
  final String amount;
  final String currency;

  Amount({required this.amount, required this.currency});

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        amount: json['amount'],
        currency: json['currency'],
      );
}

class ContractInfo {
  final String tenor;
  final Amount creditAmount;
  final Amount installmentAmount;

  ContractInfo({
    required this.tenor,
    required this.creditAmount,
    required this.installmentAmount,
  });

  factory ContractInfo.fromJson(Map<String, dynamic> json) => ContractInfo(
        tenor: json['tenor'],
        creditAmount: Amount.fromJson(json['creditAmount']),
        installmentAmount: Amount.fromJson(json['installmentAmount']),
      );
}
