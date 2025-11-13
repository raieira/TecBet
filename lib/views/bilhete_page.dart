import 'package:flutter/material.dart';

class BilhetePage extends StatefulWidget {
  const BilhetePage({Key? key}) : super(key: key);

  @override
  State<BilhetePage> createState() => _BilhetePageState();
}

class _BilhetePageState extends State<BilhetePage> {
  bool aceitarAlteracaoOdds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "BILHETE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Linha Superior
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Jogos Selecionados",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Row(
                  children: const [
                    Icon(Icons.delete_forever, color: Colors.red, size: 18),
                    SizedBox(width: 4),
                    Text("Remover todos",
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),

          // Mensagem de nenhum jogo
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Nenhuma aposta selecionada!\nSelecione alguma aposta clicando nas ODDS para poder finalizar o bilhete.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(), // Espaço vazio como no app real
          ),

          // Parte Inferior
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border(
                top: BorderSide(color: Colors.grey.shade800, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do apostador
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Nome do Apostador",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: const Color(0xFF0D0D0D),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Valor da aposta
                TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "R\$ 0",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: const Color(0xFF0D0D0D),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Cotação: 0.00",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Possíveis Ganhos: R\$ 0,00",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Checkbox(
                      value: aceitarAlteracaoOdds,
                      activeColor: Colors.red,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() => aceitarAlteracaoOdds = value!);
                      },
                    ),
                    const Text(
                      "Aceitar alterações de odds",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null, // Desativado quando não há apostas
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Apostar (0)",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
