import 'package:equatable/equatable.dart';

class Insurance extends Equatable {
  final String orderId;
  final String status;
  final String amount;
  final String productCode;
  final String policyNumber;
  final String createdDate;

  const Insurance({
    required this.orderId,
    required this.status,
    required this.amount,
    required this.productCode,
    required this.policyNumber,
    required this.createdDate,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
        orderId: json['orderId'],
        status: json['status'],
        amount: json['amount'],
        productCode: json['productCode'],
        policyNumber: json['policyNumber'],
        createdDate: json['createdDate'],
      );

  @override
  List<Object?> get props => [orderId, status, policyNumber];
}
