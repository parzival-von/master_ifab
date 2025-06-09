import 'package:flutter/material.dart';

class MenuItem {
  final String titulus;
  final String subtitulus;
  final String link;
  final IconData icon;


const MenuItem({
  required this.titulus,
  required this.subtitulus,
  required this.link,
  required this.icon,
});
}


const appMenuItems = <MenuItem>[
  MenuItem(
    titulus: 'Contador',
    subtitulus: 'Introducción a Riverpod',
    link: '/numerator-river',
    icon: Icons.add,
  ),

  
  MenuItem(
 titulus: 'App con videos',
 subtitulus: 'Control de videos verticales',
 link: '/videos',
 icon: Icons.video_call_outlined
 ),


 MenuItem(
 titulus: 'Aplicación con sockets',
 subtitulus: 'Comunicación en tiempo real',
 link: '/bands',
 icon: Icons.music_note_outlined
 ),


 MenuItem(
 titulus: 'Gestión de temas',
 subtitulus: 'Modo dark, light, colores...',
 link: '/theme-mutante',
 icon: Icons.color_lens_outlined
 ),


 MenuItem(
 titulus: 'Sensores del dispositivo',
 subtitulus: 'Acelerómetro, magnetó...',
 link: '/sensors',
 icon: Icons.sensors_rounded
 ),


 MenuItem(
 titulus: 'Moviendo un círculo',
 subtitulus: 'Manejo del giroscopio',
 link: '/gyroscope',
 icon: Icons.downloading
 ),


 MenuItem(
 titulus: 'Ubicación del usuario',
 subtitulus: 'Localización y seguimiento',
 link: '/location',
 icon: Icons.pin_drop_outlined
 ),


 MenuItem(
 titulus: 'PokèApi',
 subtitulus: 'Peticiones http a una Api',
 link: '/request',
 icon: Icons.catching_pokemon
 ),


MenuItem(
 titulus: 'Animated container',
 subtitulus: 'Stateful widget animado',
 link: '/animated',
 icon: Icons.check_box_outline_blank_rounded
 ),


 MenuItem(
 titulus: 'ShoesApp',
 subtitulus: 'UI y Widgets personalizados',
 link: '/shoes',
 icon: Icons.add_shopping_cart
 ),


 MenuItem(
 titulus: 'InfiniteScroll',
 subtitulus: 'Y acción de pull to refresh',
 link: '/infinite',
 icon: Icons.list_alt_rounded
 ),
];