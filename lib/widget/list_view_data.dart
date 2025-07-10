import 'package:flutter/material.dart';
import 'package:flutter_insurance_contract/widget/custom_contract_container.dart';
import 'package:flutter_insurance_contract/widget/custom_insurance_container.dart';
import '../model/combined_model.dart';

class ListViewData extends StatelessWidget {
  const ListViewData({
    super.key,
    required this.items,
  });

  final List<CombinedItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length+1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const SizedBox(height: 80); 
          }
          final item = items[index];
          if (item is CombinedContract) {
            return CustomContractContainer(
              contract: item.contract,
            );
          } else if (item is CombinedInsurance) {
            return CustomInsuranceContainer(
              insurance: item.insurance,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
