import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:berita/cubit/berita_cubit.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({super.key});

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  final BeritaCubit beritaCubit = BeritaCubit();

  @override
  void initState() {
    // Panggil getDataResepMakanan yang ada di ResepMakananCubit
    beritaCubit.getDataBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.newspaper_outlined),
        title: Text('191011450053 - Muhamad Febriyanto'),
      ),
      body: BlocBuilder<BeritaCubit, BeritaState>(
        bloc: beritaCubit,
        builder: (context, state) {
          if (state is BeritaInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            itemCount: beritaCubit.beritaModel,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                  title: Text(
                    beritaCubit.beritaModel.results![index].title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(beritaCubit.beritaModel.results![index].pubDate!),
                        Text(beritaCubit
                            .beritaModel.results![index].description!),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
