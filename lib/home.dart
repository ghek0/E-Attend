import 'package:flutter/material.dart';
import 'notification.dart';
import 'schedule.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Eattend extends StatelessWidget {
  const Eattend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD95A),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SchedulePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
            // case 3:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const ProfilePage()),
            //   );
            //   break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'schedule',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: 'notification',
          // ),

          // BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        selectedItemColor: Colors.black,
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _builderHeader(),
              _buildCheckInOutCard(),
              // _buildSchedule(),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   'Recent Activity',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 8),
                  _buildRecentActivity(),
                  // Add your schedule list here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi,',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('24 Mei 2023'),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  ); // Add your profile logic here
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/Logo.png'),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  ); // Add your notification logic here
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInOutCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: _buildCheckCard(
              'Check In',
              '07:59 AM',
              'Ontime',
              Colors.green[100],
              'Check In',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildCheckCard(
              'Check Out',
              '05:00 PM',
              'Ontime',
              Colors.red[100],
              'Check Out',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckCard(
    String title,
    String time,
    String status,
    Color? color,
    String? buttonText,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                title == 'Check In' ? Icons.login : Icons.logout,
                color: Colors.black54,
              ),
              SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(status, style: TextStyle(fontSize: 12)),
          if (buttonText != null) // Check if buttonText is not null
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  shape: StadiumBorder(),
                ),
                child: Text(buttonText),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.history_outlined),
                SizedBox(width: 8),
                Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(
              'See More',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildRecentActivityRow(
          isCheckIn: true,
          time: '07:59 PM',
          date: '24 Mei 2023',
          status: 'Overtime',
        ),
        _buildRecentActivityRow(
          isCheckIn: false,
          time: '06:59 AM',
          date: '24 Mei 2023',
          status: 'Ontime',
        ),
      ],
    ),
  );
}


  Widget _buildRecentActivityRow({
    required bool isCheckIn,
    required String time,
    required String date,
    required String status,
  }) {
    final icon = isCheckIn ? Icons.arrow_forward : Icons.arrow_back;
    final iconColor = isCheckIn ? Colors.green : Colors.red;
    final title = isCheckIn ? 'Check In' : 'Check Out';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withOpacity(0.15),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                status,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildSchedule() {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           'Schedule',
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 8),
  //         // Add your schedule list here
  //       ],
  //     ),
  //   );
  // }
}
