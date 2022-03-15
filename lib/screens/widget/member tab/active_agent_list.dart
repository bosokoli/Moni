import 'package:flutter/material.dart';
import 'package:loanapp/data/service.dart';
import 'package:provider/provider.dart';

class ActiveAgentList extends StatelessWidget {
  const ActiveAgentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AppService>();
    return SizedBox(
      height: 50,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vm.moniloan!.data!.activeAgents!.length,
          itemBuilder: (context, index) {
            final user = vm.moniloan!.data!.activeAgents![index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${user.agent!.firstName ?? ""} '
                          '${user.agent!.middleName ?? ""} '
                          '${user.agent!.lastName ?? ""}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${user.agent!.recentLoan!.agentLoan!.daysPastDue ?? ""}',
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        '\u20A6${user.agent!.recentLoan!.loanAmount.toString()}',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.green),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        user.agent!.recentLoan!.agentLoan!.loanStatus!
                            .description
                            .toString(),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.green),
                      )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
