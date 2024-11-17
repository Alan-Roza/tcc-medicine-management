import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_medicine_management/app/modules/medicine/shared/widgets/medicine_card_widget/presentation/medicine_schedule_card_widget.dart';
import 'package:tcc_medicine_management/app/modules/treatment/schedule/controllers/treatment_schedule_controller.dart';


class TreatmentSchedulePage extends StatelessWidget {
  const TreatmentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarStore = TreatmentScheduleController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Calendário"),
        backgroundColor: Color(0xFF00A8FF),
        surfaceTintColor: Color(0xFF00A8FF),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                color: Color(0xFF00A8FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TableCalendar(
                  locale: 'pt_BR',
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  focusedDay: calendarStore.selectedDate,
                  selectedDayPredicate: (day) =>
                      isSameDay(calendarStore.selectedDate, day),
                  onDaySelected: (selectedDay, _) {
                    calendarStore.selectDate(selectedDay);
                  },
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                    outsideTextStyle: TextStyle(color: const Color.fromARGB(255, 44, 44, 44)),
                    selectedDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: const Color(0xFFFF5334),
                      shape: BoxShape.circle,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  headerStyle: HeaderStyle(
                    decoration: BoxDecoration(
                      color: Color(0xFF00A8FF),
                    ),
                    leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Observer(
            builder: (_) {
              return calendarStore.events.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: calendarStore.events.length,
                        itemBuilder: (context, index) {
                          final event = calendarStore.events[index];
                          return EventCard(event: event);
                        },
                      ),
                    )
                    : Expanded(
                      child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                        "Nenhum evento para esta data",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    return MedicineScheduleCardWidget(
      key: ValueKey(event['id']),
      medicineCard: event,
    );

    // return  Card(
    //   margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           "Paciente: ${event['patient']}",
    //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //         ),
    //         const SizedBox(height: 8),
    //         Text("Condição: ${event['condition']}"),
    //         const SizedBox(height: 8),
    //         Text("Quantidade: ${details['quantity']}"),
    //         Text("Frequência: ${details['frequency']}"),
    //         Text("Finalização: ${details['endDate']}"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
