import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_medicine_management/app/core/infra/mqtt_client.dart';
import 'package:tcc_medicine_management/app/core/services/notification_service.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/controllers/main_home_controller.dart';
import 'package:tcc_medicine_management/app/modules/main_home/main/presentation/pie_chart.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/main/presentation/user_profile_page.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/controllers/medicine_stock_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/medicine/list/model/dto/medicine_list_request.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/presentation/medicine_card_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/controllers/treatment_list_controller.dart';
import 'package:tcc_medicine_management/app/modules/treatment/list/model/dto/treatment_list_request.dart';
import 'package:tcc_medicine_management/app/modules/treatment/shared/widgets/treatment_card_widget/presentation/treatment_card_widget.dart';
import 'package:tcc_medicine_management/app/shared/controllers/user/user_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/notification/controller/notification_controller.dart';
import 'package:tcc_medicine_management/main.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late MedicineStockListController medicineStockListController;
  late TreatmentListController treatmentListController;
  late MainHomeController mainHomeController;
  late UserController userController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the Provider here
    medicineStockListController = Provider.of<MedicineStockListController>(context);
    treatmentListController = Provider.of<TreatmentListController>(context);
    mainHomeController = Provider.of<MainHomeController>(context);
    userController = Provider.of<UserController>(context);

    // final MqttService mqttService = getIt<MqttService>();
    // if (!mqttService.isConnected() && userController.userId != null) {
    //   mqttService.connect(userController.userId.toString());
    // }

    // Run this only once when the widget is first created
    medicineStockListController.getListMedicines(
      MedicineListRequestDto(size: 5, search: medicineStockListController.search, sortBy: 'ExpirationDate'),
    );

    treatmentListController.getListTreatments(
      TreatmentListRequestDto(size: 5, search: treatmentListController.search, sortBy: 'ExpirationDate'),
    );
  }

  Future<void> refreshHomeScreenData() async {
    medicineStockListController.getListMedicines(
      MedicineListRequestDto(size: 5, search: medicineStockListController.search, sortBy: 'ExpirationDate'),
    );

    treatmentListController.getListTreatments(
      TreatmentListRequestDto(size: 5, search: treatmentListController.search, sortBy: 'ExpirationDate'),
    );

    mainHomeController.getResumePendency();
  }

  @override
  Widget build(BuildContext context) {
    final notificationController = Provider.of<NotificationController>(context);

    return Observer(
      builder: (_) => Scaffold(
        appBar: mainHomeController.selectedIndex == 0
            ? AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                title: const Text('Tela Inicial'),
                actions: [
                  // IconButton(
                  //   icon: Badge.count(
                  //     isLabelVisible: notificationController.unreadNotificationCount > 0,
                  //     count: notificationController.unreadNotificationCount,
                  //     child: const Icon(Icons.notifications_outlined),
                  //   ),
                  //   // onPressed: () => context.pushNamed('Notification'),
                  //   onPressed: () {
                  //     NotificationService.showInstantNotification(
                  //         "Tratamento para Enxaqueca 12:30h", "Clique aqui e veja mais detalhes");
                  //   },
                  // ),
                ],
                // actions: [_buildAppBarActions()],
              )
            : mainHomeController.selectedIndex == 1 && treatmentListController.multiSelectionIsEnabled
                ? AppBar(
                    // centerTitle: true,
                    backgroundColor: Colors.blue,
                    surfaceTintColor: Colors.blue,
                    actionsIconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    title: Row(
                      children: [
                        Checkbox(
                          value: treatmentListController.treatmentCards.every((card) => card.isSelected),
                          onChanged: (value) {
                            treatmentListController.selectAllCards(value);
                          },
                        ),
                        Text(
                          '${treatmentListController.treatmentCards.where((element) => element.isSelected).length} Selecionado(s)',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    actions: _buildTreatmentAppBarActions(treatmentListController),
                  )
                : mainHomeController.selectedIndex == 2 && medicineStockListController.multiSelectionIsEnabled
                    ? AppBar(
                        // centerTitle: true,
                        backgroundColor: Colors.blue,
                        surfaceTintColor: Colors.blue,
                        actionsIconTheme: const IconThemeData(
                          color: Colors.white,
                        ),
                        title: Row(
                          children: [
                            Checkbox(
                              value: medicineStockListController.medicineCards.every((card) => card.isSelected),
                              onChanged: (value) {
                                medicineStockListController.selectAllCards(value);
                              },
                            ),
                            Text(
                              '${medicineStockListController.medicineCards.where((element) => element.isSelected).length} Selecionado(s)',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        actions: _buildAppBarActions(medicineStockListController),
                      )
                    : null,
        drawer: mainHomeController.selectedIndex == 0
            ? Drawer(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.home),
                            title: const Text('Início'),
                            onTap: () => mainHomeController.setSelectedIndex(0),
                          ),
                          ListTile(
                            leading: const Icon(Icons.calendar_month),
                            title: const Text('Tratamentos'),
                            onTap: () => mainHomeController.setSelectedIndex(1),
                          ),
                          ListTile(
                            leading: const Icon(Icons.health_and_safety_outlined),
                            title: const Text('Medicamentos'),
                            onTap: () => mainHomeController.setSelectedIndex(2),
                          ),
                          ListTile(
                            leading: const Icon(Icons.wifi_rounded),
                            title: const Text('Conexão'),
                            onTap: () => context.goNamed('Connection'),
                          ),
                          ListTile(
                            leading: const Icon(Icons.notifications_none),
                            title: const Text('Notificações'),
                            onTap: () => context.goNamed('Notification'),
                          ),
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text('Perfil'),
                            onTap: () => mainHomeController.setSelectedIndex(3),
                          ),
                          ListTile(
                            leading: const Icon(Icons.security),
                            title: const Text('Troca de Senha'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: const Text('Configurações'),
                            onTap: () => context.goNamed('UserConfigurations'),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.remove('token');
                            context.goNamed('Home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            minimumSize: const Size(double.infinity, 40),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 20.0,
                              ),
                              SizedBox(width: 2.0),
                              Text('SAIR'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: _buildBody(mainHomeController.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          currentIndex: mainHomeController.selectedIndex,
          onTap: (index) => mainHomeController.setSelectedIndex(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Tratamento',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined),
              label: 'Medicamentos',
            ),
            if (userController.patientId == null) ...{
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            }
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(mainHomeController.selectedIndex),
      ),
    );
  }

  _buildTreatmentAppBarActions(TreatmentListController treatmentListController) {
    var actions = <Widget>[];

    actions.add(Observer(
      builder: (_) {
        return treatmentListController.multiSelectionIsEnabled &&
                treatmentListController.treatmentCards.where((element) => element.isSelected).isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async => await treatmentListController.deleteTreatments(
                  treatmentListController.treatmentCards
                      .where((element) => element.isSelected)
                      .map((card) => int.parse(card.id.toString()))
                      .toList(),
                ),
              )
            : Container();
      },
    ));

// TODO: maybe will not be used
    // actions.add(Observer(
    //   builder: (_) {
    //     return treatmentListController.multiSelectionIsEnabled &&
    //             treatmentListController.treatmentCards.where((element) => element.isSelected).length == 1
    //         ? IconButton(
    //             icon: const Icon(Icons.edit),
    //             onPressed: () => context.goNamed('TreatmentForm', queryParameters: {'readOnly': 'true'}),
    //           )
    //         : Container();
    //   },
    // ));

    actions.add(Observer(
      builder: (_) {
        return treatmentListController.multiSelectionIsEnabled
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: treatmentListController.disableMultiSelection,
              )
            : Container();
      },
    ));

    return actions;
  }

  _buildAppBarActions(MedicineStockListController medicineStockListController) {
    var actions = <Widget>[];

    actions.add(Observer(
      builder: (_) {
        return medicineStockListController.multiSelectionIsEnabled &&
                medicineStockListController.medicineCards.where((element) => element.isSelected).isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async => await medicineStockListController.deleteMedicines(
                  medicineStockListController.medicineCards
                      .where((element) => element.isSelected)
                      .map((card) => int.parse(card.medicineId.toString()))
                      .toList(),
                ),
              )
            : Container();
      },
    ));

// TODO: verify i think so that it will not be used
    // actions.add(Observer(
    //   builder: (_) {
    //     return medicineStockListController.multiSelectionIsEnabled &&
    //             medicineStockListController.medicineCards.where((element) => element.isSelected).length == 1
    //         ? IconButton(
    //             icon: const Icon(Icons.edit),
    //             onPressed: () => context.goNamed('MedicineStockForm', queryParameters: {'readOnly': 'true'}),
    //           )
    //         : Container();
    //   },
    // ));

    actions.add(Observer(
      builder: (_) {
        return medicineStockListController.multiSelectionIsEnabled
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: medicineStockListController.disableMultiSelection,
              )
            : Container();
      },
    ));

    return actions;
  }

  Widget _buildFloatingActionButton(int selectedIndex) {
    final medicineStockListController = Provider.of<MedicineStockListController>(context);
    final treatmentListController = Provider.of<TreatmentListController>(context);

    switch (selectedIndex) {
      case 0:
        return Container();
      case 1:
        return SpeedDial(
          icon: Icons.more_vert,
          activeIcon: Icons.close,
          backgroundColor: const Color(0xFF00A8FF),
          activeBackgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          activeForegroundColor: Colors.white,
          overlayColor: Colors.black,
          overlayOpacity: 0.3,
          elevation: 0,
          spacing: 3,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          // TODO: if needed, Implement the dialRoot
          // dialRoot: (ctx, open, toggleChildren) {
          //   return ElevatedButton(
          //     onPressed: toggleChildren,
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16),
          //       ),
          //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //       minimumSize: const Size(56, 56),
          //       maximumSize:  const Size(56, 56)
          //     ),
          //     child: const Icon(Icons.more_vert, color: Colors.white),
          //   );
          // },
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.blue,
              label: 'Novo Tratamento',
              onTap: () {
                context.goNamed('TreatmentForm');
              },
            ),
            // TODO: maybe it wont be used
            // SpeedDialChild(
            //   child: const Icon(Icons.edit, color: Colors.white),
            //   backgroundColor: const Color(0xFFC99B08),
            //   label: 'Editar',
            //   onTap: () => treatmentListController.enableMultiSelection(),
            // ),
            SpeedDialChild(
              child: const Icon(Icons.delete, color: Colors.white),
              backgroundColor: const Color(0xFFB3261E),
              label: 'Remover',
              onTap: () => treatmentListController.enableMultiSelection(),
            ),
            SpeedDialChild(
              child: const Icon(Icons.calendar_month_outlined, color: Colors.white),
              backgroundColor: const Color(0xFF21005D),
              label: 'Agenda',
              onTap: () => context.goNamed('TreatmentSchedule'),
            ),
          ],
        );
      case 2:
        return SpeedDial(
          icon: Icons.more_vert,
          activeIcon: Icons.close,
          backgroundColor: const Color(0xFF00A8FF),
          activeBackgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          activeForegroundColor: Colors.white,
          overlayColor: Colors.black,
          overlayOpacity: 0.3,
          elevation: 0,
          spacing: 3,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          // TODO: if needed, Implement the dialRoot
          // dialRoot: (ctx, open, toggleChildren) {
          //   return ElevatedButton(
          //     onPressed: toggleChildren,
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16),
          //       ),
          //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //       minimumSize: const Size(56, 56),
          //       maximumSize:  const Size(56, 56)
          //     ),
          //     child: const Icon(Icons.more_vert, color: Colors.white),
          //   );
          // },
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.blue,
              label: 'Novo Medicamento',
              onTap: () {
                context.goNamed('MedicineStockForm');
              },
            ),
            // TODO: problably will not be used
            // SpeedDialChild(
            //   child: const Icon(Icons.edit, color: Colors.white),
            //   backgroundColor: const Color(0xFFC99B08),
            //   label: 'Editar',
            //   onTap: () => medicineStockListController.enableMultiSelection(),
            // ),
            SpeedDialChild(
              child: const Icon(Icons.delete, color: Colors.white),
              backgroundColor: const Color(0xFFB3261E),
              label: 'Remover',
              onTap: () => medicineStockListController.enableMultiSelection(),
            ),
          ],
        );
      case 3:
        return Container();
      default:
        return Container();
    }
  }

  Widget _buildBody(int index) {
    final medicineStockListController = Provider.of<MedicineStockListController>(context);
    final treatmentListController = Provider.of<TreatmentListController>(context);

    switch (index) {
      case 0:
        return RefreshIndicator(
          onRefresh: refreshHomeScreenData,
          child: _buildHomePage(),
        );
      case 1:
        return _buildTreatmentPage(treatmentListController);
      case 2:
        return _buildMedicinePage(medicineStockListController);
      case 3:
        return UserProfilePage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildTreatmentPage(TreatmentListController treatmentListController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Expanded(
          flex: 3,
          child: _treatmentListPage(treatmentListController),
        ),
      ),
    );
  }

  Widget _treatmentListPage(TreatmentListController treatmentListController) {
    Timer? debounceTimer;

    if (!treatmentListController.multiSelectionIsEnabled) {
      treatmentListController.getListTreatments(
        TreatmentListRequestDto(size: 100, search: treatmentListController.search),
      );
    }

    void onSearchTreatmentChanged(String value) {
      // Cancel the previous timer if it's still active
      if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();

      // Start a new timer
      debounceTimer = Timer(const Duration(milliseconds: 300), () {
        // Update the search value in your controller
        treatmentListController.search = value;

        // Dispatch the request with the new search value
        treatmentListController
            .getListTreatments(TreatmentListRequestDto(size: 100, search: treatmentListController.search));
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0x9900A8FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tratamentos com\nMedicamentos',
                          style: TextStyle(
                              fontSize: 26, // Set the font family to Roboto
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1),
                        ),
                        Container(
                          width: 65,
                          height: 6,
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            border: Border.all(
                              color: Colors.black87, // Set border color
                              width: 2, // Set border width
                            ),
                            borderRadius: BorderRadius.circular(10), // Add a border radius
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // Adjust this value as needed
                  left: 16, // Adjust this value as needed
                  right: 16, // Adjust this value as needed
                  child: TextField(
                    onChanged: onSearchTreatmentChanged,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Busque seu tratamento',
                      prefixIcon: const Icon(Icons.search),
                      // TODO: Implement the filter list
                      // suffixIcon: IconButton(
                      //   icon: const Icon(Icons.filter_list),
                      //   onPressed: () {
                      //     _buildFilterBottomSheet(context);
                      //   },
                      // ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            RefreshIndicator(
              onRefresh: () async => await treatmentListController
                  .getListTreatments(TreatmentListRequestDto(size: 100, search: treatmentListController.search)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                child: Observer(
                  builder: (_) {
                    if (treatmentListController.treatmentCards.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: Center(
                              child: Text(
                                'Nenhum dado encontrado',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        itemCount: treatmentListController.treatmentCards.length,
                        itemBuilder: (context, index) {
                          final item = treatmentListController.treatmentCards[index];
                          return TreatmentCardWidget(
                            key: Key(item.hashCode.toString()),
                            treatmentCard: item,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicinePage(MedicineStockListController medicineStockListController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Expanded(
          flex: 1,
          child: _medicineStockListPage(medicineStockListController),
        ),
      ),
    );
  }

  Widget _medicineStockListPage(MedicineStockListController medicineStockListController) {
    Timer? debounceTimer;

    if (!medicineStockListController.multiSelectionIsEnabled) {
      medicineStockListController.getListMedicines(
        MedicineListRequestDto(size: 100, search: medicineStockListController.search),
      );
    }

    void onSearchChanged(String value) {
      // Cancel the previous timer if it's still active
      if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();

      // Start a new timer
      debounceTimer = Timer(const Duration(milliseconds: 300), () {
        // Update the search value in your controller
        medicineStockListController.search = value;

        // Dispatch the request with the new search value
        medicineStockListController
            .getListMedicines(MedicineListRequestDto(size: 100, search: medicineStockListController.search));
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0x9900A8FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Estoque de\nMedicamentos',
                          style: TextStyle(
                              fontSize: 26, // Set the font family to Roboto
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1),
                        ),
                        Container(
                          width: 65,
                          height: 6,
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            border: Border.all(
                              color: Colors.black87, // Set border color
                              width: 2, // Set border width
                            ),
                            borderRadius: BorderRadius.circular(10), // Add a border radius
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 120, // Adjust this value as needed
                  left: 16, // Adjust this value as needed
                  right: 16, // Adjust this value as needed
                  child: TextField(
                    onChanged: onSearchChanged,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Busque seu medicamento',
                      prefixIcon: const Icon(Icons.search),
                      // TODO: Implement the filter list
                      // suffixIcon: IconButton(
                      //   icon: const Icon(Icons.filter_list),
                      //   onPressed: () {
                      //     _buildFilterBottomSheet(context);
                      //   },
                      // ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            RefreshIndicator(
              onRefresh: () => medicineStockListController
                  .getListMedicines(MedicineListRequestDto(size: 100, search: medicineStockListController.search)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                child: Observer(
                  builder: (_) {
                    if (medicineStockListController.medicineCards.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: Center(
                              child: Text(
                                'Nenhum dado encontrado',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        itemCount: medicineStockListController.medicineCards.length,
                        itemBuilder: (context, index) {
                          final item = medicineStockListController.medicineCards[index];
                          return MedicineCardWidget(
                            key: Key(item.hashCode.toString()),
                            medicineCard: item,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// BELOW IS THE WIDGETS FOR MAIN HOME PAGE
  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainHomeController.hasPendency ? _buildAlertCard() : _buildNoPendencyCard(),
            _buildMenuRow(),
            _buildSectionHeader('MEDICAMENTOS', 'Vencimento Próximo'),
            _buildMedicineRow(),
            SizedBox(
              height: 8.0,
            ),
            _buildSectionHeader('GAVETEIRO', null),
            _buildDrawerUsageWidget(),
            _buildSectionHeader('TRATAMENTOS', 'Vencimento Próximo'),
            _buildTreatmentRow(),
            _buildHelpSection(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard() {
    return GestureDetector(
      onTap: () => context.goNamed('DailySummary'),
      child: Card(
        color: const Color(0xFFB3261E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/graphic_down.svg',
                fit: BoxFit.cover,
                height: 90,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Existem pontos que precisam de atenção',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Set border color
                                width: 2, // Set border width
                              ),
                              borderRadius: BorderRadius.circular(10), // Add a border radius
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Houve medicamentos não ingeridos, clique aqui para mais detalhes',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoPendencyCard() {
    return GestureDetector(
      onTap: () => context.goNamed('DailySummary'),
      child: Card(
        color: const Color(0xFF00A8FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/two_doctors.svg',
                fit: BoxFit.cover,
                height: 100,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bem-vindo de volta ao SALUS!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Set border color
                                width: 2, // Set border width
                              ),
                              borderRadius: BorderRadius.circular(10), // Add a border radius
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Está tudo certo, tenha um ótimo dia. Clique aqui para mais detalhes',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sort and Filter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('Sort by', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 8.0,
                children: [
                  ChoiceChip(
                    label: const Text('Alphabetical order'),
                    selected: _isSelected('Alphabetical order'),
                    onSelected: (selected) {
                      _onSelectedSort('Alphabetical order');
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Population'),
                    selected: _isSelected('Population'),
                    onSelected: (selected) {
                      _onSelectedSort('Population');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Subregion', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: const Text('Northern Europe'),
                    selected: _isSelected('Northern Europe'),
                    onSelected: (selected) {
                      _onSelectedRegion('Northern Europe');
                    },
                  ),
                  FilterChip(
                    label: const Text('Western Europe'),
                    selected: _isSelected('Western Europe'),
                    onSelected: (selected) {
                      _onSelectedRegion('Western Europe');
                    },
                  ),
                  // Add more FilterChips for other regions
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _resetFilters,
                    child: const Text('Reset All'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _applyFilters();
                    },
                    child: const Text('Apply'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  bool _isSelected(String filter) {
    return true;
    // Implement your logic to check if a filter is selected
  }

  void _onSelectedSort(String sortOption) {
    // Implement your logic for sorting
  }

  void _onSelectedRegion(String region) {
    // Implement your logic for region selection
  }

  void _resetFilters() {
    // Implement your logic for resetting filters
  }

  void _applyFilters() {
    // Implement your logic to apply filters
  }

  Widget _buildMenuRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMenuIcon(Icons.health_and_safety_outlined, 'Estoque', () => mainHomeController.setSelectedIndex(2)),
          _buildMenuIcon(Icons.calendar_month, 'Tratamentos', () => mainHomeController.setSelectedIndex(1)),
          _buildMenuIcon(Icons.wifi, 'Conexão', () => context.goNamed('Connection')),
          _buildMenuIcon(Icons.people_rounded, 'Pacientes', () => context.goNamed('Patients')),
          // _buildMenuIcon(Icons.language_outlined, 'Estatísticas'),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 3.0),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Widget _buildMenuIcon(IconData icon, String label) {
  //   return Column(
  //     children: [
  //       Card(
  //         elevation: 0,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         color: Colors.white,
  //         child: Container(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Icon(icon, size: 24),
  //         ),
  //       ),
  //       Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
  //     ],
  //   );
  // }

  Widget _buildSectionHeader(String title, String? action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (action != null) TextButton(onPressed: () {}, child: Text(action)),
        ],
      ),
    );
  }

  Widget _buildMedicineRow() {
    return medicineStockListController.medicineCards.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Text(
                    'Nenhum dado encontrado',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var medicineCard in medicineStockListController.medicineCards)
                  _buildViewCard(
                      name: medicineCard.name, quantity: medicineCard.quantity, expires: medicineCard.expirationDate),
              ],
            ),
          );
  }

  Widget _buildViewTreatmentCard({required String name, required double price, required String expires}) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/generic_medicine.png'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Custo: ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
              TextSpan(
                  text: 'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
            ])),
            const SizedBox(
              height: 2,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: 'Vence em: ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
                  TextSpan(
                      text: DateFormat('dd/MM/yyyy', 'pt_BR').format(DateTime.parse(expires)),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewCard({required String name, required int quantity, required String expires}) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/generic_medicine.png'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Estoque: ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
              TextSpan(
                  text: quantity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
              TextSpan(
                  text: ' Unidade(s)',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
            ])),
            const SizedBox(
              height: 2,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: 'Vence em: ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 10)),
                  TextSpan(
                      text: expires,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerUsageWidget() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 12.0),
                  child: Text(
                    'Uso do Widget',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 4,
                  color: Color(0xFFF4F5F6),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xFFA6B054),
                                ),
                                const SizedBox(width: 8),
                                const Text('Gavetas Livres',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                                Expanded(child: Container()),
                                const Text('30%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xFFFAB95B),
                                ),
                                const SizedBox(width: 8),
                                const Text('Gavetas Ociosas',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                                Expanded(child: Container()),
                                const Text('60%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xFFFF8981),
                                ),
                                const SizedBox(width: 8),
                                const Text('Gavetas Ocupadas',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                                Expanded(child: Container()),
                                const Text('10%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 70), // Espaço entre o conteúdo e o gráfico
                      const SizedBox(
                        width: 50, // Largura fixa para o gráfico
                        height: 50, // Altura fixa para o gráfico
                        child: CustomPieChart(),
                      ),
                      const SizedBox(width: 16)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreatmentRow() {
    return treatmentListController.treatmentCards.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Text(
                    'Nenhum dado encontrado',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var treatmentCard in treatmentListController.treatmentCards)
                  _buildViewTreatmentCard(
                      name: treatmentCard.name, price: treatmentCard.totalPrice, expires: treatmentCard.expirationDate),
              ],
            ),
          );
  }

  Widget _buildHelpSection() {
    return GestureDetector(
      onTap: () => context.goNamed('FaqHelp'),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                  child: SvgPicture.asset(
                    'assets/images/help.svg',
                    fit: BoxFit.cover,
                    height: 80,
                  )),
              const Expanded(
                flex: 5,
                child: Text(
                  'PRECISA DE AJUDA?',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
