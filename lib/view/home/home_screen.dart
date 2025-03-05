import 'package:authentication/view/home/widget/custom_card.dart';
import 'package:flutter/material.dart';
import '../../viewModel/service/http_service.dart';
import '../../models/user_details_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserDetailsResponse? userDetails;

  Future<void> _fetchUserDetails() async {
    final response = await HttpService().getUserDetails();
    if (response.error == 0) {
      setState(() {
        userDetails = response;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.msg ?? '')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Icon(Icons.settings),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final response = await HttpService().logout();
              if (response.error == 0) {
                await HttpService().clearToken();
                Navigator.pushReplacementNamed(context, '/login');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(response.msg)),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(response.msg)),
                );
              }
            },
          ),
        ],
      ),
      body: userDetails == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                userDetails!.data?.info?.avatar ?? "N/A")),
                        SizedBox(height: 15),
                        Text(
                          userDetails!.data?.info?.name ?? 'N/A',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          userDetails!.data?.info?.email ?? 'N/A',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(userDetails!.data?.info?.birthDate ?? 'N/A',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.phone, color: Colors.green),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text(userDetails!.data?.info?.phone ?? 'N/A',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.green),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date of Birth",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text("01 Jan, 2000",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.orange),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                                userDetails!.data?.info?.address ?? 'N/A',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Hobbies:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey)),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: userDetails!.data?.hobbies?.map((hobby) {
                            return CustomCard(hobbies: hobby,);
                          }).toList() ??
                          [],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Skills:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey)),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: userDetails!.data?.skills?.map((skill) {
                            return Container(
                              padding: EdgeInsets.only(right: 8),
                              child: SizedBox(
                                height: 90,
                                width: 90,
                                child: Card(
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    skill,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  )),
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
