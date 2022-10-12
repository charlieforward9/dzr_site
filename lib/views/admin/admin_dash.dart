import 'package:flutter/material.dart';
import 'package:dzr_site/views/admin/admin.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Web App Content'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Results"),
              Tab(text: "Services"),
              Tab(text: "Leads", icon: Icon(Icons.person))
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminHome(),
            AdminResults(),
            AdminService(),
            AdminLeads(),
          ],
        ),
      ),
    );
  }
}
