import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          
            children: summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 8,
                    child: Text(((data['question_index'] as int) + 1).toString(), style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),)),
                   Expanded(
                     child: Column(
                      children: [
                        Text(data['question'] as String, textAlign: TextAlign.center,),
                        Text(data['correct_answer'].toString(), style: const TextStyle(color: Colors.white),),
                        Text(data['user_answer'].toString()),
                      ],
                     ),
                   ),
                ],
              );
            }).toList(),
        ),
      ),
    );
  }
}
