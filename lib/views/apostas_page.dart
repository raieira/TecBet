import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApostasPage extends StatefulWidget {
  const ApostasPage({super.key});

  @override
  State<ApostasPage> createState() => _ApostasPageState();
}

class _ApostasPageState extends State<ApostasPage> {
  final _sports = ['Esportes', 'Futebol', 'Basquete', 'Vôlei'];
  final _status = ['Todos', 'Ganha', 'Perdeu', 'Em andamento'];
  String? _selectedSport;
  String? _selectedStatus;
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Apostas", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown('Esportes', _sports, _selectedSport, (val) {
                setState(() => _selectedSport = val);
              }),
              const SizedBox(height: 12),

              _buildTextField('Apostador'),
              const SizedBox(height: 12),

              _buildTextField('Código'),
              const SizedBox(height: 12),

              _buildDatePicker(context),
              const SizedBox(height: 12),

              _buildDropdown('Todos', _status, _selectedStatus, (val) {
                setState(() => _selectedStatus = val);
              }),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text("Filtrar",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),

              const Text("Qtd. apostas: 27",
                  style: TextStyle(color: Colors.white)),
              const Text("Total apostado: R\$ 121,70",
                  style: TextStyle(color: Colors.white)),
              const Text("Total prêmios: R\$ 0,00",
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 16),

              _buildTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value,
      void Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.black,
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      items: items
          .map((e) =>
              DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white))))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    String text = "10/11/2025 - 16/11/2025";
    if (_selectedDateRange != null) {
      text =
          "${DateFormat('dd/MM/yyyy').format(_selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(_selectedDateRange!.end)}";
    }

    return GestureDetector(
      onTap: () async {
        final DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2024),
          lastDate: DateTime(2026),
          initialDateRange: _selectedDateRange,
        );
        if (picked != null) {
          setState(() {
            _selectedDateRange = picked;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Período',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700)),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(color: Colors.white)),
            const Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
        },
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade800),
        ),
        children: [
          _buildHeaderRow(),
          _buildRow("46EC-94BA", "R\$ 10,00", "R\$ 1,00"),
          _buildRow("B673-B8E3", "R\$ 2,00", "R\$ 0,20"),
          _buildRow("587D-D9CF", "R\$ 2,00", "R\$ 0,24"),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return const TableRow(
      decoration: BoxDecoration(color: Colors.black54),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Cod.", style: TextStyle(color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Valor", style: TextStyle(color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Comissão", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  TableRow _buildRow(String cod, String valor, String comissao) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cod, style: const TextStyle(color: Colors.white)),
              const Row(
                children: [
                  Icon(Icons.delete, color: Colors.red, size: 20),
                  SizedBox(width: 6),
                  Icon(Icons.visibility, color: Colors.green, size: 20),
                ],
              ),
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(valor, style: const TextStyle(color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(comissao, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

