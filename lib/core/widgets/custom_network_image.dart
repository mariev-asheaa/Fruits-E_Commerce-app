import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const baseUrl='https://nktbjphxchcniwhvojsz.supabase.co/storage/v1/object/public';
    return Image.network("$baseUrl/$imageUrl");
  }
}