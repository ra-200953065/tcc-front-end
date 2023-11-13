import 'package:flutter/material.dart';
import 'package:tcc/models/user_restrict_model.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/controllers/user_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/widgets/dialogs/dialog_date_widget.dart';

class InspectionsHomeView extends StatefulWidget {
  const InspectionsHomeView({super.key});

  @override
  State<InspectionsHomeView> createState() => _InspectionsHomeViewState();
}

class _InspectionsHomeViewState extends State<InspectionsHomeView> {
  final TextEditingController initDatePtBr = TextEditingController();
  final TextEditingController endDatePtBr = TextEditingController();
  DateTime? initDateIso;
  DateTime? endDateIso;

  String dateIsoToDatePtbr(DateTime date) {
    String day = date.day < 10 ? '0${date.day}' : '${date.day}';
    String month = date.month < 10 ? '0${date.month}' : '${date.month}';
    String year = '${date.year}';
    return '$day/$month/$year';
  }

  List<UserRestrictModel> users = [];

  UserRestrictModel? _selectedUser;

  final controller = UserController();
  ApiResponse<List<UserRestrictModel>> apiResponse = ApiResponse();
  bool loadingUsers = false;

  Future<void> getUsers() async {
    setState(() => loadingUsers = true);

    apiResponse = await controller.getRestrictList();

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        setState(() {
          users = apiResponse.data!;
          users.insert(
            0,
            UserRestrictModel(id: 0, name: 'Todos'),
          );
          _selectedUser = users[0];
        });
        break;
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      case EnumHttpStatusCode.message:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, true),
        );
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Inspeções'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: initDatePtBr,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Data início',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(15.0),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        initDateIso = null;
                        initDatePtBr.clear();
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  initDateIso = await dialogDateWidget(context, initDateIso);
                  setState(() {
                    initDatePtBr.text = initDateIso != null
                        ? dateIsoToDatePtbr(initDateIso!)
                        : '';
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: endDatePtBr,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Data fim',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(15.0),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        endDateIso = null;
                        endDatePtBr.clear();
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  endDateIso = await dialogDateWidget(context, endDateIso);
                  setState(() {
                    endDatePtBr.text = endDateIso != null
                        ? dateIsoToDatePtbr(endDateIso!)
                        : '';
                  });
                },
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<UserRestrictModel>(
                isExpanded: true,
                value: _selectedUser,
                icon: const Icon(Icons.arrow_downward),
                onChanged: (newValue) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    _selectedUser = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 15.0,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'Responsável',
                ),
                items: users.map((UserRestrictModel map) {
                  return DropdownMenuItem<UserRestrictModel>(
                    value: map,
                    child: Text(map.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              elevatedButtonSquareWidget(
                context: context,
                label: 'Buscar',
                action: () {
                  Navigator.of(context).pushNamed(
                    '/inspections/list',
                    arguments: {
                      'userId': _selectedUser!.id,
                      'initDate': initDateIso != null
                          ? initDateIso.toString()
                          : '2000-01-01',
                      'endDate': endDateIso != null
                          ? endDateIso.toString()
                          : '2099-01-31',
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        tooltip: 'Nova inspeção',
        onPressed: () => Navigator.of(context).pushNamed('/inspections/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
