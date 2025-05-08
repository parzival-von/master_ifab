import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart'; // Importación añadida

class DomusScreen extends StatelessWidget {
  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IfabApp'),
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
      itemBuilder: (context, i) {
        final menuItem = appMenuItems[i];
        return _PropiumListTitle(menuItem: menuItem,);
      },
    );
  }
}

class _PropiumListTitle extends StatelessWidget {
  
  final MenuItem menuItem;

  const _PropiumListTitle({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {

    final colorum = Theme.of(context).colorScheme;


    return ListTile(
      title: Text(menuItem.titulus),
      subtitle: Text(menuItem.subtitulus),
      leading: Icon(menuItem.icon, color: colorum.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: (){
        context.push(menuItem.link);
      },
    );
  }
}