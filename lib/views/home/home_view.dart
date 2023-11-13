import 'package:flutter/material.dart';
import 'package:tcc/views/home/drawer_widget.dart';
import 'package:tcc/widgets/dialogs/confirm_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UHBC - Inspeções'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () async {
              bool? res = await confirmWidget(
                context,
                'Atenção',
                'Deseja efetuar logout?',
              );

              res = res ?? false;

              if (res == true) {
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, '/auth/logout');
              }
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Builder(builder: (context) {
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                foregroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                  backgroundBlendMode: BlendMode.saturation,
                ),
                child: Image.asset(
                  'assets/images/logo_no_bg.png',
                  scale: 2.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'UNICESUMAR',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Engeharia de Software',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Marcio Giordani Gomes',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'R.A.: 20.095.306-5',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        tooltip: 'Nova inspeção',
        onPressed: () => Navigator.of(context).pushNamed('/inspections/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
