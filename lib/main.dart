import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Installer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'App',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Installer',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              width: 860,
              child: Text(
                'Domínio registrado e com ideia formada mas estacionada por enquanto. Caso tenha interesse entre em contato no email abaixo.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  const ClipboardData(text: "leonardobenedeti@gmail.com"),
                ).then(
                  (value) => showToast(),
                  onError: (err) => showToast(copied: false),
                );
              },
              borderRadius: BorderRadius.circular(8),
              mouseCursor: MaterialStateMouseCursor.clickable,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'leonardobenedeti@gmail.com',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.copy),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast({bool copied = true}) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: copied ? 'Email copiado!' : 'Erro ao copiar email!',
      description: copied
          ? 'Envie sua proposta e aguarde nosso contato!'
          : 'Tente copiar manualmente por favor =/',
      alignment: Alignment.center,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
