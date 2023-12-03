import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletWidgetBuilder extends ConsumerStatefulWidget {
  final WalletWidget walletWidget;
  final Wallet wallet;

  const WalletWidgetBuilder({
    Key? key,
    required this.walletWidget,
    required this.wallet,
  }) : super(key: key);

  @override
  ConsumerState<WalletWidgetBuilder> createState() =>
      _WalletWidgetBuilderState();
}

class _WalletWidgetBuilderState extends ConsumerState<WalletWidgetBuilder> {
  Widget _buildTotalWidget() {
    final wallet = widget.wallet;
    ref.watch(walletsProvider);
    return Container(
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey),
      //   ),
      // ),
      child: Card(
        key: ValueKey('${widget.walletWidget.id}totalWidget'),
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                    ),
                    Text('Wallet: ${wallet.name}'),
                  ],
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 48,
                ),
                // title: Text(widget.wallet.name),
                title: FutureBuilder(
                    future: ref
                        .read(walletsProvider.notifier)
                        .calculateTotal(wallet),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                        '${snapshot.data ?? '0'}',
                        textAlign: TextAlign.center,
                      );
                    }),
                // trailing: FutureBuilder(
                //     future: ref
                //         .read(walletsProvider.notifier)
                //         .calculateTotal(wallet),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const CircularProgressIndicator();
                //       }
                //       return Text('${snapshot.data ?? '0'}');
                //     }),
                visualDensity: VisualDensity.comfortable,
                // dense: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastTransactionWidget() {
    return Card(
      key: ValueKey('${widget.walletWidget.id}lastTransactionsWidget'),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest transactions:',
                  ),
                  Text('Wallet: ${widget.wallet.name}'),
                ],
              ),
            ),
            for (var currentTransaction
                in widget.wallet.transactions.reversed.take(5))
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(
                  16,
                  0,
                  32,
                  0,
                ),
                leading: Text(
                  currentTransaction.transactionDate != null
                      ? DateFormat.Md()
                          .add_Hm()
                          .format(currentTransaction.transactionDate!)
                      : 'Unknown',
                ),
                title: Text(currentTransaction.name ?? 'Undefined name'),
                trailing: Text(
                  currentTransaction.amount ?? '0',
                ),
                visualDensity: VisualDensity.compact,
                dense: true,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailySpendingsWidget() {
    return Card(
      key: ValueKey('${widget.walletWidget.id}dailySpendingWidget'),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18.0,
                0,
                18.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weekly spendings',
                  ),
                  Text('Wallet: ${widget.wallet.name}'),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [BarChartRodData(toY: 2)],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 3)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 7)],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: 4)],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [BarChartRodData(toY: 6)],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [BarChartRodData(toY: 8)],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [BarChartRodData(toY: 6)],
                    ),
                    // Add more BarChartGroupData items for more bars
                  ],
                  // Define the behavior and appearance of the axis, grid, and titles here
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            // color: AppColors.contentColorBlue.darken(20),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Mon';
                              break;
                            case 1:
                              text = 'Tue';
                              break;
                            case 2:
                              text = 'Wed';
                              break;
                            case 3:
                              text = 'Thu';
                              break;
                            case 4:
                              text = 'Fri';
                              break;
                            case 5:
                              text = 'Sat';
                              break;
                            case 6:
                              text = 'Sun';
                              break;
                            default:
                              text = '';
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 4,
                            child: Text(text, style: style),
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.fromY.round().toString(),
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.walletWidget.widgetType) {
      case WalletWidgetType.total:
        return _buildTotalWidget();
      case WalletWidgetType.lastTransaction:
        return _buildLastTransactionWidget();
      case WalletWidgetType.dailySpendings:
        return _buildDailySpendingsWidget();
      default:
        return Text(
            'Unknown wallet widget of type: ${widget.walletWidget.containedObjectType}');
    }
  }
}
