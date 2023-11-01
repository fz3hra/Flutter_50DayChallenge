import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:gap/gap.dart';

class StatisticsWidget extends StatefulWidget {
  final Color leftBarColor = Colors.blue;
  final Color rightBarColor = Color.fromARGB(255, 28, 180, 211);
  final Color avgColor = Color.fromARGB(255, 28, 180, 211);
  StatisticsWidget({super.key});

  @override
  State<StatisticsWidget> createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  final double width = 30;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 35, 15);
    final barGroup2 = makeGroupData(1, 45, 25);
    final barGroup3 = makeGroupData(2, 20, 8);
    final barGroup4 = makeGroupData(3, 33, 27);
    final barGroup5 = makeGroupData(4, 48, 33);
    final barGroup6 = makeGroupData(5, 43, 27);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
    ];
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Statistics',
                  style: const TextStyle().inter.sized(16).bold,
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const Gap(4),
              Text(
                'Earnings',
                style: TextStyle().inter.sized(12).bold.colored(Colors.black),
              ),
              const Gap(8),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 180, 211),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const Gap(4),
              Text(
                'Spendings',
                style: const TextStyle()
                    .inter
                    .sized(12)
                    .bold
                    .colored(Colors.black),
              ),
            ],
          ),
        ),
        Expanded(
          child: BarChart(
            BarChartData(
              minY: 0,
              maxY: 60,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.grey,
                  getTooltipItem: (a, b, c, d) => null,
                ),
                touchCallback: (FlTouchEvent event, response) {
                  if (response == null || response.spot == null) {
                    setState(() {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    });
                    return;
                  }
                  touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                  setState(() {
                    if (!event.isInterestedForInteractions) {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                      return;
                    }
                    showingBarGroups = List.of(rawBarGroups);
                    if (touchedGroupIndex != -1) {
                      var sum = 0.0;
                      for (final rod
                          in showingBarGroups[touchedGroupIndex].barRods) {
                        sum += rod.toY;
                      }
                      final avg = sum /
                          showingBarGroups[touchedGroupIndex].barRods.length;

                      showingBarGroups[touchedGroupIndex] =
                          showingBarGroups[touchedGroupIndex].copyWith(
                        barRods: showingBarGroups[touchedGroupIndex]
                            .barRods
                            .map((rod) {
                          return rod.copyWith(toY: avg, color: widget.avgColor);
                        }).toList(),
                      );
                    }
                  });
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 35,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1,
                    getTitlesWidget: leftTitles,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: showingBarGroups,
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 3,
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '200';
    } else if (value == 20) {
      text = '400';
    } else if (value == 30) {
      text = '600';
    } else if (value == 40) {
      text = '800';
    } else if (value == 50) {
      text = '1000';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
