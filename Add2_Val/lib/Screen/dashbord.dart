import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  String answer = '';
  List<String> history = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adder App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Adder',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Number 1'),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('+'),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: secondNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Number 2'),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('='),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Answer: $answer',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculateAndStore();
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    clearNumbers();
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(history[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteEntry(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateAndStore() {
    if (firstNumber.text.isNotEmpty && secondNumber.text.isNotEmpty) {
      double result =
          double.parse(firstNumber.text) + double.parse(secondNumber.text);
      String operation = '${firstNumber.text} + ${secondNumber.text} = $result';
      setState(() {
        answer = result.toString();
        history.add(operation);
      });
    }
  }

  void clearNumbers() {
    setState(() {
      firstNumber.clear();
      secondNumber.clear();
      answer = '';
    });
  }

  void deleteEntry(int index) {
    setState(() {
      history.removeAt(index);
    });
  }
}
