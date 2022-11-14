import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cittel_app/models/models.dart';
import 'package:cittel_app/widgets/widgets.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool inMainMenu = true;
bool useEnglish = false;
ListView view = ListView.separated(
  padding: const EdgeInsets.only(
    top: 8,
  ),
  itemBuilder: (context, index) {
    return AboutWidget(
      useEnglish: false,
    );
  },
  itemCount: 1,
  separatorBuilder: (context, index) {
    return const SizedBox(
      height: 4,
    );
  },
);
DateTime filter = DateTime.now();

late final conferencistas;
late final conferencias;

loadJson(String path) async {
  String data = await rootBundle.loadString(path);
  return json.decode(data);
}

List<Task> getTasks(List<dynamic> data) {
  List<Task> tasks = [];

  for (var e in data) {
    tasks.add(Task(
        useEnglish ? e["title"]["en"] : e["title"]["es"],
        e['author'],
        DateTime(e['year'], e['month'], e['day'], e['hour_from'], e['min_from']),
        DateTime(e['year'], e['month'], e['day'], e['hour_to'], e['min_to']),
        e['type']));
  }

  return tasks;
}

List<PersonaInfo> getPersonaInfo(Map<String, dynamic> data) {
  List<PersonaInfo> infos = [];

  for (var e in data.entries) {
    infos.add(PersonaInfo(e.key, e.value['details']['es'],
        e.value['details']['en'], e.value['image']));
  }

  return infos;
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      conferencistas = await loadJson('json/conferencistas.json');
      conferencias = await loadJson('json/conferencias.json');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/header.png'),
                ),
              ),
              child: null,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                inMainMenu = true;
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return AboutWidget(
                      useEnglish: useEnglish,
                    );
                  },
                  itemCount: 1,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_tree),
              title: const Text('Organizing Committee'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: const Text('Scientific Programs'),
              onTap: () {
                inMainMenu = false;
                var tmp = getTasks(conferencias);
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ScheduleWidget(
                      task: tmp[index],
                    );
                  },
                  itemCount: tmp.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.airplay),
              title: const Text('Master Conferences'),
              onTap: () {
                inMainMenu = false;
                var tmp = getTasks(conferencias)
                    .where((element) => element.type == 'master')
                    .toList();
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ScheduleWidget(
                      task: tmp[index],
                    );
                  },
                  itemCount: tmp.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.architecture),
              title: const Text('Courses and workshops'),
              onTap: () {
                inMainMenu = false;
                var tmp = getTasks(conferencias)
                    .where((element) =>
                        element.type == 'workshop' || element.type == 'course')
                    .toList();
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ScheduleWidget(
                      task: tmp[index],
                    );
                  },
                  itemCount: tmp.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text('Stand'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Lecturers'),
              onTap: () {
                inMainMenu = false;

                var tmp = getPersonaInfo(conferencistas);
                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return PersonaInfoWidget(
                      info: tmp[index],
                      useEnglish: useEnglish,
                    );
                  },
                  itemCount: tmp.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );

                setState(() => {});
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                inMainMenu = false;

                view = ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return CreditsWidget(
                      useEnglish: useEnglish,
                    );
                  },
                  itemCount: 1,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                );

                setState(() => {});
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/images/header.png'),
          fit: BoxFit.fitHeight,
        ),
        backgroundColor: Colors.blue,
      ),
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
                  //borderRadius: BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(10),),
                  /*gradient: LinearGradient(
                    colors: [
                      Color(0xff8d70fe),
                      Color(0xff2da9ef),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),*/
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
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              DateTime.now().year.toString(),
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            Positioned(
              top: inMainMenu ? (size.height / 3.8) : 0,
              left: 16,
              child: Container(
                width: size.width - 32,
                height: size.height / (inMainMenu ? 1.7 : 1.2),
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
                          setState(() {
                            view = ListView.separated(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              itemBuilder: (context, index) {
                                return AboutWidget(
                                  useEnglish: useEnglish,
                                );
                              },
                              itemCount: 1,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 4,
                                );
                              },
                            );
                          });
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
    );
  }

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
        var filteredList = getTasks(conferencias)
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
      });
    }
  }
}
