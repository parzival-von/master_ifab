import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/config/config.dart';

class DomusScreen extends StatefulWidget {

  const DomusScreen({super.key});

  @override
  State<DomusScreen> createState() => _DomusScreenState();
}

class _DomusScreenState extends State<DomusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterApp'),
      ),
      body: _DomusView(),
    );
  }
}



class _DomusView extends StatelessWidget {
  const _DomusView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  itemCount: appMenuItems.length,
  itemBuilder: (context, index) {
    final menuItem = appMenuItems[index];
    return _PropriumListTile(menuItem: menuItem);
  },  
  );
  }
}


class _PropriumListTile extends StatelessWidget {

final MenuItem menuItem;

  const _PropriumListTile({
    required this.menuItem
  });

  @override
  Widget build(BuildContext context) {

    final colorum = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.titulus),
      subtitle: Text(menuItem.subtitulus),
      leading: Icon(menuItem.icon, color: colorum.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colorum.primary),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}