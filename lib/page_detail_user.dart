import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'DetailUserModel.dart';

class PageDetailUser extends StatelessWidget {
  final int idUser;

  PageDetailUser({required this.idUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: _buildDetailUserBody(),
    );
  }

  Widget _buildDetailUserBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadDetailUser(idUser, idUser: idUser),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            DetailUserModel detailUserModel =
                DetailUserModel.fromJson(snapshot.data);
            return _buildSuccessSection(context, detailUserModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(BuildContext context, DetailUserModel data) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildItemUsers(context, data.data!),
        ],
      ),
    );
  }

  Widget _buildItemUsers(BuildContext context, Data userData) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetailUser(idUser: userData.id!),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.network(userData.avatar!),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${userData.id}"),
                Text("Email: ${userData.email}"),
                Text("First Name: ${userData.firstName}"),
                Text("Last Name: ${userData.lastName}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
