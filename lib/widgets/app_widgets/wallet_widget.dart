// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletWidgetBuilder extends ConsumerStatefulWidget {
  final AppWidget appWidget;

  const WalletWidgetBuilder({
    Key? key,
    required this.appWidget,
  }) : super(key: key);

  @override
  ConsumerState<WalletWidgetBuilder> createState() =>
      _WalletWidgetBuilderState();
}

class _WalletWidgetBuilderState extends ConsumerState<WalletWidgetBuilder> {
  Widget _buildTotalWidget(Wallet wallet, WalletWidget walletWidget) {
    final total = ref.watch(totalOfWalletByIdProvider(walletId: wallet.id!));
    return Container(
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey),
      //   ),
      // ),
      child: Card(
        key: ValueKey('${walletWidget.id}totalWidget'),
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

                title: total.when(data: (total) {
                  return Text(
                    total.toString(),
                    textAlign: TextAlign.center,
                  );
                }, error: (error, stacktrace) {
                  debugPrint(stacktrace.toString());
                  return Text(error.toString());
                  //
                }, loading: () {
                  return CircularProgressIndicator();
                }),
                visualDensity: VisualDensity.comfortable,
                // dense: true,
              ),
            ],
          ),
        ),
      ),
    );
    //
  }

  Widget _buildLastTransactionWidget(Wallet wallet, WalletWidget walletWidget) {
    return Card(
      key: ValueKey('${walletWidget.id}lastTransactionsWidget'),
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
                  Text('Wallet: ${wallet.name}'),
                ],
              ),
            ),
            for (var currentTransaction
                in wallet.transactions!.reversed.take(5))
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

  Widget _buildDailySpendingsWidget(Wallet wallet, WalletWidget walletWidget) {
    return Card(
      key: ValueKey('${walletWidget.id}dailySpendingWidget'),
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
                  Text('Wallet: ${wallet.name}'),
                ],
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.only(
                left: 12,
              ),
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
                        reservedSize: 32,
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
                    leftTitles: AxisTitles(
                      drawBelowEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 16,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
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
                      fitInsideVertically: true,
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  gridData: const FlGridData(
                    show: true,
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
    // if (widget.appWidget.walletWidget == null) return Text('');
    final walletWidget = widget.appWidget.walletWidget;
    final wallet =
        ref.watch(walletByIdProvider(walletId: walletWidget.walletId));
    return wallet.when(data: (wallet) {
      if (wallet == null) return const Text('Wallet was not found');
      switch (walletWidget.widgetType) {
        case WalletWidgetType.total:
          return _buildTotalWidget(wallet, walletWidget);
        case WalletWidgetType.lastTransaction:
          return _buildLastTransactionWidget(wallet, walletWidget);
        case WalletWidgetType.dailySpendings:
          return _buildDailySpendingsWidget(wallet, walletWidget);
        default:
          return Text(
              'Unknown wallet widget of type: ${walletWidget.widgetType}');
      }
    }, error: (error, stacktrace) {
      debugPrint(stacktrace.toString());
      return Text(error.toString());
    }, loading: () {
      return const CircularProgressIndicator();
    });
  }
}
