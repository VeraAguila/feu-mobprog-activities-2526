import 'package:aguila_fa3/chart/chart_bar.dart';
import 'package:aguila_fa3/model/items.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.items,
  });
 
  final List<CheckoutItems> items;
 
  List<ItemBucket> get buckets {
    return [
      ItemBucket.forCategory(items, Category.drinks),
      ItemBucket.forCategory(items, Category.snacks),
      ItemBucket.forCategory(items, Category.meals),
    ];
  }
 
  double get maxTotalExpense {
    double maxTotalExpense = 0;
 
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }
 
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
 
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (buckets) => Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 4,
                      ),
                      child: Icon(
                        categoryIcons[buckets.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}