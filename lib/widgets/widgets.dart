import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class ScheduleWidget extends StatelessWidget {
  final Task task;

  const ScheduleWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        minLeadingWidth: 2,
        leading: Container(
          width: 2,
          color: const Color(0xff2da9ef),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            task.taskName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          "${DateFormat('dd/MM\nhh:mm a').format(task.taskTime)}\n${DateFormat("hh:mm a").format(task.taskTimeEnd)}",
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class PersonaInfoWidget extends StatelessWidget {
  final PersonaInfo info;
  final bool useEnglish;

  const PersonaInfoWidget({
    Key? key,
    required this.info,
    required this.useEnglish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shadowColor: const Color(0xff2da9ef),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage:
                ExactAssetImage('assets/images/profile/${info.image}'),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              info.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(
            useEnglish ? info.descriptionEng : info.description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            // textAlign: TextAlign.justify,
          ),
        ));
  }
}

class AboutWidget extends StatelessWidget {
  final bool useEnglish;

  const AboutWidget({
    Key? key,
    required this.useEnglish,
  }) : super(key: key);

  final String infoEs =
  '''El Congreso Internacional de Telemática y Telecomunicaciones (CITTEL) es un evento desarrollado por la Facultad de Ingeniería en Telecomunicaciones y Electrónica. Está dirigido a especialistas, funcionarios, científicos y estudiantes de la comunidad nacional e internacional interesados en el análisis y propuestas de soluciones de problemas actuales relacionados con la telemática, las telecomunicaciones y disciplinas afines.\n\nPuede interactuar con el Comité Organizador en la dirección de correo: cittel@tele.cujae.edu.cu.\n\nLa convocatoria está disponible en https://ccia.cujae.edu.cu/index.php/cittel/index''';

  final String infoEn =
  '''The International Congress on Telematics and Telecommunications (CITTEL) is an event developed by the School of Telecommunications and Electronics Engineering. It is aimed at specialists, officials, scientists and students from the national and international community interested in analyzing and proposing solutions to current problems related to telematics, telecommunications and related disciplines. You can interact with the Organizing Committee at the following e-mail address: cittel@tele.cujae.edu.cu. The call for papers is available at https://ccia.cujae.edu.cu/index.php/cittel/index.''';

  @override
  Widget build(BuildContext context) {
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
            useEnglish ? infoEn : infoEs,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            // textAlign: TextAlign.justify,
          ),
        ));
  }
}

class CreditsWidget extends StatelessWidget {
  final bool useEnglish;

  const CreditsWidget({
    Key? key,
    required this.useEnglish,
  }) : super(key: key);

  final String infoEs = 'Hecho en la CUJAE\n\nVersion 1.0';

  final String infoEn = 'Made at CUJAE\n\nVersion 1.0';

  @override
  Widget build(BuildContext context) {
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
              'Credits',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(
            useEnglish ? infoEn : infoEs,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            // textAlign: TextAlign.justify,
          ),
        ));
  }
}
