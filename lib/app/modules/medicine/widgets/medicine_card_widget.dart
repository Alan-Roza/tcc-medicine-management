import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicineCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String type;
  final int quantity;
  final String expirationDate;
  final double price;
  final String priority;
  Function? onTap;

  MedicineCardWidget({
    super.key,
    required this.name,
    required this.type,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.priority,
    this.imageUrl,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> priorityData = _getPriorityData(priority);

    return GestureDetector(
      onTap: () => {
        if (onTap != null) {
          onTap!() // TODO: pass the medicine id as parameter
        }
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 0,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            width: 55,
                          )
                        : Image.asset(
                            'assets/images/generic_medicine.png',
                            fit: BoxFit.cover,
                            width: 55,
                          ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Comprimido",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                            children: [
                              const TextSpan(
                                text: "Quantidade: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: "$quantity unidade",
                              ),
                              const TextSpan(
                                text: "\nVencimento: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: expirationDate,
                              ),
                              const TextSpan(
                                text: "\nÚltimo Preço: ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: "R\$${price.toStringAsFixed(2)}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: priorityData["background"],
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: priorityData["color"],
                    width: 1.0,
                  ),
                ),
                child: Text(
                  priorityData["text"],
                  style: TextStyle(color: priorityData["color"], fontSize: 8, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getPriorityData(String? priority) {
    switch (priority) {
      case 'high':
        return {
          'text': 'Importante',
          'background': Colors.red[100],
          'color': Colors.red[800],
        };
      case 'low':
        return {
          'text': 'Sem Prioridade',
          'background': Colors.green[100],
          'color': Colors.green[800],
        };
      case 'normal':
        return {
          'text': 'Normal',
          'background': Colors.blue[100],
          'color': Colors.blue[800],
        };
      default:
        return {
          'text': '',
          'background': Colors.transparent,
          'color': Colors.transparent,
        };
    }
  }
}
