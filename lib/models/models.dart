class Task {
  final String taskName;
  final String description;
  final DateTime taskTime;
  final DateTime taskTimeEnd;
  final String type;

  Task(
    this.taskName,
    this.description,
    this.taskTime,
    this.taskTimeEnd,
    this.type,
  );
}

class PersonaInfo {
  final String name;
  final String description;
  final String descriptionEng;
  final String image;

  PersonaInfo(
    this.name,
    this.description,
    this.descriptionEng,
    this.image,
  );
}

List<PersonaInfo> aboutUs = [
  PersonaInfo(
      'CITTEL',
      '''El Congreso Internacional de Telemática y Telecomunicaciones (CITTEL) es un evento desarrollado por la Facultad de Ingeniería en Telecomunicaciones y Electrónica. Está dirigido a especialistas, funcionarios, científicos y estudiantes de la comunidad nacional e internacional interesados en el análisis y propuestas de soluciones de problemas actuales relacionados con la telemática, las telecomunicaciones y disciplinas afines.\n\nPuede interactuar con el Comité Organizador en la dirección de correo: cittel@tele.cujae.edu.cu.\n\nLa convocatoria está disponible en https://ccia.cujae.edu.cu/index.php/cittel/index''',
      '''The International Congress on Telematics and Telecommunications (CITTEL) is an event developed by the School of Telecommunications and Electronics Engineering. It is aimed at specialists, officials, scientists and students from the national and international community interested in analyzing and proposing solutions to current problems related to telematics, telecommunications and related disciplines. You can interact with the Organizing Committee at the following e-mail address: cittel@tele.cujae.edu.cu. The call for papers is available at https://ccia.cujae.edu.cu/index.php/cittel/index.''',
      'logo.png'),
];
