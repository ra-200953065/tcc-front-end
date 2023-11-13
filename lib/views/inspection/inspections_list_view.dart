import 'package:flutter/material.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import '../../controllers/inspection_controller.dart';
import '../../models/api_response.dart';
import '../../models/inspection_model.dart';

class InspectionsListView extends StatefulWidget {
  const InspectionsListView({
    super.key,
    required this.userId,
    required this.initDate,
    required this.endDate,
  });

  final int userId;
  final String initDate;
  final String endDate;

  @override
  State<InspectionsListView> createState() => _InspectionsListViewState();
}

class _InspectionsListViewState extends State<InspectionsListView> {
  bool loading = false;
  ApiResponse<List<InspectionModel>> apiResponse = ApiResponse();
  ApiResponse<Map<String, dynamic>> apiResponseDeleteUser = ApiResponse();
  final controller = InspectionController();

  Future<void> fetchGetInspections() async {
    setState(() => loading = true);

    apiResponse = await controller.getInspections(
      widget.userId,
      widget.initDate.split(' ')[0],
      widget.endDate.split(' ')[0],
    );

    switch (apiResponse.code) {
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      case EnumHttpStatusCode.message:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, true),
        );
        break;
      default:
        setState(() => loading = false);
    }
  }

  String dateIsoToPtbr(String isoDate) {
    final splitted = isoDate.split('-');

    return '${splitted[2]}/${splitted[1]}/${splitted[0]}';
  }

  @override
  void initState() {
    super.initState();
    fetchGetInspections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspeções'),
        actions: [
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (r) => false,
                );
              }),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (apiResponse.data == null || apiResponse.data!.isEmpty) {
            return const Center(
                child: Text(
              'Sem dados para exibir',
              style: TextStyle(fontSize: 20),
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: RefreshIndicator(
                onRefresh: () => fetchGetInspections(),
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemCount: apiResponse.data!.length,
                  itemBuilder: (context, index) {
                    final item = apiResponse.data![index];
                    return ListTile(
                      key: ValueKey(item.id),
                      title: Text(
                        '${dateIsoToPtbr(item.date)}    ${item.time}',
                        style: const TextStyle(fontSize: 17),
                      ),
                      subtitle: Text(item.user.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/inspections/details',
                          arguments: item,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
