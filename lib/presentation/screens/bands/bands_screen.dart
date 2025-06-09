import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/config/config.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';
import 'package:pie_chart/pie_chart.dart';

class BandsScreen extends ConsumerWidget {
  const BandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bands = ref.watch(bandsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),
      body: Column(
        children: [ 
            _videreData(bands),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (context, i) => _bandTitle(context, ref, bands[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: bands.length < 8 ? true : false,
        child: FloatingActionButton(
          elevation: 1,
          onPressed: () => addereNovumBand(context, ref),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

 Widget _videreData( List<Band> bands ) {
        // ignore: prefer_collection_literals
        Map<String, double> dataMap = Map(); 
        for (var band in bands) { 
            dataMap.putIfAbsent(band.nomen, () => 
band.numerusVotum.toDouble() );
        }
        final List<Color> colorList = [
            Colors.pink.shade300,
            Colors.pink.shade800,
            Colors.blue.shade200,
            Colors.blue.shade600,
            Colors.lightGreen.shade200,
            Colors.lightGreen.shade600,
            Colors.red.shade500,
            Colors.deepPurple.shade600,
        ];
    
        return dataMap.isNotEmpty ? Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            width: double.infinity,
            height: 200.0,
            child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                colorList: colorList,
                chartType: ChartType.ring,
                legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "CupertinoSystemText", fontSize: 17,
                    ),
                ),
                chartValuesOptions: ChartValuesOptions(
                    showChartValues: dataMap.length <= 6, // con más de 6 no se ve el valor
                    showChartValueBackground: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                ),
            ),
        ) : const LinearProgressIndicator();
    
    
  }

}

Widget _bandTitle(BuildContext context, WidgetRef ref, Band band) {
  return Dismissible(
    key: Key(band.id),
    direction: DismissDirection.startToEnd,
    onDismissed: (direction) {
      ref.read(bandsProvider.notifier).delereBand(band);
    },
    child: ListTile(
      leading: CircleAvatar(
        child: Text(
          band.nomen.substring(0, 2).toUpperCase(),
          style: TextStyle(fontFamily: "CuppertinoSystemText", fontSize: 17),
        ),
      ),
      title: Text(band.nomen),
      trailing: Text('${band.numerusVotum}', style: const TextStyle(fontSize: 20)),
      onTap: () {
        ref.read(bandsProvider.notifier).addereVotum(band);
      },
    ),
  );
}

void addereNovumBand(BuildContext context, WidgetRef ref) {
  final TextEditingController textumController = TextEditingController();

  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('New band name'),
      content: CupertinoTextField(
        controller: textumController,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Add'),
          onPressed: () {
            addereBandAdCollectione(context, ref, textumController.text);
          },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

void addereBandAdCollectione(BuildContext context, WidgetRef ref, String nomen) {
  if (nomen.length > 1) {
    ref.read(bandsProvider.notifier).addereBand(
      Band(
        id: DateTime.now().toString(),
        nomen: nomen,
        numerusVotum: 0,
      ),
    );
  }
  Navigator.pop(context);
}