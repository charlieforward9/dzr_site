import 'package:flutter/material.dart';
import 'package:dzr_site/views/admin/admin.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash>
    with SingleTickerProviderStateMixin {
  static const List<String> _paths = ["Home", "Other"];

  final List<Widget> _tabs = [
    Tab(text: _paths[0]),
    Tab(text: _paths[1]),
  ];

  final List<Widget> _destinations = const [
    AdminHome(),
    AdminMisc(),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Site Content'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _destinations,
      ),
    );
  }
}
