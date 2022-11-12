class Task {
  final String taskName;
  final String description;
  final DateTime taskTime;

  Task(
    this.taskName,
    this.description,
    this.taskTime,
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

List<Task> scheduleList = [
  Task(
    'Title pending',
    'Dr. Alain Abel Garófalo Hernández',
    DateTime(2022, 9, 26, 7, 30),
  ),
  Task(
    'Title pending',
    'Dr. Falko Dressler',
    DateTime(2022, 9, 26, 7, 30),
  ),
  Task(
    'Title pending',
    'Dra. Carla Fabiana Chiasserini',
    DateTime(2022, 9, 29, 7, 30),
  ),
];

List<PersonaInfo> personaInfoList = [
  PersonaInfo(
      'Dr. Alain Abel Garófalo Hernández',
      '''Alain Abel Garófalo Hernández es Ingeniero en Telecomunicaciones y Electrónica, Master en Telemática y Doctor en Ciencias Técnicas. Tiene amplia experiencia en el la Educación Superior donde, además de impartir clases en pregrado y posgrado y tutorar trabajos de diplomas, tesis de maestría y doctorado, fue jefe de Departamento, coordinador de la maestría de Telemática, miembro de la sección de Ciencias Técnicas de la Comisión Nacional de Grados Científicos y vicepresidente de la Comisión Nacional de la Carrera de Telecomunicaciones y Electrónica.\nSu actividad investigativa fundamental se desarrolla en las áreas de: gestión de configuración, contabilidad y desempeño en redes IP; la utilización del software libre en las telecomunicaciones; el diseño de equipos y soluciones para redes empresariales basadas en commodity hardware y software libre; y el diseño de centros de datos bajo el paradigma de computación en la nube (IaaS).\nTambién es muy destacado su trabajo en la gestión de la Red CUJAE de la que es fundador, siendo el principal desarrollador de los servicios de telecomunicaciones que en ella aún se prestan. Su entrega dedicada a esta tarea, así como su participación en la formación del personal técnico requerido, en la solución a complejos y disimiles problemas y como asesor, ha permitido el funcionamiento adecuado de esta red durante muchos años. En la actualidad es profesor adjunto de la Cujae y jefe de la MiPyme tecnológica Avangenio.''',
      '''Alain Abel Garófalo Hernández received his M.SC. and Ph.D. degrees of the Faculty of Telecommunications and Electronic of the Technological University of Havana José Antonio Echeverría, CUJAE. With a vast experience in higher education, he has been teaching in undergraduate and postgraduate programs, being tutor in both modalities. He was head of the Telecommunications Department, coordinator of the Telematics Master's Program, a member of the National Commission of Scientific Titles and Vice President of the National Commission of the career of Telecommunications and Electronic.\nIts research objectives include: configuration, accounting and performance management in IP networks; use of free telecommunications software; design of equipment and solutions for commercial networks based on Commodity Hardware and free software; and the design of data centers under the Cloud computing paradigm (IaaS). Founder of the CUJAE Campus Network, being one of the main developers of the services offered within it. His dedication to the university, his participation in the training of IT staff and his advice in solving complex problems has allowed the proper functioning of network services for many years. Currently, he is a professor at CUJAE as well as head of the technological MSME Avangenio.''',
      'alain.png'),
  PersonaInfo(
      'Dr. Falko Dressler',
      '''Falko Dressler es Profesor Titular y Director de Redes de Telecomunicaciones en la Escuela de Ingeniería Eléctrica e Informática de la Universidad Técnica de Berlín. Recibió los grados de M.Sc. y Ph.D. del Departamento de Ciencias de la Computación de la Universidad de Erlangen en 1998 y 2003, respectivamente. Ha sido editor en jefe asociado de la IEEE Trans. en Computación Móvil y Comunicaciones Informáticas de Elsevier, así como editor de revistas de alto nivel científico como IEEE/ACM Trans. en Redes, IEEE Trans. en Ciencia e Ingeniería de Redes, Redes Ad Hoc de Elsevier y Redes de Comunicación Nano de Elsevier. Ha dirigido conferencias como IEEE Infocom, ACM Mobisys, ACM Mobihoc, IEEE VNC y IEEE Globecom. Es autor de los libros de texto “Autoorganización en Redes de Sensores y Actores” publicado por Wiley & Sons y “Redes Vehiculares” publicado por la Cambridge University Press. Miembro, profesor y orador distinguido de la IEEE y ACM. Es miembro de la Academia Nacional de Ciencia e Ingeniería Alemana (ACATECH). Fue miembro del consejo de la conferencia IEEE COMSOC y del Comité Ejecutivo de ACM SIGMOBILE. Sus líneas de investigación incluyen las redes inalámbricas adaptativas (sub-6GHz, mmWave, luz visible, comunicación molecular) y la detección inalámbrica con aplicaciones en redes Ad Hoc y de sensores, Internet de las cosas y sistemas ciber-físicos.''',
      '''Falko Dressler is full professor and Chair for Telecommunication Networks at the School of Electrical Engineering and Computer Science, TU Berlin. He received his M.Sc. and Ph.D. degrees from the Dept. of Computer Science, University of Erlangen in 1998 and 2003, respectively. Dr. Dressler has been associated editor-in-chief for IEEE Trans. on Mobile Computing and Elsevier Computer Communications as well as an editor for journals such as IEEE/ACM Trans. on Networking, IEEE Trans. on Network Science and Engineering, Elsevier Ad Hoc Networks, and Elsevier Nano Communication Networks. He has been chairing conferences such as IEEE INFOCOM, ACM MobiSys, ACM MobiHoc, IEEE VNC, IEEE GLOBECOM. He authored the textbooks Self-Organization in Sensor and Actor Networks published by Wiley & Sons and Vehicular Networking published by Cambridge University Press. He is an IEEE Fellow an IEEE Distinguished Lecturer. Also he is an ACM Distinguished Member and Distinguished Speaker. He is a member of the German National Academy of Science and Engineering (acatech). He has been serving on the IEEE COMSOC Conference Council and the ACM SIGMOBILE Executive Committee. His research objectives include adaptive wireless networking (sub-6GHz, mmWave, visible light, molecular communication) and wireless-based sensing with applications in ad hoc and sensor networks, the Internet of Things, and Cyber-Physical Systems.''',
      'falko.png'),
  PersonaInfo(
      'Dra. Carla Fabiana Chiasserini',
      '''Profesora titular en el Politécnico de Torino e investigadora asociada del Consejo Nacional de Investigación (CNR) en Italia. Fue investigadora visitante en la Universidad de California en San Diego (1998-2003), profesora visitante en la Universidad de Monash en Australia (2012,2016) y en la Universidad Técnica de Berlín (TU) en 2021 y 2022. Es miembro de la IEEE y miembro Sénior de la ACM. Sus ramas de investigación incluyen las redes 5G/6G, la Computación en el borde móvil (MEC, Mobile Edge Computing), así como las redes para Aprendizaje Automático y vehículos conectados. Ha publicado más de 350 artículos de revistas y artículos de conferencias referidos, y recibido varios premios por su trabajo científico. Actualmente, se desempeña como editora en jefe de la revista Computer Communications y editora general de IEEE/ACM Transactions on Networking. Carla también es miembro del Comité Directivo de IEEE Transactions on Network Science and Engineering y de la conferencia ACM MobiHoc. Ha trabajado por varios años en el consejo editorial de revistas como IEEE Transactions on Wireless Networks e IEEE Transactions on Mobile Computing. Ha sido Co-editora invitada de varios números especiales de revistas cinetíficas. Además, se ha desempeñado como coordinadora en muchos proyectos de investigación nacionales e internacionales.''',
      '''Carla Fabiana Chiasserini is Full Professor at Politecnico di Torino, Italy, and a Research Associate with the Italian National Research Council (CNR). She was a Visiting Researcher at UC San Diego (1998-2003), and a Visiting Professor at Monash University (2012,2016) and at the Berlin Technische Universität (2021 and 2022). She is a Fellow of the IEEE and a Senior Member of ACM. Her research interests include 5G/6G Networks, Mobile Edge Computing, Networking for machine learning, and Connected Vehicles. She has published over 350 journal articles and referred conference papers, and has received several awards for her scientific work. Currently, she serves as Editor-in-Chief of the Computer Communications journal and as an Editor-at-Large of the IEEE/ACM Transactions on Networking. Carla is also a member of the Steering Committee of the IEEE Transactions on Network Science and Engineering and of the ACM MobiHoc conference. She has served for several years on the Editorial Board of journals such as the IEEE Transactions on Wireless Networks and the IEEE Transactions on Mobile Computing, and she has been Co-Guest Editor of a number of journal special issues. Carla is/has been involved in many national and international research projects, either as a coordinator or a PI.''',
      'fabiana.png'),
];

List<PersonaInfo> aboutUs = [
  PersonaInfo(
      'CITTEL',
      '''El Congreso Internacional de Telemática y Telecomunicaciones (CITTEL) es un evento desarrollado por la Facultad de Ingeniería en Telecomunicaciones y Electrónica. Está dirigido a especialistas, funcionarios, científicos y estudiantes de la comunidad nacional e internacional interesados en el análisis y propuestas de soluciones de problemas actuales relacionados con la telemática, las telecomunicaciones y disciplinas afines.\n\nPuede interactuar con el Comité Organizador en la dirección de correo: cittel@tele.cujae.edu.cu.\n\nLa convocatoria está disponible en https://ccia.cujae.edu.cu/index.php/cittel/index''',
      '''The International Congress on Telematics and Telecommunications (CITTEL) is an event developed by the School of Telecommunications and Electronics Engineering. It is aimed at specialists, officials, scientists and students from the national and international community interested in analyzing and proposing solutions to current problems related to telematics, telecommunications and related disciplines. You can interact with the Organizing Committee at the following e-mail address: cittel@tele.cujae.edu.cu. The call for papers is available at https://ccia.cujae.edu.cu/index.php/cittel/index.''',
      'logo.png'),
];
