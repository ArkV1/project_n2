// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:project_n2/core/models/app_settings.dart';

import 'package:project_n2/features/wallet/models/wallet.dart';
import 'package:project_n2/core/models/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletWidgetBuilder extends ConsumerStatefulWidget {
  final AppWidget appWidget;

  const WalletWidgetBuilder({
    Key? key,
    required this.appWidget,
  }) : super(key: key);

  @override
  ConsumerState<WalletWidgetBuilder> createState() => _WalletWidgetBuilderState();
}

class _WalletWidgetBuilderState extends ConsumerState<WalletWidgetBuilder> {
  Widget _buildTotalWidget(Wallet wallet, AppWidget appWidget) {
    final total = ref.watch(totalOfWalletByIdProvider(walletId: wallet.id!));
    final isEditing = ref.watch(screenEditingProvider);
    return Container(
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey),
      //   ),
      // ),
      child: Card(
        key: ValueKey('${appWidget.containedObjectId}totalWidget'),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 48, vertical: 0),
          // subtitle: Text("${isEditing ? 'Wallet:' : ''} ${wallet.name}'s total:"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${isEditing ? 'Wallet:' : ''} ${wallet.name}'s total: "),
              total.when(data: (total) {
                return Text(
                  total != null ? total.toStringAsFixed(2) : 'Calculations failed',
                  textAlign: TextAlign.center,
                );
              }, error: (error, stacktrace) {
                debugPrint(stacktrace.toString());
                return Text(error.toString());
                //
              }, loading: () {
                return CircularProgressIndicator();
              }),
            ],
          ),
          // trailing: Text('${isEditing ? 'Wallet:' : ''} ${wallet.name}'),
          visualDensity: VisualDensity.compact,
          // dense: true,
        ),
      ),
    );
    //
  }

  Widget _buildLastTransactionWidget(Wallet wallet, AppWidget appWidget) {
    final isEditing = ref.watch(screenEditingProvider);
    return Card(
      key: ValueKey('${appWidget.containedObjectId}lastTransactionsWidget'),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 28.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest transactions:',
                  ),
                  Text('${isEditing ? 'Wallet:' : ''} ${wallet.name}'),
                ],
              ),
            ),
            for (var currentTransaction in wallet.transactions!.reversed.take(5))
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                leading: Text(
                  currentTransaction.date != null
                      ? DateFormat.Md().add_Hm().format(currentTransaction.date!)
                      : 'Unknown',
                ),
                // subtitle: Text(currentTransaction.category ?? 'No category'),
                title: Text(currentTransaction.name ?? 'Undefined name'),
                trailing: Text(
                  currentTransaction.amount?.toString() ?? '0',
                ),
                visualDensity: VisualDensity.compact,
                dense: true,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailySpendingsWidget(Wallet wallet, AppWidget appWidget) {
    final isEditing = ref.watch(screenEditingProvider);
    return Card(
      key: ValueKey('${appWidget.id}dailySpendingWidget'),
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
                  Text('${isEditing ? 'Wallet:' : ''} ${wallet.name}'),
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
                      //tooltipBgColor: Colors.grey,
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
    // final walletWidget = widget.appWidget.;
    // if (walletWidget == null) {
    //   return Card(
    //     child: ListTile(
    //       title: const Text(
    //         'Widget data is missing!',
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   );
    // }

    final appWidget = widget.appWidget;
    final wallet = ref.watch(walletByIdProvider(walletId: appWidget.containedObjectId));
    if (wallet == null) return const Text('Wallet was not found');
    switch (appWidget.widgetType) {
      case WalletWidgetType.total:
        return _buildTotalWidget(wallet, appWidget);
      case WalletWidgetType.lastTransaction:
        return _buildLastTransactionWidget(wallet, appWidget);
      case WalletWidgetType.dailySpendings:
        return _buildDailySpendingsWidget(wallet, appWidget);
      default:
        return Text('Unknown wallet widget of type: ${appWidget.widgetType}');
    }
  }
}
