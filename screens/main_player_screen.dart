import 'package:flutter/material.dart';
import 'task_manager.dart';

class MainPlayerScreen extends StatefulWidget {
  @override
  State<MainPlayerScreen> createState() => _MainPlayerScreenState();
}

class _MainPlayerScreenState extends State<MainPlayerScreen> {
  int _selectedTab = 1; // 0: Player, 1: Home, 2: Tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1928),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sincronía', style: TextStyle(fontFamily: 'Serif', fontSize: 28, color: Colors.white, letterSpacing: 1)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.white70),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF182B45),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.music_note, color: _selectedTab == 0 ? Colors.white : Colors.white.withOpacity(0.6)),
                        onPressed: () => setState(() => _selectedTab = 0),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: _selectedTab == 1 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                        child: IconButton(
                          icon: Icon(Icons.home, color: _selectedTab == 1 ? const Color(0xFF182B45) : Colors.white.withOpacity(0.6)),
                          onPressed: () => setState(() => _selectedTab = 1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.calendar_today, color: _selectedTab == 2 ? Colors.white : Colors.white.withOpacity(0.6)),
                        onPressed: () => setState(() => _selectedTab = 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedTab == 1)
                _buildHomeContent()
              else if (_selectedTab == 2)
                _buildTaskManager()
              else
                _buildPlayerContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Aquí va el contenido principal de inicio (puedes dejar el calendario, playlists, etc)
        const Text('Pantalla de inicio', style: TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTaskManager() {
    // Usar solo el widget TaskManagerScreen centralizado
    return const TaskManagerScreen();
  }

  String _dueDateText(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Hoy';
    } else if (date.isBefore(now)) {
      return 'Ayer';
    } else if (date.difference(now).inDays == 1) {
      return 'Mañana';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  Widget _priorityChip(String priority) {
    Color color;
    switch (priority) {
      case 'Volumen al 100':
        color = Colors.red;
        break;
      case 'Coro pegajoso':
        color = Colors.yellow[800]!;
        break;
      case 'Beat suave':
        color = Colors.green[700]!;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(priority, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _labelChip(String label) {
    Color color;
    switch (label) {
      case 'Investigación':
        color = Colors.black;
        break;
      case 'Estudio':
        color = Colors.white;
        break;
      case 'Ejercicio':
        color = Colors.white;
        break;
      case 'Viaje':
        color = Colors.white;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.18),
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: color == Colors.white ? Colors.black : color, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }


  Widget _buildPlayerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Aquí irá el reproductor de música
        const Text('Reproductor', style: TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(height: 24),
      ],
    );
  }




}
