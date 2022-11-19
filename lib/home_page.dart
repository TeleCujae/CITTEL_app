import 'dart:convert';

import 'package:cittel_app/models/models.dart';
import 'package:cittel_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum CurrentPage {
  home,
  committee,
  program,
  conferences,
  workshops,
  lecturers,
  sponsors,
  about
}

class _HomePageState extends State<HomePage> {
  CurrentPage page = CurrentPage.home;
  bool useEnglish = false;

  DateTime? filter;

  late final Map<String, dynamic> lecturers;
  late final Map<String, dynamic> organizingCommittee;
  late final List<dynamic> fullProgram;

  dynamic loadJson(String path) async {
    String data = await rootBundle.loadString(path);
    return json.decode(data);
  }

  List<Event> getEvents(List<dynamic> data) {
    List<Event> tasks = [];

    for (var e in data) {
      tasks.add(
        Event(
          useEnglish ? e["title"]["en"] : e["title"]["es"],
          e['author'],
          DateTime(
            e['year'],
            e['month'],
            e['day'],
            e['hour_from'],
            e['min_from'],
          ),
          DateTime(
            e['year'],
            e['month'],
            e['day'],
            e['hour_to'],
            e['min_to'],
          ),
          e['type'],
        ),
      );
    }

    return tasks;
  }

  List<Lecturer> getLecturers(Map<String, dynamic> data) {
    List<Lecturer> infos = [];

    for (var e in data.entries) {
      infos.add(
        Lecturer(
          e.key,
          useEnglish ? e.value['details']['en'] : e.value['details']['es'],
          e.value['image'],
        ),
      );
    }

    return infos;
  }

  List<Organizer> getOrganizers(Map<String, dynamic> data) {
    List<Organizer> organizers = [];

    for (var e in data.entries) {
      organizers.add(
        Organizer(
          e.key,
          useEnglish ? e.value['title']['en'] : e.value['title']['es'],
        ),
      );
    }

    return organizers;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      lecturers = await loadJson('assets/json/lecturers.json');
      organizingCommittee =
          await loadJson('assets/json/organizing_committee.json');
      fullProgram = await loadJson('assets/json/full_program.json');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    AppBar appBar = AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 30,
            image: AssetImage(
              'assets/images/header.png',
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
    Drawer drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage('assets/images/header.png'),
                scale: 20,
              ),
            ),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(useEnglish ? 'Home' : 'Inicio'),
            onTap: () {
              setState(() {
                page = CurrentPage.home;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_tree),
            title: Text(
              useEnglish ? 'Organizing Committee' : 'Comité Organizativo',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.committee;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: Text(
              useEnglish ? 'Scientific Programs' : 'Programa científico',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.program;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.airplay),
            title: Text(
              useEnglish ? 'Master Conferences' : 'Conferencias Magistrales',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.conferences;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.architecture),
            title: Text(
              useEnglish ? 'Courses and workshops' : 'Cursos y Talleres',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.workshops;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(
              useEnglish ? 'Lecturers' : 'Conferencistas',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.lecturers;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: Text(
              useEnglish ? 'Sponsors' : 'Patrocinadores',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.sponsors;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              useEnglish ? 'About' : 'Acerca de',
            ),
            onTap: () {
              setState(() {
                page = CurrentPage.about;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    List<Widget> bodyChildren = [];

    switch (page) {
      case CurrentPage.home:
        bodyChildren = [
          Positioned(
            child: Container(
              width: size.width,
              height: size.height / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/splash.png'),
                  scale: 25,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height / 4.3,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 8,
                      shadowColor: const Color(0xff2da9ef),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        title: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'CITTEL',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          useEnglish
                              ? '''The International Congress on Telematics and Telecommunications (CITTEL) is an event developed by the School of Telecommunications and Electronics Engineering. It is aimed at specialists, officials, scientists and students from the national and international community interested in analyzing and proposing solutions to current problems related to telematics, telecommunications and related disciplines.\n\nYou can interact with the Organizing Committee at the following e-mail address: cittel@tele.cujae.edu.cu.\n\nThe call for papers is available at https://ccia.cujae.edu.cu/index.php/cittel/index.'''
                              : '''El Congreso Internacional de Telemática y Telecomunicaciones (CITTEL) es un evento desarrollado por la Facultad de Ingeniería en Telecomunicaciones y Electrónica. Está dirigido a especialistas, funcionarios, científicos y estudiantes de la comunidad nacional e internacional interesados en el análisis y propuestas de soluciones de problemas actuales relacionados con la telemática, las telecomunicaciones y disciplinas afines.\n\nPuede interactuar con el Comité Organizador en la dirección de correo: cittel@tele.cujae.edu.cu.\n\nLa convocatoria está disponible en https://ccia.cujae.edu.cu/index.php/cittel/index''',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                    );
                  },
                  itemCount: 1,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 20,
            left: 6.7 * size.width / 8,
            child: SizedBox(
              width: size.width / 6,
              height: size.height / 20,
              child: ElevatedButton(
                onPressed: () {
                  useEnglish = !useEnglish;
                  setState(() {});
                },
                child: Text(useEnglish ? 'esp' : 'eng'),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.committee:
        var organizers = getOrganizers(organizingCommittee);

        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.11,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return OrganizerWidget(organizer: organizers[index]);
                  },
                  itemCount: organizers.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.program:
        var program = getEvents(fullProgram)
            .where((e) =>
                filter == null ||
                (e.startTime.day == filter?.day &&
                    e.startTime.month == filter?.month))
            .toList();

        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return EventWidget(task: program[index]);
                  },
                  itemCount: program.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 27 * size.height / 32,
            left: size.width / 4,
            child: SizedBox(
              width: size.width / 2,
              height: size.height / 20,
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(useEnglish ? "Filter" : "Filtrar"),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.conferences:
        var program = getEvents(fullProgram)
            .where((e) =>
                (filter == null ||
                    (e.startTime.day == filter?.day &&
                        e.startTime.month == filter?.month)) &&
                e.type == 'master')
            .toList();

        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return EventWidget(task: program[index]);
                  },
                  itemCount: program.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 27 * size.height / 32,
            left: size.width / 4,
            child: SizedBox(
              width: size.width / 2,
              height: size.height / 20,
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(useEnglish ? "Filter" : "Filtrar"),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.workshops:
        var program = getEvents(fullProgram)
            .where((e) =>
                (filter == null ||
                    (e.startTime.day == filter?.day &&
                        e.startTime.month == filter?.month)) &&
                (e.type == 'workshop' || e.type == 'course'))
            .toList();

        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return EventWidget(task: program[index]);
                  },
                  itemCount: program.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 27 * size.height / 32,
            left: size.width / 4,
            child: SizedBox(
              width: size.width / 2,
              height: size.height / 20,
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(useEnglish ? "Filter" : "Filtrar"),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.lecturers:
        var speakers = getLecturers(lecturers);

        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.105,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return LecturerWidget(
                      info: speakers[index],
                    );
                  },
                  itemCount: speakers.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.sponsors:
        bodyChildren = [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: size.height,
              width: size.width - 10,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: ExactAssetImage('assets/images/sponsors.png'),
                ),
              ),
            ),
          ),
        ];
        break;

      case CurrentPage.about:
        bodyChildren = [
          Positioned(
            child: Container(
              width: size.width,
              height: size.height / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/splash.png'),
                  scale: 25,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 4.3,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height / 1.45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 8,
                      shadowColor: const Color(0xff2da9ef),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        title: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'CITTEL APP',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        subtitle: Text(
                          useEnglish ? 'Made by the Department of TI at the Faculty of Telecommunications and Electronics Engineering of CUJAE.\n\nJulio Cesar Galindo Hevia\nDeveloper\n\nEng. Ariel Baloira Reyes\nEng. Annia L. Barbán Acea\nDesign and collaboration\n\n\nContact us for suggestions\n\nhttps://teleportal.cujae.edu.cu' : 'Realizado por el Dpto. de Informática de la Facultad de Ingeniería en Telecomunicaciones y Electrónica de la CUJAE.\n\nJulio Cesar Galindo Hevia\nDesarrollador\n\nIng. Ariel Baloira Reyes\nIng. Annia L. Barbán Acea\nDiseño y colaboración\n\n\nPóngase en contacto con nosotros para sugerencias\n\nhttps://teleportal.cujae.edu.cu',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                    );
                  },
                  itemCount: 1,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ),
        ];
        break;
    }

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: bodyChildren,
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );

    if (selected != filter) {
      setState(() {
        filter = selected;
      });
    }
  }
}
