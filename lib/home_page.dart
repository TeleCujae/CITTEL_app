import 'package:flutter/material.dart';
import 'package:cittel_app/models/models.dart';
import 'package:cittel_app/widgets/widgets.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool inMainMenu = true;
  bool useEnglish = false;
  ListView view = ListView.separated(
    padding: const EdgeInsets.only(
      top: 8,
    ),
    itemBuilder: (context, index) {
      return ScheduleWidget(
        task: scheduleList[index],
      );
    },
    itemCount: scheduleList.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 4,
      );
    },
  );
  DateTime filter = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: filter,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != filter) {
      setState(() {
        filter = selected;
        var filteredList = scheduleList
            .where((element) => element.taskTime.day == filter.day)
            .toList();
        view = ListView.separated(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          itemBuilder: (context, index) {
            return ScheduleWidget(task: filteredList[index]);
          },
          itemCount: filteredList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 4,
            );
          },
        );
        setState(() => {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: size.width,
                height: size.height / 4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/splash.png'),
                    scale: 25,
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff8d70fe),
                      Color(0xff2da9ef),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: inMainMenu
                      ? [
                          ListTile(
                            horizontalTitleGap: 12.5,
                            contentPadding: const EdgeInsets.all(4),
                            leading: Text(
                              DateTime.now().day.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.amber,
                              ),
                            ),
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                DateTime.now().month.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              DateTime.now().year.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            Positioned(
              top: size.height / 3.8,
              left: 16,
              child: Container(
                width: size.width - 32,
                height: size.height / 1.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: view,
                ),
              ),
            ),
            inMainMenu
                ? Positioned(
                    top: size.height / 20,
                    left: 6.3 * size.width / 8,
                    child: SizedBox(
                      width: size.width / 5,
                      height: size.height / 20,
                      child: ElevatedButton(
                        onPressed: () {
                          useEnglish = !useEnglish;
                          setState(() {});
                        },
                        child: Text(useEnglish ? 'esp' : 'eng'),
                      ),
                    ))
                : const Positioned(
                    child: Text(''),
                  ),
            inMainMenu
                ? Positioned(
                    top: size.height / 6,
                    left: 6.3 * size.width / 8,
                    child: SizedBox(
                      width: size.width / 5,
                      height: size.height / 20,
                      child: ElevatedButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(useEnglish ? "Date" : "Fecha"),
                      ),
                    ))
                : const Positioned(
                    child: Text(''),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff2da9ef),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                inMainMenu = false;
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return PersonaInfoWidget(
                      info: personaInfoList[index],
                      useEnglish: useEnglish,
                    );
                  },
                  itemCount: personaInfoList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() => {});
              },
              icon: const Icon(
                Icons.people,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                inMainMenu = false;
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return PersonaInfoWidget(
                      info: aboutUs[index],
                      useEnglish: useEnglish,
                    );
                  },
                  itemCount: aboutUs.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() => {});
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          inMainMenu = true;
          view = ListView.separated(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            itemBuilder: (context, index) {
              return ScheduleWidget(
                task: scheduleList[index],
              );
            },
            itemCount: scheduleList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 4,
              );
            },
          );
          setState(() => {});
        },
        backgroundColor: const Color(0xff2da9ef),
        foregroundColor: const Color(0xffffffff),
        child: const Icon(
          Icons.home,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
