import 'package:sqflite/sqflite.dart';

class FunFactsDataset {
  static Future<void> insertInitialData(Database db) async {

    await _addUsers(db);


    await _addAnimals(db);


    await _addFavoriteAnimals(db);


  }

  static Future<void> _addUsers(Database db) async {
    List<Map<String, dynamic>> users = [
      {
        'userID': 'admin001',
        'name': 'Admin',
        'lastName': 'User',
        'email': 'admin@animals.com',
        'password':
            'adminPass123' 
      },
      {
        'userID': 'test001',
        'name': 'Test',
        'lastName': 'User',
        'email': 'test@animals.com',
        'password': 'testPass123'
      }
    ];

    for (var user in users) {
      await db.insert('user', user);
    }
  }

  static Future<void> _addAnimals(Database db) async {
    List<Map<String, dynamic>> animals = [
      {'animalName': 'Perro', 'animalEmoji': '🐶'},
      {'animalName': 'Gato', 'animalEmoji': '🐱'},
      {'animalName': 'Pájaro', 'animalEmoji': '🐦'},
      {'animalName': 'Caballos', 'animalEmoji': '🐎'},
      {'animalName': 'León', 'animalEmoji': '🦁'},
      {'animalName': 'Elefante', 'animalEmoji': '🐘'},
      {'animalName': 'Delfín', 'animalEmoji': '🐬'},
      {'animalName': 'Jirafa', 'animalEmoji': '🦒'},
      {'animalName': 'Tigre', 'animalEmoji': '🐅'},
      {'animalName': 'Cocodrilo', 'animalEmoji': '🐊'},
      {'animalName': 'Oso', 'animalEmoji': '🐻'},
      {'animalName': 'Águila', 'animalEmoji': '🦅'},
      {'animalName': 'Mariposa', 'animalEmoji': '🦋'},
      {'animalName': 'Serpiente', 'animalEmoji': '🐍'},
      {'animalName': 'Mapache', 'animalEmoji': '🦝'},
    ];

    for (var animal in animals) {
      int animalID = await db.insert('animals', animal);
      await _addFunFactsForAnimal(db, animalID, animal['animalName']);
    }
  }

  static Future<void> _addFunFactsForAnimal(
      Database db, int animalID, String animalName) async {
    List<Map<String, dynamic>> funFacts = [];

    switch (animalName) {
      case 'Perro':
        funFacts = [
          {
            'funFact':
                'Los perros han sido domesticados por humanos desde hace al menos 15,000 años.'
          },
          {
            'funFact':
                'Se estima que hay más de 340 razas de perros reconocidas en todo el mundo.'
          },
          {
            'funFact':
                'El perro más grande registrado fue un mastín inglés que pesaba 155 kg.'
          },
          {
            'funFact':
                'El perro más pequeño registrado fue un chihuahua que medía solo 9.65 cm de alto.'
          },
          {
            'funFact':
                'Los perros tienen más de 200 millones de células olfativas en sus narices, lo que les permite tener un sentido del olfato excepcionalmente agudo.'
          },
          {
            'funFact':
                'El sentido del olfato de un perro es entre 10,000 y 100,000 veces más agudo que el de los humanos.'
          },
          {
            'funFact':
                'Los perros tienen una capa de células reflectoras llamadas "tapetum lucidum" en la parte posterior de sus ojos, que mejora su visión nocturna.'
          },
          {
            'funFact':
                'El perro más inteligente registrado es el border collie, seguido por el caniche y el pastor alemán.'
          },
          {
            'funFact':
                'Los perros pueden aprender más de 100 palabras y comandos diferentes.'
          },
          {
            'funFact':
                'Los perros pueden reconocer expresiones faciales humanas y pueden interpretar el estado de ánimo de las personas.'
          },
          {
            'funFact':
                'Los perros tienen una frecuencia cardíaca de reposo entre 60 y 140 latidos por minuto, dependiendo del tamaño y la raza.'
          },
          {
            'funFact':
                'La temperatura corporal normal de un perro oscila entre 38°C y 39°C.'
          },
          {
            'funFact':
                'Los perros tienen orejas móviles que pueden girar y mover para captar sonidos de diferentes direcciones.'
          },
          {
            'funFact':
                'El ladrido de un perro puede tener diferentes tonos y significados, que van desde la alerta hasta la ansiedad o la alegría.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad de oído muy sensible y pueden escuchar sonidos a frecuencias mucho más altas que los humanos.'
          },
          {
            'funFact':
                'Los perros tienen tres párpados en cada ojo: uno superior, uno inferior y uno nictitante que protege la córnea.'
          },
          {
            'funFact':
                'La cola de un perro se utiliza para comunicar emociones, como la felicidad, el miedo o la sumisión.'
          },
          {
            'funFact':
                'Los perros sudan a través de sus patas y regulan su temperatura corporal principalmente a través de la respiración.'
          },
          {
            'funFact':
                'Los perros tienen alrededor de 1,700 papilas gustativas en la boca, en comparación con las 9,000 que tienen los humanos.'
          },
          {
            'funFact':
                'Los perros pueden sentir el miedo y la ansiedad en las personas a través del olor y las señales corporales.'
          },
          {
            'funFact':
                'Los perros son capaces de experimentar emociones como el amor, la felicidad, la tristeza y el miedo.'
          },
          {
            'funFact':
                'Los perros son excelentes nadadores y muchas razas disfrutan de actividades acuáticas como nadar y recuperar objetos del agua.'
          },
          {
            'funFact':
                'Los perros tienen una estructura social jerárquica y establecen roles de dominancia y sumisión dentro de su grupo.'
          },
          {
            'funFact':
                'Los perros pueden experimentar estrés y ansiedad cuando se separan de sus dueños durante largos períodos.'
          },
          {
            'funFact':
                'Los perros tienen una memoria a largo plazo y pueden recordar eventos y experiencias pasadas.'
          },
          {
            'funFact':
                'Los perros pueden sufrir de problemas de salud mental, como la depresión y la ansiedad, especialmente después de experiencias traumáticas.'
          },
          {
            'funFact':
                'Los perros pueden aprender a asociar ciertos sonidos con actividades específicas, como el sonido de las llaves con un paseo en automóvil.'
          },
          {
            'funFact':
                'Los perros pueden detectar cambios en el estado de ánimo y la salud de sus dueños a través del olfato y el comportamiento.'
          },
          {
            'funFact':
                'Los perros tienen una habilidad natural para leer el lenguaje corporal humano y pueden interpretar las señales visuales y verbales de sus dueños.'
          },
          {
            'funFact':
                'Los perros pueden ser entrenados para realizar una variedad de tareas, incluyendo la detección de drogas, búsqueda y rescate, y terapia asistida con animales.'
          },
          {
            'funFact':
                'Los perros tienen una excelente capacidad de orientación y pueden encontrar su camino a casa incluso cuando se pierden en áreas desconocidas.'
          },
          {
            'funFact':
                'Los perros pueden sentir cambios en el clima y pueden detectar tormentas eléctricas y otros fenómenos meteorológicos.'
          },
          {
            'funFact':
                'Los perros tienen una relación simbiótica con los humanos y han sido compañeros de trabajo y de vida durante milenios.'
          },
          {
            'funFact':
                'Los perros pueden experimentar sueños y pueden mover las patas y hacer ruidos mientras duermen.'
          },
          {
            'funFact':
                'Los perros pueden adaptarse a una variedad de entornos y condiciones climáticas, desde climas árticos hasta desiertos cálidos.'
          },
          {
            'funFact':
                'Los perros tienen una estructura de huesos flexible que les permite correr y saltar con agilidad.'
          },
          {
            'funFact':
                'Los perros tienen una vista en color limitada y ven principalmente en tonos de azul, amarillo y gris.'
          },
          {
            'funFact':
                'Los perros tienen un sentido del equilibrio excepcional y pueden moverse con facilidad en terrenos irregulares y difíciles.'
          },
          {
            'funFact':
                'Los perros tienen una habilidad natural para cazar y rastrear presas utilizando su sentido del olfato y su agudeza visual.'
          },
          {
            'funFact':
                'Los perros tienen una esperanza de vida que varía según la raza y el tamaño, pero en general, viven entre 10 y 15 años.'
          },
          {
            'funFact':
                'Los perros pueden aprender comportamientos nuevos a cualquier edad, pero tienden a ser más receptivos al entrenamiento cuando son jóvenes.'
          },
          {
            'funFact':
                'Los perros pueden comunicarse entre sí mediante ladridos, gruñidos, aullidos y otros sonidos vocales.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad de aprendizaje social y pueden imitar comportamientos observados en otros perros y humanos.'
          },
          {
            'funFact':
                'Los perros tienen una estructura cerebral similar a la de los humanos y comparten muchas características cognitivas y emocionales con los humanos.'
          },
          {
            'funFact':
                'Los perros pueden ser entrenados para reconocer y responder a señales de peligro, como el humo de un incendio o el olor a gas.'
          },
          {
            'funFact':
                'Los perros pueden sufrir de enfermedades mentales, como el trastorno de ansiedad por separación, la fobia a los ruidos fuertes y la agresión territorial.'
          },
          {
            'funFact':
                'Los perros son excelentes compañeros para personas con necesidades especiales, como discapacidades físicas o trastornos de salud mental.'
          },
          {
            'funFact':
                'Los perros pueden ser entrenados para detectar enfermedades y condiciones médicas en humanos, como la diabetes, el cáncer y las convulsiones.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad de aprendizaje rápida y pueden responder a entrenamientos básicos en cuestión de semanas.'
          },
          {
            'funFact':
                'Los perros tienen una variedad de expresiones faciales que utilizan para comunicar emociones, incluyendo alegría, miedo, tristeza y frustración.'
          },
          {
            'funFact':
                'Los perros pueden aprender a asociar ciertos comportamientos con recompensas, como recibir golosinas o elogios de sus dueños.'
          },
          {
            'funFact':
                'Los perros tienen una habilidad natural para proteger a sus dueños y su hogar y pueden actuar como guardianes eficaces.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad de atención limitada y pueden distraerse fácilmente por estímulos externos como sonidos fuertes o movimientos repentinos.'
          },
          {
            'funFact':
                'Los perros tienen una relación única con sus dueños y pueden formar vínculos emocionales fuertes que duran toda la vida.'
          },
          {
            'funFact':
                'Los perros tienen una habilidad natural para interpretar el tono de voz y las expresiones faciales humanas y pueden responder en consecuencia.'
          },
          {
            'funFact':
                'Los perros tienen una memoria a largo plazo que les permite recordar eventos y experiencias pasadas durante muchos años.'
          },
          {
            'funFact':
                'Los perros pueden sentir y responder a las emociones humanas y pueden actuar como apoyo emocional para personas que sufren de ansiedad, depresión u otras condiciones de salud mental.'
          },
          {
            'funFact':
                'Los perros pueden ser entrenados para realizar una variedad de tareas útiles en el hogar, como abrir puertas, encender luces y recuperar objetos.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad de aprendizaje continua y pueden seguir aprendiendo y desarrollando nuevas habilidades a lo largo de sus vidas.'
          },
          {
            'funFact':
                'Los perros tienen una capacidad natural para adaptarse a una variedad de entornos y situaciones y pueden prosperar en una amplia gama de condiciones de vida.'
          },
        ];
        break;
      case 'Gato':
        funFacts = [
          {
            'funFact':
                'Los gatos han sido domesticados por humanos desde hace al menos 9,000 años.'
          },
          {
            'funFact':
                'Se estima que hay más de 70 razas de gatos domésticos reconocidas en todo el mundo.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura ósea flexible que les permite girar y doblar sus cuerpos en posiciones increíbles.'
          },
          {
            'funFact':
                'Los gatos tienen una vista nocturna excepcionalmente aguda y pueden ver con poca luz mejor que los humanos.'
          },
          {
            'funFact':
                'Los gatos tienen una capa de células reflectoras llamada "tapetum lucidum" en la parte posterior de sus ojos, que mejora su visión nocturna.'
          },
          {
            'funFact':
                'Los gatos tienen orejas móviles que pueden girar hasta 180 grados para captar sonidos de diferentes direcciones.'
          },
          {
            'funFact':
                'La nariz de un gato tiene un patrón único, similar a una huella digital humana.'
          },
          {
            'funFact':
                'Los gatos tienen almohadillas en las patas que les ayudan a caminar en superficies resbaladizas y a amortiguar sus pasos.'
          },
          {
            'funFact':
                'Los gatos tienen más de 100 sonidos vocales diferentes, incluyendo maullidos, ronroneos, gruñidos y chirridos.'
          },
          {
            'funFact':
                'Los gatos tienen una capa de pelo que actúa como aislante térmico, lo que les ayuda a mantenerse calientes en climas fríos.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para cazar presas y son excelentes cazadores de roedores y otros pequeños animales.'
          },
          {
            'funFact':
                'Los gatos tienen una memoria a largo plazo que les permite recordar eventos y experiencias pasadas durante mucho tiempo.'
          },
          {
            'funFact':
                'Los gatos tienen una esperanza de vida que varía según la raza y el estilo de vida, pero en general, viven entre 12 y 20 años.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura social flexible y pueden vivir solos o en grupos con otros gatos.'
          },
          {
            'funFact':
                'Los gatos tienen una capacidad de salto excepcional y pueden saltar hasta seis veces su longitud corporal en un solo salto.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para equilibrarse en superficies estrechas y altas, gracias a su cola y a su sistema vestibular.'
          },
          {
            'funFact':
                'Los gatos tienen una dieta carnívora y necesitan proteínas animales para mantenerse saludables.'
          },
          {
            'funFact':
                'Los gatos tienen una lengua áspera con pequeñas protuberancias llamadas papilas que les ayudan a limpiar su pelaje y a desgarrar la carne de sus presas.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para comunicarse con otros gatos y con humanos a través de señales visuales, vocales y táctiles.'
          },
          {
            'funFact':
                'Los gatos pueden sentir cambios en el clima y pueden detectar tormentas eléctricas y otros fenómenos meteorológicos.'
          },
          {
            'funFact':
                'Los gatos pueden aprender a asociar ciertos sonidos con actividades específicas, como el sonido de la lata de comida con la hora de la comida.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para cazar y rastrear presas utilizando su sentido del olfato y su agudeza visual.'
          },
          {
            'funFact':
                'Los gatos tienen una vista en color limitada y ven principalmente en tonos de azul y verde.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura social basada en la jerarquía y establecen roles de dominancia y sumisión dentro de su grupo.'
          },
          {
            'funFact':
                'Los gatos tienen una memoria espacial excepcional y pueden recordar la ubicación de objetos y lugares durante mucho tiempo.'
          },
          {
            'funFact':
                'Los gatos tienen una relación única con sus dueños y pueden formar vínculos emocionales fuertes que duran toda la vida.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para explorar y curiosear en su entorno, lo que les ayuda a mantenerse mentalmente estimulados.'
          },
          {
            'funFact':
                'Los gatos tienen una capacidad de atención limitada y pueden distraerse fácilmente por estímulos externos como movimientos repentinos o sonidos fuertes.'
          },
          {
            'funFact':
                'Los gatos pueden experimentar estrés y ansiedad cuando se enfrentan a cambios en su entorno o rutina.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para esconderse y camuflarse en su entorno, lo que les ayuda a evitar a los depredadores y a acechar a sus presas.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura cerebral similar a la de los humanos y comparten muchas características cognitivas y emocionales con los humanos.'
          },
          {
            'funFact':
                'Los gatos pueden sentir y responder a las emociones humanas y pueden actuar como apoyo emocional para personas que sufren de ansiedad, depresión u otras condiciones de salud mental.'
          },
          {
            'funFact':
                'Los gatos tienen una relación simbiótica con los humanos y han sido compañeros de trabajo y de vida durante miles de años.'
          },
          {
            'funFact':
                'Los gatos pueden ser entrenados para realizar una variedad de tareas útiles en el hogar, como abrir puertas, encender luces y recuperar objetos.'
          },
          {
            'funFact':
                'Los gatos pueden sufrir de problemas de salud mental, como el trastorno de ansiedad por separación, la fobia a los ruidos fuertes y la agresión territorial.'
          },
          {
            'funFact':
                'Los gatos tienen una capacidad de aprendizaje rápida y pueden responder a entrenamientos básicos en cuestión de semanas.'
          },
          {
            'funFact':
                'Los gatos pueden aprender a asociar ciertos comportamientos con recompensas, como recibir golosinas o elogios de sus dueños.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura de huesos flexible que les permite correr y saltar con agilidad.'
          },
          {
            'funFact':
                'Los gatos tienen una memoria a largo plazo que les permite recordar eventos y experiencias pasadas durante muchos años.'
          },
          {
            'funFact':
                'Los gatos pueden ser entrenados para detectar enfermedades y condiciones médicas en humanos, como la diabetes, el cáncer y las convulsiones.'
          },
          {
            'funFact':
                'Los gatos pueden aprender a reconocer y responder a señales de peligro, como el humo de un incendio o el olor a gas.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para proteger a sus dueños y su hogar y pueden actuar como guardianes eficaces.'
          },
          {
            'funFact':
                'Los gatos tienen una excelente capacidad de orientación y pueden encontrar su camino a casa incluso cuando se pierden en áreas desconocidas.'
          },
          {
            'funFact':
                'Los gatos pueden experimentar sueños y pueden mover las patas y hacer ruidos mientras duermen.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para comunicarse con otros gatos y con humanos a través de señales visuales, vocales y táctiles.'
          },
          {
            'funFact':
                'Los gatos pueden aprender a asociar ciertos sonidos con actividades específicas, como el sonido de la lata de comida con la hora de la comida.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para cazar y rastrear presas utilizando su sentido del olfato y su agudeza visual.'
          },
          {
            'funFact':
                'Los gatos tienen una estructura social basada en la jerarquía y establecen roles de dominancia y sumisión dentro de su grupo.'
          },
          {
            'funFact':
                'Los gatos pueden sentir cambios en el clima y pueden detectar tormentas eléctricas y otros fenómenos meteorológicos.'
          },
          {
            'funFact':
                'Los gatos tienen una vista en color limitada y ven principalmente en tonos de azul y verde.'
          },
          {
            'funFact':
                'Los gatos tienen una relación única con sus dueños y pueden formar vínculos emocionales fuertes que duran toda la vida.'
          },
          {
            'funFact':
                'Los gatos pueden experimentar estrés y ansiedad cuando se enfrentan a cambios en su entorno o rutina.'
          },
          {
            'funFact':
                'Los gatos tienen una habilidad natural para explorar y curiosear en su entorno, lo que les ayuda a mantenerse mentalmente estimulados.'
          },
          {
            'funFact':
                'Los gatos tienen una capacidad de atención limitada y pueden distraerse fácilmente por estímulos externos como movimientos repentinos o sonidos fuertes.'
          },
          {
            'funFact':
                'Los gatos pueden sentir y responder a las emociones humanas y pueden actuar como apoyo emocional para personas que sufren de ansiedad, depresión u otras condiciones de salud mental.'
          },
          {
            'funFact':
                'Los gatos tienen una relación simbiótica con los humanos y han sido compañeros de trabajo y de vida durante miles de años.'
          },
          {
            'funFact':
                'Los gatos pueden ser entrenados para realizar una variedad de tareas útiles en el hogar, como abrir puertas, encender luces y recuperar objetos.'
          },
          {
            'funFact':
                'Los gatos pueden sufrir de problemas de salud mental, como el trastorno de ansiedad por separación, la fobia a los ruidos fuertes y la agresión territorial.'
          },
          {
            'funFact':
                'Los gatos tienen una capacidad de aprendizaje rápida y pueden responder a entrenamientos básicos en cuestión de semanas.'
          },
          {
            'funFact':
                'Los gatos pueden aprender a asociar ciertos comportamientos con recompensas, como recibir golosinas o elogios de sus dueños.'
          },
        ];
        break;
      case 'Pájaro':
        funFacts = [
          {
            'funFact':
                'Los pájaros son un grupo diverso de animales vertebrados con plumas que incluye más de 10,000 especies en todo el mundo.'
          },
          {
            'funFact':
                'Las aves son los únicos animales que tienen plumas, lo que les permite volar y mantener una temperatura corporal constante.'
          },
          {
            'funFact':
                'El colibrí es el pájaro más pequeño del mundo, con algunas especies que pesan menos de 2 gramos.'
          },
          {
            'funFact':
                'El avestruz es el pájaro más grande del mundo, capaz de alcanzar alturas de hasta 2.7 metros y pesar más de 150 kg.'
          },
          {
            'funFact':
                'Los pingüinos son aves no voladoras que han evolucionado para nadar y bucear en lugar de volar.'
          },
          {
            'funFact':
                'El canto de los pájaros es una forma de comunicación que utilizan para atraer pareja, defender territorio y mantener contacto con otros miembros de su especie.'
          },
          {
            'funFact':
                'Algunas aves, como los loros y los cuervos, pueden imitar sonidos y voces humanas.'
          },
          {
            'funFact':
                'Los pájaros tienen huesos huecos que les permiten volar más fácilmente y reducir su peso corporal.'
          },
          {
            'funFact':
                'El albatros viajero tiene la envergadura más grande de cualquier ave, con algunas especies que alcanzan los 3.5 metros de envergadura.'
          },
          {
            'funFact':
                'Los pájaros tienen un sentido del equilibrio excepcional que les permite mantenerse estables en el aire y posarse en ramas y cables.'
          },
          {
            'funFact':
                'Los pájaros tienen una visión aguda y pueden ver colores que los humanos no pueden percibir.'
          },
          {
            'funFact':
                'Algunas aves migratorias viajan miles de kilómetros cada año entre sus áreas de reproducción y alimentación.'
          },
          {
            'funFact':
                'Los pájaros tienen un sistema respiratorio único que les permite extraer oxígeno del aire de manera más eficiente que los mamíferos.'
          },
          {
            'funFact':
                'Los nidos de los pájaros varían en forma y tamaño según la especie y pueden estar hechos de materiales como ramitas, barro, plumas y hierba.'
          },
          {
            'funFact':
                'Los pájaros tienen un sentido del olfato menos desarrollado que otros animales, pero aún así pueden detectar olores y sustancias químicas en el aire.'
          },
          {
            'funFact':
                'Algunas aves, como los flamencos, obtienen su coloración rosa de los pigmentos en los alimentos que consumen.'
          },
          {
            'funFact':
                'Los pájaros tienen una amplia variedad de dietas que incluyen insectos, semillas, frutas, peces, carroña y néctar.'
          },
          {
            'funFact':
                'Los pájaros tienen una capa de aceite en sus plumas que les ayuda a repeler el agua y mantenerse secos.'
          },
          {
            'funFact':
                'Los pájaros tienen un comportamiento social diverso que incluye la formación de parejas monógamas, bandadas migratorias y colonias de cría.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones únicas para volar, como alas largas y estrechas, cuerpos aerodinámicos y huesos huecos.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura de huesos única que les permite volar de manera eficiente y maniobrar en el aire.'
          },
          {
            'funFact':
                'Las aves rapaces, como los halcones y las águilas, tienen garras afiladas y picos curvos que utilizan para cazar presas.'
          },
          {
            'funFact':
                'Los pájaros migratorios pueden utilizar señales visuales, como el sol y las estrellas, así como señales magnéticas para orientarse durante sus viajes.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de técnicas de caza, que incluyen la caza en solitario, en grupo y la caza nocturna.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura vocal única que les permite producir una amplia variedad de sonidos, desde trinos melódicos hasta llamadas agudas y ruidos de percusión.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura cerebral altamente desarrollada que les permite aprender y recordar patrones y comportamientos complejos.'
          },
          {
            'funFact':
                'Las aves marinas, como los albatros y los petreles, pueden pasar meses en alta mar sin tocar tierra.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura ósea ligera que les permite volar largas distancias sin fatigarse.'
          },
          {
            'funFact':
                'Los pájaros migratorios pueden viajar a velocidades de hasta 50 km/h durante sus viajes migratorios.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de técnicas de cortejo que incluyen exhibiciones de plumaje, cantos y danzas.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de técnicas de defensa que incluyen el vuelo, el camuflaje, el ataque y la vocalización.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura muscular única que les permite mover las alas con rapidez y fuerza durante el vuelo.'
          },
          {
            'funFact':
                'Los pájaros tienen un sistema digestivo adaptado para procesar una variedad de alimentos, incluyendo una molleja muscular que les ayuda a triturar los alimentos.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de adaptaciones para mantenerse calientes en climas fríos, incluyendo plumaje denso y capas de grasa corporal.'
          },
          {
            'funFact':
                'Las aves urbanas, como las palomas y los gorriones, han desarrollado adaptaciones únicas para vivir en entornos urbanos.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para protegerse de los depredadores, como el camuflaje, el vuelo rápido y las llamadas de alarma.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de adaptaciones para la reproducción, que incluyen la formación de parejas monógamas, la construcción de nidos y la incubación de huevos.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura ósea hueca que les permite flotar en el agua y nadar con facilidad.'
          },
          {
            'funFact':
                'Las aves migratorias pueden recorrer miles de kilómetros durante sus viajes migratorios, utilizando una combinación de señales visuales, magnéticas y celestes para orientarse.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para el vuelo, incluyendo alas largas y estrechas, cuerpos aerodinámicos y huesos huecos.'
          },
          {
            'funFact':
                'Los pájaros tienen una amplia gama de técnicas de caza, que incluyen la caza en solitario, en grupo y la caza nocturna.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura vocal única que les permite producir una amplia variedad de sonidos, desde trinos melódicos hasta llamadas agudas y ruidos de percusión.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para la reproducción, que incluyen la formación de parejas monógamas, la construcción de nidos y la incubación de huevos.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de adaptaciones para la defensa, incluyendo el vuelo rápido, el camuflaje y la vocalización.'
          },
          {
            'funFact':
                'Las aves urbanas, como las palomas y los gorriones, han desarrollado adaptaciones únicas para vivir en entornos urbanos.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para protegerse de los depredadores, incluyendo el camuflaje, el vuelo rápido y las llamadas de alarma.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura ósea hueca que les permite flotar en el agua y nadar con facilidad.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para mantenerse calientes en climas fríos, incluyendo plumaje denso y capas de grasa corporal.'
          },
          {
            'funFact':
                'Las aves migratorias pueden recorrer miles de kilómetros durante sus viajes migratorios, utilizando una combinación de señales visuales, magnéticas y celestes para orientarse.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para el vuelo, incluyendo alas largas y estrechas, cuerpos aerodinámicos y huesos huecos.'
          },
          {
            'funFact':
                'Los pájaros tienen una amplia gama de técnicas de caza, que incluyen la caza en solitario, en grupo y la caza nocturna.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura vocal única que les permite producir una amplia variedad de sonidos, desde trinos melódicos hasta llamadas agudas y ruidos de percusión.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para la reproducción, que incluyen la formación de parejas monógamas, la construcción de nidos y la incubación de huevos.'
          },
          {
            'funFact':
                'Los pájaros tienen una variedad de adaptaciones para la defensa, incluyendo el vuelo rápido, el camuflaje y la vocalización.'
          },
          {
            'funFact':
                'Las aves urbanas, como las palomas y los gorriones, han desarrollado adaptaciones únicas para vivir en entornos urbanos.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para protegerse de los depredadores, incluyendo el camuflaje, el vuelo rápido y las llamadas de alarma.'
          },
          {
            'funFact':
                'Los pájaros tienen una estructura ósea hueca que les permite flotar en el agua y nadar con facilidad.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para mantenerse calientes en climas fríos, incluyendo plumaje denso y capas de grasa corporal.'
          },
          {
            'funFact':
                'Las aves migratorias pueden recorrer miles de kilómetros durante sus viajes migratorios, utilizando una combinación de señales visuales, magnéticas y celestes para orientarse.'
          },
          {
            'funFact':
                'Los pájaros tienen una serie de adaptaciones para el vuelo, incluyendo alas largas y estrechas, cuerpos aerodinámicos y huesos huecos.'
          },
        ];
        break;
      case 'Caballos':
        funFacts = [
          {
            'funFact':
                'Los caballos son mamíferos herbívoros de la familia Equidae.'
          },
          {
            'funFact':
                'Los caballos han sido domesticados por humanos desde hace más de 6,000 años.'
          },
          {
            'funFact':
                'Los caballos salvajes, conocidos como mustangs en América del Norte, son descendientes de caballos domesticados que escaparon y se reprodujeron en estado salvaje.'
          },
          {
            'funFact':
                'Los caballos tienen una esperanza de vida promedio de 25 a 30 años, aunque algunos pueden vivir más tiempo.'
          },
          {
            'funFact':
                'El caballo más alto registrado fue un caballo belga llamado Big Jake, que medía 2.10 metros de altura.'
          },
          {
            'funFact':
                'Los caballos tienen un sentido del olfato muy desarrollado que les permite detectar olores a larga distancia.'
          },
          {
            'funFact':
                'Los caballos pueden dormir tanto de pie como acostados, utilizando un mecanismo de bloqueo en sus patas llamado "mecanismo de apoyo".'
          },
          {
            'funFact':
                'Los caballos tienen una vista panorámica que les permite ver casi 360 grados alrededor de su cuerpo.'
          },
          {
            'funFact':
                'Los caballos tienen aproximadamente 205 huesos en su esqueleto.'
          },
          {
            'funFact':
                'Los caballos tienen un sistema digestivo único conocido como tracto gastrointestinal simple, que les permite digerir fibra vegetal de manera eficiente.'
          },
          {
            'funFact':
                'Los caballos tienen un corazón grande y poderoso que puede bombear hasta 30 galones de sangre por minuto.'
          },
          {
            'funFact':
                'Los caballos tienen aproximadamente 40 dientes, que continúan creciendo a lo largo de su vida.'
          },
          {
            'funFact':
                'Los caballos tienen orejas móviles que pueden girar hasta 180 grados para captar sonidos de diferentes direcciones.'
          },
          {
            'funFact':
                'Los caballos tienen una memoria excelente y pueden recordar lugares, personas y experiencias durante mucho tiempo.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que puede detectar el más mínimo roce o picadura de insecto.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso y una capa de grasa subcutánea que los ayuda a mantenerse calientes en climas fríos.'
          },
          {
            'funFact':
                'Los caballos tienen una capacidad de vocalización limitada, pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
          {
            'funFact':
                'Los caballos tienen una velocidad máxima de galope de alrededor de 55 km/h.'
          },
          {
            'funFact':
                'Los caballos pueden dormir tanto de pie como acostados, utilizando un mecanismo de bloqueo en sus patas llamado "mecanismo de apoyo".'
          },
          {
            'funFact':
                'Los caballos tienen un sentido del equilibrio excepcional que les permite mantenerse estables en movimiento y en terrenos irregulares.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso que se cae y se renueva regularmente para adaptarse a los cambios estacionales.'
          },
          {
            'funFact':
                'Los caballos tienen una serie de adaptaciones para protegerse de los depredadores, como la velocidad, el camuflaje y el comportamiento de alerta.'
          },
          {
            'funFact':
                'Los caballos tienen una vista panorámica que les permite ver casi 360 grados alrededor de su cuerpo.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura vocal limitada pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
          {
            'funFact':
                'Los caballos tienen una velocidad máxima de galope de alrededor de 55 km/h.'
          },
          {
            'funFact':
                'Los caballos pueden dormir tanto de pie como acostados, utilizando un mecanismo de bloqueo en sus patas llamado "mecanismo de apoyo".'
          },
          {
            'funFact':
                'Los caballos tienen un sentido del equilibrio excepcional que les permite mantenerse estables en movimiento y en terrenos irregulares.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso que se cae y se renueva regularmente para adaptarse a los cambios estacionales.'
          },
          {
            'funFact':
                'Los caballos tienen una serie de adaptaciones para protegerse de los depredadores, como la velocidad, el camuflaje y el comportamiento de alerta.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura vocal limitada pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
          {
            'funFact':
                'Los caballos tienen una velocidad máxima de galope de alrededor de 55 km/h.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso que se cae y se renueva regularmente para adaptarse a los cambios estacionales.'
          },
          {
            'funFact':
                'Los caballos tienen una serie de adaptaciones para protegerse de los depredadores, como la velocidad, el camuflaje y el comportamiento de alerta.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura vocal limitada pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
          {
            'funFact':
                'Los caballos tienen una velocidad máxima de galope de alrededor de 55 km/h.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso que se cae y se renueva regularmente para adaptarse a los cambios estacionales.'
          },
          {
            'funFact':
                'Los caballos tienen una serie de adaptaciones para protegerse de los depredadores, como la velocidad, el camuflaje y el comportamiento de alerta.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura vocal limitada pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
          {
            'funFact':
                'Los caballos tienen una velocidad máxima de galope de alrededor de 55 km/h.'
          },
          {
            'funFact':
                'Los caballos tienen una capa de pelo grueso que se cae y se renueva regularmente para adaptarse a los cambios estacionales.'
          },
          {
            'funFact':
                'Los caballos tienen una serie de adaptaciones para protegerse de los depredadores, como la velocidad, el camuflaje y el comportamiento de alerta.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura vocal limitada pero pueden hacer una variedad de sonidos, incluyendo relinchos, resoplidos y relajos.'
          },
          {
            'funFact':
                'Los caballos tienen una estructura social jerárquica en manada, con un líder dominante conocido como el "caballo alfa".'
          },
          {
            'funFact':
                'Los caballos tienen una estructura ósea fuerte y robusta que les permite soportar el peso de un jinete y realizar trabajos físicos exigentes.'
          },
          {
            'funFact':
                'Los caballos tienen una piel sensible que requiere cuidados regulares, como cepillado y limpieza.'
          },
        ];
        break;
      case 'León':
        funFacts = [
          {'funFact': 'Los leones son los felinos más grandes de África.'},
          {
            'funFact':
                'Son conocidos por ser los "reyes de la selva" debido a su posición en la cima de la cadena alimentaria.'
          },
          {
            'funFact':
                'Los leones machos pueden pesar hasta 250 kg, mientras que las hembras suelen ser más pequeñas, con un peso de alrededor de 180 kg.'
          },
          {
            'funFact':
                'Los leones son sociales y viven en grupos llamados manadas.'
          },
          {
            'funFact':
                'Las manadas de leones pueden consistir en hasta 40 individuos, pero en promedio, suelen tener alrededor de 15 miembros.'
          },
          {
            'funFact':
                'La principal función del macho en una manada de leones es proteger el territorio y las crías.'
          },
          {
            'funFact':
                'Las leonas son las cazadoras principales del grupo y trabajan en equipo para cazar presas grandes.'
          },
          {
            'funFact':
                'Los leones son conocidos por su rugido potente, que puede escucharse a kilómetros de distancia.'
          },
          {
            'funFact':
                'El rugido de un león puede ser tan fuerte como 114 decibeles.'
          },
          {
            'funFact':
                'Aunque los leones son conocidos como "reyes de la selva", en realidad prefieren hábitats abiertos como las sabanas y las praderas.'
          },
          {
            'funFact':
                'Los leones son cazadores crepusculares, lo que significa que son más activos durante el amanecer y el atardecer.'
          },
          {
            'funFact':
                'Las leonas comparten la tarea de amamantar y cuidar a las crías de la manada.'
          },
          {
            'funFact':
                'Las crías de león, llamadas cachorros, nacen ciegas y pesan alrededor de 1.5 kg.'
          },
          {
            'funFact':
                'Las leonas cazan en grupo, lo que les permite atrapar presas más grandes como cebras, ñus y antílopes.'
          },
          {
            'funFact':
                'Los leones tienen una dieta carnívora y se alimentan principalmente de mamíferos grandes.'
          },
          {
            'funFact':
                'Aunque las leonas son las cazadoras principales, los machos participan en la caza cuando la presa es particularmente grande o difícil de atrapar.'
          },
          {
            'funFact':
                'Los leones son depredadores tope en su ecosistema y juegan un papel crucial en el control de poblaciones de herbívoros.'
          },
          {
            'funFact':
                'A pesar de su reputación de ser cazadores feroces, los leones tienen éxito en menos del 25% de sus cacerías.'
          },
          {
            'funFact':
                'Los leones pueden dormir hasta 20 horas al día, lo que les permite conservar energía para la caza.'
          },
          {
            'funFact':
                'La esperanza de vida promedio de un león en la naturaleza es de alrededor de 10 a 14 años.'
          },
          {
            'funFact':
                'En cautiverio, los leones pueden vivir hasta 20 años o más.'
          },
          {
            'funFact':
                'Los leones tienen garras retráctiles que utilizan para atrapar y matar a sus presas.'
          },
          {
            'funFact':
                'Las garras de un león pueden medir hasta 8 centímetros de largo.'
          },
          {
            'funFact':
                'Los leones tienen una mordida poderosa, capaz de romper huesos y aplastar el cráneo de sus presas.'
          },
          {
            'funFact':
                'Aunque los leones son conocidos por su melena, no todas las especies de leones tienen este rasgo distintivo. Las leonas no tienen melena.'
          },
          {
            'funFact':
                'La longitud y el color de la melena de un león pueden indicar su salud y estado físico.'
          },
          {
            'funFact':
                'La melena de un león puede variar desde un tono rubio claro hasta un marrón oscuro o negro.'
          },
          {
            'funFact':
                'La melena de un león puede ayudar a disipar el calor y proteger su cuello durante las peleas.'
          },
          {
            'funFact':
                'Los leones son territoriales y marcan su territorio con orina y marcas de garras en árboles y rocas.'
          },
          {
            'funFact':
                'Los leones machos suelen quedarse en una manada durante toda su vida, mientras que las leonas pueden abandonar el grupo al alcanzar la madurez sexual.'
          },
          {
            'funFact':
                'Cuando una nueva manada de leones toma el control de un territorio, a menudo matan a los cachorros existentes para asegurar su dominio.'
          },
          {
            'funFact':
                'Los leones pueden correr a velocidades de hasta 80 km/h en distancias cortas.'
          },
          {
            'funFact':
                'La vista de un león es aguda en condiciones de poca luz, lo que les permite cazar durante la noche.'
          },
          {
            'funFact':
                'Los leones tienen una estructura social compleja que incluye jerarquías claras dentro de la manada.'
          },
          {
            'funFact':
                'Las peleas entre leones machos por el control de una manada pueden ser extremadamente violentas y pueden resultar en lesiones graves e incluso la muerte.'
          },
          {
            'funFact':
                'Aunque los leones son depredadores, también son presas de otros carnívoros como hienas, leopardos y cocodrilos.'
          },
          {
            'funFact':
                'Las leonas pueden entrar en celo varias veces al año y el período de gestación dura alrededor de 110 días.'
          },
          {
            'funFact':
                'Las leonas suelen dar a luz de 1 a 4 cachorros en cada camada.'
          },
          {
            'funFact':
                'Los leones jóvenes comienzan a cazar junto a las leonas a una edad temprana, generalmente alrededor de los 11 meses.'
          },
          {
            'funFact':
                'Los leones machos jóvenes suelen abandonar la manada cuando alcanzan la madurez sexual y buscan formar su propia coalición o tomar el control de una manada existente.'
          },
          {
            'funFact':
                'Los leones tienen una estructura social basada en la cooperación y el apoyo mutuo dentro de la manada.'
          },
          {
            'funFact':
                'Las manadas de leones suelen tener una estructura familiar, con varias generaciones de leonas y sus crías.'
          },
          {
            'funFact':
                'Los leones pueden comunicarse entre sí mediante una variedad de vocalizaciones, incluyendo rugidos, gruñidos, bufidos y ronroneos.'
          },
          {
            'funFact':
                'Aunque los leones son cazadores eficientes, también son carroñeros y se alimentan de animales muertos cuando la oportunidad se presenta.'
          },
          {
            'funFact':
                'Los leones tienen una vista excepcionalmente aguda y pueden ver presas a distancias de hasta 2 km.'
          },
          {
            'funFact':
                'Los leones son animales muy sociales y pasan mucho tiempo interactuando entre sí, acicalándose y jugando.'
          },
          {
            'funFact':
                'Las leonas son responsables de la mayor parte de la caza en la manada y su éxito en la caza es crucial para la supervivencia del grupo.'
          },
          {
            'funFact':
                'Los leones tienen una anatomía muscular poderosa, lo que les permite derribar presas grandes y dominar a otros depredadores en peleas.'
          },
          {
            'funFact':
                'Los leones son animales altamente adaptativos y pueden vivir en una variedad de hábitats, desde sabanas hasta bosques y áreas semiáridas.'
          },
          {
            'funFact':
                'Los leones son animales territoriales y protegen su territorio de intrusos, incluyendo otros leones.'
          },
          {
            'funFact':
                'Los leones jóvenes aprenden habilidades de caza y comportamientos sociales observando y siguiendo a los adultos en la manada.'
          },
          {
            'funFact':
                'Los leones adultos suelen pasar gran parte del día descansando y tomando siestas para conservar energía para la caza.'
          },
          {
            'funFact':
                'Los leones tienen una estructura social matrilineal, lo que significa que las leonas y sus crías son el núcleo de la manada.'
          },
          {
            'funFact':
                'Los leones machos suelen alcanzar la madurez sexual alrededor de los 3 años, pero pueden no tener éxito en la reproducción hasta que sean mayores y más grandes.'
          },
          {
            'funFact':
                'Los leones tienen una mandíbula poderosa y dientes afilados diseñados para desgarrar la carne de sus presas.'
          },
          {
            'funFact':
                'Los leones pueden comer hasta un tercio de su peso corporal en una sola comida cuando tienen la oportunidad.'
          },
          {
            'funFact':
                'Las leonas suelen cazar en grupos cooperativos, utilizando tácticas de emboscada para atrapar a sus presas.'
          },
          {
            'funFact':
                'Los leones tienen una piel gruesa y resistente que les protege de las mordeduras y arañazos durante la caza y las peleas territoriales.'
          },
          {
            'funFact':
                'Los leones son animales sociales altamente inteligentes y muestran comportamientos complejos como el juego, la caza en equipo y el cuidado de las crías.'
          },
          {
            'funFact':
                'Aunque los leones son depredadores dominantes en su ecosistema, enfrentan amenazas como la pérdida de hábitat, la caza ilegal y los conflictos con humanos en algunas áreas.'
          },
        ];
        break;
      case 'Elefante':
        funFacts = [
          {
            'funFact':
                'Los elefantes son los mamíferos terrestres más grandes del mundo.'
          },
          {
            'funFact':
                'Hay tres especies de elefantes: el elefante africano de sabana, el elefante africano de bosque y el elefante asiático.'
          },
          {
            'funFact':
                'Los elefantes africanos tienen orejas grandes y en forma de abanico, mientras que los elefantes asiáticos tienen orejas más pequeñas y redondeadas.'
          },
          {
            'funFact':
                'Los elefantes tienen una trompa larga y flexible que utilizan para respirar, beber, alimentarse, comunicarse y manipular objetos.'
          },
          {
            'funFact':
                'Los elefantes tienen una esperanza de vida de aproximadamente 60-70 años en la naturaleza.'
          },
          {
            'funFact':
                'Los elefantes viven en grupos sociales llamados manadas, que están liderados por una hembra mayor conocida como matriarca.'
          },
          {
            'funFact':
                'Los elefantes tienen una memoria excepcional y pueden recordar lugares, individuos y experiencias durante décadas.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social compleja que incluye la formación de lazos familiares y relaciones sociales.'
          },
          {
            'funFact':
                'Los elefantes tienen una gestación de aproximadamente 22 meses, la más larga de cualquier mamífero terrestre.'
          },
          {
            'funFact':
                'Los elefantes recién nacidos pesan alrededor de 100 kg al nacer.'
          },
          {
            'funFact':
                'Los elefantes son herbívoros y se alimentan principalmente de hierbas, hojas, ramas, cortezas y frutas.'
          },
          {
            'funFact':
                'Los elefantes pueden consumir hasta 150 kg de comida y 100 litros de agua por día.'
          },
          {
            'funFact':
                'Los elefantes tienen un sentido del olfato altamente desarrollado que les permite detectar olores a larga distancia.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de comunicación que incluye una variedad de vocalizaciones, movimientos corporales y gestos con la trompa.'
          },
          {
            'funFact':
                'Los elefantes africanos machos desarrollan colmillos grandes y curvos que pueden alcanzar hasta 3 metros de longitud.'
          },
          {
            'funFact':
                'Los elefantes asiáticos machos también tienen colmillos, pero son más pequeños y a menudo no sobresalen de la boca.'
          },
          {
            'funFact':
                'Los elefantes africanos de sabana son los animales terrestres más grandes del mundo, con machos que pueden alcanzar hasta 4 metros de altura en el hombro.'
          },
          {
            'funFact':
                'Los elefantes son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
          {
            'funFact':
                'Los elefantes son capaces de reconocerse en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social compleja que incluye la formación de lazos familiares y relaciones sociales.'
          },
          {
            'funFact':
                'Los elefantes pueden comunicarse a larga distancia mediante la emisión de infrasonidos, que pueden viajar varios kilómetros a través del suelo.'
          },
          {
            'funFact':
                'Los elefantes tienen una piel gruesa y resistente que les protege de los elementos y de los ataques de parásitos y depredadores.'
          },
          {
            'funFact':
                'Los elefantes son animales altamente inteligentes y tienen una capacidad de resolución de problemas sorprendente.'
          },
          {
            'funFact':
                'Los elefantes pueden utilizar herramientas naturales, como ramas o piedras, para ayudarse en la alimentación y en otras actividades.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de memoria espacial que les permite recordar la ubicación de fuentes de comida y agua durante largos períodos de tiempo.'
          },
          {
            'funFact':
                'Los elefantes son animales extremadamente sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social jerárquica que se basa en la edad, el tamaño y la experiencia.'
          },
          {
            'funFact':
                'Los elefantes tienen una gestación de aproximadamente 22 meses, la más larga de cualquier mamífero terrestre.'
          },
          {
            'funFact':
                'Los elefantes recién nacidos pesan alrededor de 100 kg al nacer y son atendidos y protegidos por la manada.'
          },
          {
            'funFact':
                'Los elefantes tienen una trompa larga y flexible que utilizan para respirar, beber, alimentarse, comunicarse y manipular objetos.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de comunicación que incluye una variedad de vocalizaciones, movimientos corporales y gestos con la trompa.'
          },
          {
            'funFact':
                'Los elefantes africanos machos desarrollan colmillos grandes y curvos que pueden alcanzar hasta 3 metros de longitud.'
          },
          {
            'funFact':
                'Los elefantes asiáticos machos también tienen colmillos, pero son más pequeños y a menudo no sobresalen de la boca.'
          },
          {
            'funFact':
                'Los elefantes africanos de sabana son los animales terrestres más grandes del mundo, con machos que pueden alcanzar hasta 4 metros de altura en el hombro.'
          },
          {
            'funFact':
                'Los elefantes son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
          {
            'funFact':
                'Los elefantes son capaces de reconocerse en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social compleja que incluye la formación de lazos familiares y relaciones sociales.'
          },
          {
            'funFact':
                'Los elefantes pueden comunicarse a larga distancia mediante la emisión de infrasonidos, que pueden viajar varios kilómetros a través del suelo.'
          },
          {
            'funFact':
                'Los elefantes tienen una piel gruesa y resistente que les protege de los elementos y de los ataques de parásitos y depredadores.'
          },
          {
            'funFact':
                'Los elefantes son animales altamente inteligentes y tienen una capacidad de resolución de problemas sorprendente.'
          },
          {
            'funFact':
                'Los elefantes pueden utilizar herramientas naturales, como ramas o piedras, para ayudarse en la alimentación y en otras actividades.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de memoria espacial que les permite recordar la ubicación de fuentes de comida y agua durante largos períodos de tiempo.'
          },
          {
            'funFact':
                'Los elefantes son animales extremadamente sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social jerárquica que se basa en la edad, el tamaño y la experiencia.'
          },
          {
            'funFact':
                'Los elefantes tienen una gestación de aproximadamente 22 meses, la más larga de cualquier mamífero terrestre.'
          },
          {
            'funFact':
                'Los elefantes recién nacidos pesan alrededor de 100 kg al nacer y son atendidos y protegidos por la manada.'
          },
          {
            'funFact':
                'Los elefantes tienen una trompa larga y flexible que utilizan para respirar, beber, alimentarse, comunicarse y manipular objetos.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de comunicación que incluye una variedad de vocalizaciones, movimientos corporales y gestos con la trompa.'
          },
          {
            'funFact':
                'Los elefantes africanos machos desarrollan colmillos grandes y curvos que pueden alcanzar hasta 3 metros de longitud.'
          },
          {
            'funFact':
                'Los elefantes asiáticos machos también tienen colmillos, pero son más pequeños y a menudo no sobresalen de la boca.'
          },
          {
            'funFact':
                'Los elefantes africanos de sabana son los animales terrestres más grandes del mundo, con machos que pueden alcanzar hasta 4 metros de altura en el hombro.'
          },
          {
            'funFact':
                'Los elefantes son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
          {
            'funFact':
                'Los elefantes son capaces de reconocerse en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los elefantes tienen una estructura social compleja que incluye la formación de lazos familiares y relaciones sociales.'
          },
          {
            'funFact':
                'Los elefantes pueden comunicarse a larga distancia mediante la emisión de infrasonidos, que pueden viajar varios kilómetros a través del suelo.'
          },
          {
            'funFact':
                'Los elefantes tienen una piel gruesa y resistente que les protege de los elementos y de los ataques de parásitos y depredadores.'
          },
          {
            'funFact':
                'Los elefantes son animales altamente inteligentes y tienen una capacidad de resolución de problemas sorprendente.'
          },
          {
            'funFact':
                'Los elefantes pueden utilizar herramientas naturales, como ramas o piedras, para ayudarse en la alimentación y en otras actividades.'
          },
          {
            'funFact':
                'Los elefantes tienen una excelente capacidad de memoria espacial que les permite recordar la ubicación de fuentes de comida y agua durante largos períodos de tiempo.'
          },
          {
            'funFact':
                'Los elefantes son animales extremadamente sociales y pasan mucho tiempo interactuando entre ellos, jugando, acicalándose y comunicándose.'
          },
        ];
        break;
      case 'Delfín':
        funFacts = [
          {
            'funFact':
                'Los delfines son mamíferos marinos que pertenecen a la familia de los cetáceos, que también incluye ballenas y marsopas.'
          },
          {
            'funFact':
                'Hay más de 40 especies de delfines distribuidas en océanos y mares de todo el mundo.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su inteligencia excepcional y su capacidad para comunicarse entre ellos mediante sonidos, silbidos y gestos corporales.'
          },
          {
            'funFact':
                'Los delfines tienen cerebros grandes y complejos en relación con el tamaño de sus cuerpos, lo que sugiere una alta capacidad cognitiva.'
          },
          {
            'funFact':
                'Los delfines tienen una esperanza de vida promedio de 20 a 50 años, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Los delfines son mamíferos acuáticos y respiran aire a través de un orificio en la parte superior de su cabeza llamado espiráculo.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su habilidad para nadar a altas velocidades y realizar acrobacias en el agua, como saltos y giros.'
          },
          {
            'funFact':
                'Los delfines son animales sociales que viven en grupos llamados manadas o grupos, que pueden estar compuestos por varios individuos.'
          },
          {
            'funFact':
                'Los delfines utilizan la ecolocalización para detectar presas y objetos en su entorno, emitiendo pulsos de sonido y escuchando los ecos que rebotan en ellos.'
          },
          {
            'funFact':
                'Los delfines se comunican entre ellos utilizando una variedad de sonidos y vocalizaciones, incluyendo silbidos, clics y chirridos.'
          },
          {
            'funFact':
                'Los delfines tienen una dieta variada que incluye peces, calamares, crustáceos y pulpos, dependiendo de la especie y la disponibilidad de alimentos.'
          },
          {
            'funFact':
                'Los delfines tienen una piel lisa y aerodinámica que les ayuda a moverse fácilmente a través del agua.'
          },
          {
            'funFact':
                'Los delfines pueden saltar hasta 6 metros por encima de la superficie del agua y alcanzar velocidades de hasta 40 km/h.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su comportamiento juguetón y su amor por jugar con objetos flotantes, olas y burbujas.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social compleja que incluye la formación de lazos familiares, alianzas entre machos y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Los delfines son animales muy curiosos y pueden interactuar con humanos y otros animales marinos en su entorno.'
          },
          {
            'funFact':
                'Los delfines pueden dormir con un ojo abierto y medio cerebro activo para mantenerse alerta ante posibles depredadores y mantener la respiración.'
          },
          {
            'funFact':
                'Los delfines tienen una visión excelente tanto dentro como fuera del agua, lo que les permite detectar presas y depredadores en diferentes condiciones de luz.'
          },
          {
            'funFact':
                'Los delfines tienen una serie de adaptaciones físicas para sobrevivir en su entorno marino, como aletas dorsales para la estabilidad y aletas caudales para la propulsión.'
          },
          {
            'funFact':
                'Los delfines tienen una capa de grasa subcutánea que les ayuda a mantener una temperatura corporal constante en aguas frías.'
          },
          {
            'funFact':
                'Los delfines son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, cazando y comunicándose.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su capacidad para formar vínculos emocionales fuertes con otros miembros de su manada, así como con humanos.'
          },
          {
            'funFact':
                'Los delfines son capaces de reconocerse a sí mismos en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social jerárquica que se basa en la edad, el tamaño y la experiencia.'
          },
          {
            'funFact':
                'Los delfines pueden comunicarse a larga distancia mediante la emisión de sonidos y vocalizaciones que pueden viajar varios kilómetros a través del agua.'
          },
          {
            'funFact':
                'Los delfines tienen una excelente capacidad de orientación y pueden utilizar puntos de referencia visuales, sonidos y campos magnéticos para navegar en su entorno marino.'
          },
          {
            'funFact':
                'Los delfines tienen una dieta variada que incluye peces, calamares, crustáceos y pulpos, dependiendo de la especie y la disponibilidad de alimentos.'
          },
          {
            'funFact':
                'Los delfines utilizan la ecolocalización para detectar presas y objetos en su entorno, emitiendo pulsos de sonido y escuchando los ecos que rebotan en ellos.'
          },
          {
            'funFact':
                'Los delfines son animales muy inteligentes y tienen una capacidad de aprendizaje rápida que les permite adaptarse a diferentes situaciones y entornos.'
          },
          {
            'funFact':
                'Los delfines pueden formar alianzas con otros miembros de su manada para cazar presas grandes y defenderse de depredadores.'
          },
          {
            'funFact':
                'Los delfines tienen una piel lisa y aerodinámica que les ayuda a moverse fácilmente a través del agua.'
          },
          {
            'funFact':
                'Los delfines pueden saltar hasta 6 metros por encima de la superficie del agua y alcanzar velocidades de hasta 40 km/h.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su comportamiento juguetón y su amor por jugar con objetos flotantes, olas y burbujas.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social compleja que incluye la formación de lazos familiares, alianzas entre machos y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Los delfines son animales muy curiosos y pueden interactuar con humanos y otros animales marinos en su entorno.'
          },
          {
            'funFact':
                'Los delfines pueden dormir con un ojo abierto y medio cerebro activo para mantenerse alerta ante posibles depredadores y mantener la respiración.'
          },
          {
            'funFact':
                'Los delfines tienen una visión excelente tanto dentro como fuera del agua, lo que les permite detectar presas y depredadores en diferentes condiciones de luz.'
          },
          {
            'funFact':
                'Los delfines tienen una serie de adaptaciones físicas para sobrevivir en su entorno marino, como aletas dorsales para la estabilidad y aletas caudales para la propulsión.'
          },
          {
            'funFact':
                'Los delfines tienen una capa de grasa subcutánea que les ayuda a mantener una temperatura corporal constante en aguas frías.'
          },
          {
            'funFact':
                'Los delfines son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, cazando y comunicándose.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su capacidad para formar vínculos emocionales fuertes con otros miembros de su manada, así como con humanos.'
          },
          {
            'funFact':
                'Los delfines son capaces de reconocerse a sí mismos en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social jerárquica que se basa en la edad, el tamaño y la experiencia.'
          },
          {
            'funFact':
                'Los delfines pueden comunicarse a larga distancia mediante la emisión de sonidos y vocalizaciones que pueden viajar varios kilómetros a través del agua.'
          },
          {
            'funFact':
                'Los delfines tienen una excelente capacidad de orientación y pueden utilizar puntos de referencia visuales, sonidos y campos magnéticos para navegar en su entorno marino.'
          },
          {
            'funFact':
                'Los delfines son animales muy inteligentes y tienen una capacidad de aprendizaje rápida que les permite adaptarse a diferentes situaciones y entornos.'
          },
          {
            'funFact':
                'Los delfines pueden formar alianzas con otros miembros de su manada para cazar presas grandes y defenderse de depredadores.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su comportamiento juguetón y su amor por jugar con objetos flotantes, olas y burbujas.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social compleja que incluye la formación de lazos familiares, alianzas entre machos y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Los delfines son animales muy curiosos y pueden interactuar con humanos y otros animales marinos en su entorno.'
          },
          {
            'funFact':
                'Los delfines pueden dormir con un ojo abierto y medio cerebro activo para mantenerse alerta ante posibles depredadores y mantener la respiración.'
          },
          {
            'funFact':
                'Los delfines tienen una visión excelente tanto dentro como fuera del agua, lo que les permite detectar presas y depredadores en diferentes condiciones de luz.'
          },
          {
            'funFact':
                'Los delfines tienen una serie de adaptaciones físicas para sobrevivir en su entorno marino, como aletas dorsales para la estabilidad y aletas caudales para la propulsión.'
          },
          {
            'funFact':
                'Los delfines tienen una capa de grasa subcutánea que les ayuda a mantener una temperatura corporal constante en aguas frías.'
          },
          {
            'funFact':
                'Los delfines son animales sociales y pasan mucho tiempo interactuando entre ellos, jugando, cazando y comunicándose.'
          },
          {
            'funFact':
                'Los delfines son conocidos por su capacidad para formar vínculos emocionales fuertes con otros miembros de su manada, así como con humanos.'
          },
          {
            'funFact':
                'Los delfines son capaces de reconocerse a sí mismos en un espejo, lo que sugiere un alto nivel de conciencia de sí mismos.'
          },
          {
            'funFact':
                'Los delfines tienen una estructura social jerárquica que se basa en la edad, el tamaño y la experiencia.'
          },
          {
            'funFact':
                'Los delfines pueden comunicarse a larga distancia mediante la emisión de sonidos y vocalizaciones que pueden viajar varios kilómetros a través del agua.'
          },
          {
            'funFact':
                'Los delfines tienen una excelente capacidad de orientación y pueden utilizar puntos de referencia visuales, sonidos y campos magnéticos para navegar en su entorno marino.'
          },
        ];
        break;
      case 'Jirafa':
        funFacts = [
          {
            'funFact':
                'Las jirafas son mamíferos herbívoros que habitan en las regiones áridas y semidesérticas del África subsahariana.'
          },
          {
            'funFact':
                'Son conocidas por su cuello largo y sus patas largas, que les permiten alcanzar las hojas más altas de los árboles para alimentarse.'
          },
          {
            'funFact':
                'Las jirafas son los animales terrestres más altos del mundo, con una altura promedio de 5.5 a 6 metros.'
          },
          {
            'funFact':
                'A pesar de su gran tamaño, las jirafas tienen solo siete vértebras cervicales, al igual que los humanos.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua azul o morada que puede medir hasta 50 centímetros de largo y es prensil, lo que les permite agarrar hojas y ramas.'
          },
          {
            'funFact':
                'Las manchas de las jirafas, llamadas "manchas", son únicas para cada individuo y actúan como un sistema de identificación.'
          },
          {
            'funFact':
                'Las jirafas tienen un corazón muy grande, que puede pesar hasta 11 kilogramos y bombea alrededor de 60 litros de sangre por minuto.'
          },
          {
            'funFact':
                'A pesar de su tamaño, las jirafas tienen una presión arterial relativamente baja para evitar la hemorragia cerebral cuando bajan la cabeza para beber agua.'
          },
          {
            'funFact':
                'Las jirafas pueden vivir hasta 25 años en la naturaleza y hasta 40 años en cautiverio.'
          },
          {
            'funFact':
                'Las jirafas tienen una vista excepcional que les permite detectar depredadores a larga distancia.'
          },
          {
            'funFact':
                'A pesar de su tamaño, las jirafas son ágiles y pueden correr a una velocidad máxima de alrededor de 60 km/h.'
          },
          {
            'funFact':
                'Las jirafas tienen un período de gestación de aproximadamente 15 meses y dan a luz a una sola cría, que nace mientras está de pie.'
          },
          {
            'funFact':
                'Los recién nacidos jirafa, llamados "tiras", son capaces de ponerse de pie y caminar dentro de una hora después del nacimiento.'
          },
          {
            'funFact':
                'Las jirafas macho luchan por el dominio en combates conocidos como "combates de cuello", donde golpean con sus cuellos y cabezas.'
          },
          {
            'funFact':
                'Las jirafas tienen glándulas odoríferas en sus patas que producen un olor distintivo que puede ayudar en la comunicación y el reconocimiento.'
          },
          {
            'funFact':
                'Las jirafas pasan la mayor parte del día alimentándose, consumiendo hasta 45 kg de hojas y ramas por día.'
          },
          {
            'funFact':
                'A pesar de su tamaño, las jirafas tienen un apetito selectivo y prefieren hojas tiernas y brotes de acacias y árboles similares.'
          },
          {
            'funFact':
                'Las jirafas tienen un sistema circulatorio único que incluye válvulas especiales en las venas de sus cuellos para prevenir el desmayo cuando bajan la cabeza.'
          },
          {
            'funFact':
                'Las jirafas son animales sociales y viven en grupos llamados "tours" o "manadas" liderados por una hembra dominante.'
          },
          {
            'funFact':
                'Las jirafas no tienen un patrón fijo de sueño, pero suelen dormir solo de 10 minutos a 2 horas al día, generalmente en períodos cortos de tiempo.'
          },
          {
            'funFact':
                'Las jirafas tienen una serie de adaptaciones físicas para sobrevivir en su hábitat, como sus largas patas y cuello, así como su lengua prensil.'
          },
          {
            'funFact':
                'Las jirafas son animales muy silenciosos, pero pueden comunicarse entre sí mediante vocalizaciones de baja frecuencia, gruñidos y silbidos.'
          },
          {
            'funFact':
                'Las jirafas tienen una capa de pelo corto en su cuello que actúa como protección contra el sol y los insectos.'
          },
          {
            'funFact':
                'Las jirafas tienen una serie de adaptaciones físicas para sobrevivir en su hábitat, como sus largas patas y cuello, así como su lengua prensil.'
          },
          {
            'funFact':
                'Las jirafas tienen una dieta exclusivamente herbívora y se alimentan principalmente de hojas, brotes y ramas de árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una dieta exclusivamente herbívora y se alimentan principalmente de hojas, brotes y ramas de árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
          {
            'funFact':
                'Las jirafas son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Las jirafas tienen una lengua prensil y larga que les permite agarrar hojas y ramas de los árboles.'
          },
          {
            'funFact':
                'Las jirafas tienen una estructura social compleja que incluye la formación de lazos familiares y jerarquías de dominancia.'
          },
        ];
        break;
      case 'Tigre':
        funFacts = [
          {
            'funFact':
                'Los tigres son el felino más grande del mundo y pertenecen al género Panthera.'
          },
          {
            'funFact':
                'Hay seis subespecies de tigres reconocidas, que incluyen el tigre de Bengala, el tigre siberiano, el tigre de Sumatra, el tigre de Indochina, el tigre de Malasia y el tigre del sur de China.'
          },
          {
            'funFact':
                'Los tigres son conocidos por su pelaje rayado y su cuerpo musculoso, que les ayuda en la caza y la supervivencia en su hábitat.'
          },
          {
            'funFact':
                'Los tigres son excelentes nadadores y disfrutan del agua, a diferencia de otros grandes felinos.'
          },
          {
            'funFact':
                'El tigre de Bengala es la subespecie más numerosa y se encuentra principalmente en India, Bangladesh, Nepal y Bután.'
          },
          {
            'funFact':
                'El tigre siberiano, también conocido como tigre de Amur, es la subespecie más grande y habita en los bosques de Siberia oriental.'
          },
          {
            'funFact':
                'Los tigres tienen una dieta carnívora y se alimentan principalmente de ciervos, jabalíes, búfalos y otros mamíferos grandes.'
          },
          {
            'funFact':
                'Los tigres son animales solitarios y territoriales, excepto durante la época de reproducción y cuando crían a sus cachorros.'
          },
          {
            'funFact':
                'Los tigres tienen un sentido del olfato y del oído muy agudos que les ayudan en la caza y la detección de presas.'
          },
          {
            'funFact':
                'Los tigres tienen una esperanza de vida promedio de 10 a 15 años en la naturaleza y hasta 20 años en cautiverio.'
          },
          {
            'funFact':
                'Los tigres tienen una fuerza tremenda y son capaces de derribar presas que pesan hasta cinco veces su propio peso.'
          },
          {
            'funFact':
                'A pesar de su tamaño, los tigres son sigilosos y pueden moverse silenciosamente para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres tienen una vista excepcional que les permite cazar incluso en condiciones de poca luz.'
          },
          {
            'funFact':
                'Los tigres tienen garras retráctiles que les permiten agarrar y desgarrar la carne de sus presas con facilidad.'
          },
          {
            'funFact':
                'La población de tigres ha disminuido drásticamente en las últimas décadas debido a la caza furtiva, la pérdida de hábitat y el conflicto con los humanos.'
          },
          {
            'funFact':
                'Los tigres machos pueden alcanzar hasta 3 metros de longitud, incluida la cola, y pesar hasta 300 kilogramos.'
          },
          {
            'funFact':
                'Las rayas de los tigres son únicas para cada individuo y actúan como un sistema de camuflaje en su entorno.'
          },
          {
            'funFact':
                'Los tigres tienen una mandíbula poderosa y dientes afilados que les permiten matar a sus presas con un solo golpe.'
          },
          {
            'funFact':
                'Los tigres son animales crepusculares y nocturnos, lo que significa que son más activos durante el amanecer y el anochecer.'
          },
          {
            'funFact':
                'Los tigres tienen un rango de vocalizaciones que incluyen rugidos, gruñidos, maullidos y ronroneos.'
          },
          {
            'funFact':
                'Los tigres pueden comunicarse entre sí mediante marcas de olor, arañazos en los árboles y vocalizaciones.'
          },
          {
            'funFact':
                'Los tigres son excelentes trepadores y pueden subir a los árboles para descansar y acechar a sus presas desde arriba.'
          },
          {
            'funFact':
                'Los tigres tienen una estructura social jerárquica que se basa en la dominancia territorial y la disponibilidad de recursos.'
          },
          {
            'funFact':
                'Los tigres son animales muy territoriales y marcan su territorio con orina, heces y arañazos en los árboles.'
          },
          {
            'funFact':
                'Los tigres tienen una gestación de aproximadamente 3.5 meses y dan a luz a camadas de hasta seis cachorros.'
          },
          {
            'funFact':
                'Los tigres cachorros son vulnerables a los depredadores y la competencia con otros tigres, por lo que son protegidos por sus madres hasta que son lo suficientemente grandes para cazar por sí mismos.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden sobrevivir en una variedad de hábitats, incluidos bosques, selvas, pantanos y pastizales.'
          },
          {
            'funFact':
                'Los tigres tienen una dieta diversa y pueden cazar una amplia gama de presas, desde pequeños mamíferos hasta búfalos y rinocerontes.'
          },
          {
            'funFact':
                'Los tigres son animales muy resistentes y pueden sobrevivir sin agua durante varios días, obteniendo la humedad que necesitan de su dieta.'
          },
          {
            'funFact':
                'Los tigres tienen una velocidad máxima de carrera de hasta 65 km/h y pueden saltar distancias de hasta 6 metros.'
          },
          {
            'funFact':
                'Los tigres tienen una capa de piel gruesa y pelaje denso que los protege de las condiciones climáticas extremas.'
          },
          {
            'funFact':
                'Los tigres son animales muy cautelosos y suelen evitar el contacto con los humanos siempre que sea posible.'
          },
          {
            'funFact':
                'Los tigres son cazadores solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente memoria espacial que les permite recordar la ubicación de presas y recursos clave en su territorio.'
          },
          {
            'funFact':
                'Los tigres son animales muy pacientes y pueden esperar horas para acechar a su presa en silencio.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de camuflaje que les permite ocultarse entre la vegetación y acechar a sus presas sin ser detectados.'
          },
          {
            'funFact':
                'Los tigres son animales muy territoriales y pueden luchar ferozmente con otros tigres por el control del territorio y los recursos.'
          },
          {
            'funFact':
                'Los tigres son animales muy protectores y pueden sacrificarse para proteger a sus crías de los depredadores y los intrusos.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden sobrevivir en una variedad de hábitats, desde bosques densos hasta pantanos y manglares.'
          },
          {
            'funFact':
                'Los tigres son animales muy territoriales y pueden marcar su territorio con orina, heces y arañazos en los árboles.'
          },
          {
            'funFact':
                'Los tigres son animales muy sigilosos y pueden moverse silenciosamente a través de la vegetación para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de natación y pueden cruzar ríos anchos y profundos en busca de presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden cambiar su dieta según la disponibilidad de presas en su territorio.'
          },
          {
            'funFact':
                'Los tigres son animales muy sigilosos y pueden moverse silenciosamente a través de la vegetación para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de natación y pueden cruzar ríos anchos y profundos en busca de presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden cambiar su dieta según la disponibilidad de presas en su territorio.'
          },
          {
            'funFact':
                'Los tigres son animales muy sigilosos y pueden moverse silenciosamente a través de la vegetación para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de natación y pueden cruzar ríos anchos y profundos en busca de presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden cambiar su dieta según la disponibilidad de presas en su territorio.'
          },
          {
            'funFact':
                'Los tigres son animales muy sigilosos y pueden moverse silenciosamente a través de la vegetación para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de natación y pueden cruzar ríos anchos y profundos en busca de presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden cambiar su dieta según la disponibilidad de presas en su territorio.'
          },
          {
            'funFact':
                'Los tigres son animales muy sigilosos y pueden moverse silenciosamente a través de la vegetación para acechar a sus presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy solitarios y prefieren cazar solos en lugar de en grupos.'
          },
          {
            'funFact':
                'Los tigres tienen una excelente capacidad de natación y pueden cruzar ríos anchos y profundos en busca de presas.'
          },
          {
            'funFact':
                'Los tigres son animales muy adaptables y pueden cambiar su dieta según la disponibilidad de presas en su territorio.'
          },
        ];
        break;
      case 'Cocodrilo':
        funFacts = [
          {
            'funFact':
                'Los cocodrilos son reptiles carnívoros de la familia Crocodylidae y son parientes cercanos de los caimanes y los gaviales.'
          },
          {
            'funFact':
                'Hay alrededor de 14 especies diferentes de cocodrilos, que se encuentran en regiones tropicales y subtropicales de África, Asia, América y Australia.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por sus cuerpos largos y robustos, con piel áspera y escamosa y una mandíbula fuerte llena de dientes afilados.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una estructura corporal adaptada para la vida semiacuática, con patas cortas y musculosas y una cola larga y poderosa que les ayuda a nadar.'
          },
          {
            'funFact':
                'Los cocodrilos son excelentes nadadores y pueden moverse rápidamente tanto en el agua como en tierra.'
          },
          {
            'funFact':
                'Los cocodrilos son animales de sangre fría y dependen del sol para regular su temperatura corporal.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una esperanza de vida que varía según la especie, pero generalmente pueden vivir entre 30 y 70 años en la naturaleza.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una dieta carnívora y se alimentan de una variedad de presas, incluyendo peces, aves, mamíferos y otros reptiles.'
          },
          {
            'funFact':
                'Los cocodrilos son depredadores oportunistas y pueden permanecer inmóviles durante largos períodos de tiempo, esperando que las presas se acerquen lo suficiente para atacar.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una mordedura extremadamente poderosa, que puede ejercer una fuerza de hasta 3,700 libras por pulgada cuadrada.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su capacidad para realizar "muertes por giro", donde giran rápidamente sobre su eje mientras sostienen a su presa para desgarrarla en pedazos más pequeños.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una excelente visión y pueden detectar movimientos sutiles en el agua, lo que les ayuda en la caza.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una estructura social jerárquica y pueden ser territoriales, especialmente durante la época de reproducción y crianza.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy cautelosos y pueden retirarse al agua rápidamente si se sienten amenazados.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de comunicarse entre sí mediante vocalizaciones, gruñidos y silbidos, así como mediante señales visuales y posturas corporales.'
          },
          {
            'funFact':
                'Los cocodrilos hembras construyen nidos de material vegetal y tierra donde ponen sus huevos, que pueden ser de 10 a 60 huevos dependiendo de la especie.'
          },
          {
            'funFact':
                'Los cocodrilos machos pueden participar en el cuidado de los huevos y las crías, protegiendo el nido y ayudando a liberar a las crías recién nacidas.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su longevidad y pueden sobrevivir durante largos períodos sin comer, almacenando energía en forma de grasa en sus cuerpos.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una serie de adaptaciones físicas para sobrevivir en su entorno, incluyendo párpados transparentes que les permiten ver bajo el agua sin problemas.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de permanecer sumergidos bajo el agua durante largos períodos de tiempo, hasta varias horas, gracias a su capacidad para retener la respiración.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una capa de piel gruesa y escamosa que les protege de los ataques de otros animales y les ayuda a retener la humedad en su cuerpo.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy adaptables y pueden habitar una variedad de hábitats acuáticos, incluyendo ríos, lagos, pantanos y estuarios.'
          },
          {
            'funFact':
                'Los cocodrilos son animales ectotérmicos, lo que significa que dependen del ambiente externo para regular su temperatura corporal.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de regular su temperatura corporal tomando el sol en las orillas de los ríos y lagos.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy sigilosos y pueden moverse silenciosamente a través del agua para acechar a sus presas.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy territoriales y pueden luchar ferozmente con otros cocodrilos por el control del territorio y los recursos.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de comunicarse entre sí mediante vocalizaciones, gruñidos y silbidos, así como mediante señales visuales y posturas corporales.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una mordedura extremadamente poderosa, que puede ejercer una fuerza de hasta 3,700 libras por pulgada cuadrada.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su capacidad para realizar "muertes por giro", donde giran rápidamente sobre su eje mientras sostienen a su presa para desgarrarla en pedazos más pequeños.'
          },
          {
            'funFact':
                'Los cocodrilos hembras construyen nidos de material vegetal y tierra donde ponen sus huevos, que pueden ser de 10 a 60 huevos dependiendo de la especie.'
          },
          {
            'funFact':
                'Los cocodrilos machos pueden participar en el cuidado de los huevos y las crías, protegiendo el nido y ayudando a liberar a las crías recién nacidas.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su longevidad y pueden sobrevivir durante largos períodos sin comer, almacenando energía en forma de grasa en sus cuerpos.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una serie de adaptaciones físicas para sobrevivir en su entorno, incluyendo párpados transparentes que les permiten ver bajo el agua sin problemas.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de permanecer sumergidos bajo el agua durante largos períodos de tiempo, hasta varias horas, gracias a su capacidad para retener la respiración.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una capa de piel gruesa y escamosa que les protege de los ataques de otros animales y les ayuda a retener la humedad en su cuerpo.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy adaptables y pueden habitar una variedad de hábitats acuáticos, incluyendo ríos, lagos, pantanos y estuarios.'
          },
          {
            'funFact':
                'Los cocodrilos son animales ectotérmicos, lo que significa que dependen del ambiente externo para regular su temperatura corporal.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de regular su temperatura corporal tomando el sol en las orillas de los ríos y lagos.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy sigilosos y pueden moverse silenciosamente a través del agua para acechar a sus presas.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy territoriales y pueden luchar ferozmente con otros cocodrilos por el control del territorio y los recursos.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de comunicarse entre sí mediante vocalizaciones, gruñidos y silbidos, así como mediante señales visuales y posturas corporales.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una mordedura extremadamente poderosa, que puede ejercer una fuerza de hasta 3,700 libras por pulgada cuadrada.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su capacidad para realizar "muertes por giro", donde giran rápidamente sobre su eje mientras sostienen a su presa para desgarrarla en pedazos más pequeños.'
          },
          {
            'funFact':
                'Los cocodrilos hembras construyen nidos de material vegetal y tierra donde ponen sus huevos, que pueden ser de 10 a 60 huevos dependiendo de la especie.'
          },
          {
            'funFact':
                'Los cocodrilos machos pueden participar en el cuidado de los huevos y las crías, protegiendo el nido y ayudando a liberar a las crías recién nacidas.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su longevidad y pueden sobrevivir durante largos períodos sin comer, almacenando energía en forma de grasa en sus cuerpos.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una serie de adaptaciones físicas para sobrevivir en su entorno, incluyendo párpados transparentes que les permiten ver bajo el agua sin problemas.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de permanecer sumergidos bajo el agua durante largos períodos de tiempo, hasta varias horas, gracias a su capacidad para retener la respiración.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una capa de piel gruesa y escamosa que les protege de los ataques de otros animales y les ayuda a retener la humedad en su cuerpo.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy adaptables y pueden habitar una variedad de hábitats acuáticos, incluyendo ríos, lagos, pantanos y estuarios.'
          },
          {
            'funFact':
                'Los cocodrilos son animales ectotérmicos, lo que significa que dependen del ambiente externo para regular su temperatura corporal.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de regular su temperatura corporal tomando el sol en las orillas de los ríos y lagos.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy sigilosos y pueden moverse silenciosamente a través del agua para acechar a sus presas.'
          },
          {
            'funFact':
                'Los cocodrilos son animales muy territoriales y pueden luchar ferozmente con otros cocodrilos por el control del territorio y los recursos.'
          },
          {
            'funFact':
                'Los cocodrilos son capaces de comunicarse entre sí mediante vocalizaciones, gruñidos y silbidos, así como mediante señales visuales y posturas corporales.'
          },
          {
            'funFact':
                'Los cocodrilos tienen una mordedura extremadamente poderosa, que puede ejercer una fuerza de hasta 3,700 libras por pulgada cuadrada.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su capacidad para realizar "muertes por giro", donde giran rápidamente sobre su eje mientras sostienen a su presa para desgarrarla en pedazos más pequeños.'
          },
          {
            'funFact':
                'Los cocodrilos hembras construyen nidos de material vegetal y tierra donde ponen sus huevos, que pueden ser de 10 a 60 huevos dependiendo de la especie.'
          },
          {
            'funFact':
                'Los cocodrilos machos pueden participar en el cuidado de los huevos y las crías, protegiendo el nido y ayudando a liberar a las crías recién nacidas.'
          },
          {
            'funFact':
                'Los cocodrilos son conocidos por su longevidad y pueden sobrevivir durante largos períodos sin comer, almacenando energía en forma de grasa en sus cuerpos.'
          },
        ];
        break;
      case 'Oso':
        funFacts = [
          {
            'funFact':
                'Los osos son mamíferos pertenecientes a la familia Ursidae y se encuentran distribuidos en varias partes del mundo, incluyendo América del Norte, Europa, Asia y partes de África y Sudamérica.'
          },
          {
            'funFact':
                'Existen ocho especies de osos reconocidas en el mundo, que incluyen al oso pardo, oso negro, oso polar, oso panda, oso pardo de Kamchatka, oso pardo del Himalaya, oso de anteojos y oso perezoso.'
          },
          {
            'funFact':
                'Los osos se caracterizan por su gran tamaño, cuerpo robusto, patas poderosas y garras afiladas.'
          },
          {
            'funFact':
                'Los osos tienen un excelente sentido del olfato y pueden detectar olores a largas distancias, lo que les ayuda en la búsqueda de alimento.'
          },
          {
            'funFact':
                'Los osos son animales omnívoros y su dieta puede variar según la especie y el hábitat, incluyendo frutas, bayas, insectos, peces, mamíferos pequeños y carroña.'
          },
          {
            'funFact':
                'Los osos son conocidos por su capacidad para hibernar durante el invierno en regiones frías, reduciendo su actividad metabólica y viviendo de las reservas de grasa acumuladas.'
          },
          {
            'funFact':
                'Durante la hibernación, los osos pueden perder hasta un tercio de su peso corporal, pero no entran en un estado de verdadera hibernación como otros animales, y pueden despertarse fácilmente si se sienten amenazados.'
          },
          {
            'funFact':
                'Los osos polares son los mayores carnívoros terrestres y se encuentran principalmente en el Ártico, donde cazan focas y otros animales marinos.'
          },
          {
            'funFact':
                'Los osos pardos son los osos más extendidos en el mundo y se encuentran en una variedad de hábitats, desde bosques hasta praderas y montañas.'
          },
          {
            'funFact':
                'Los osos negros son comunes en América del Norte y pueden tener pelajes negros, marrones o incluso grises.'
          },
          {
            'funFact':
                'Los osos pandas gigantes son nativos de China y son conocidos por su distintivo pelaje blanco y negro y su dieta casi exclusiva de bambú.'
          },
          {
            'funFact':
                'Los osos son animales solitarios en la mayoría de los casos, aunque algunas especies, como el oso panda, pueden ser más sociales.'
          },
          {
            'funFact':
                'Los osos tienen una vista y audición moderadas, pero su sentido del olfato es excepcionalmente agudo.'
          },
          {
            'funFact':
                'Los osos son excelentes escaladores y pueden trepar árboles con facilidad para escapar de los depredadores o buscar alimento.'
          },
          {
            'funFact':
                'Los osos tienen una marcha peculiar, ya que caminan con las plantas de los pies hacia adentro, lo que les da un andar característico.'
          },
          {
            'funFact':
                'Los osos son conocidos por su comportamiento territorial y pueden marcar su territorio con arañazos en los árboles y la orina.'
          },
          {
            'funFact':
                'Los osos pueden ser criados en cautiverio, pero pueden ser peligrosos y necesitan mucho espacio y estimulación para su bienestar.'
          },
          {
            'funFact':
                'Los osos son capaces de comunicarse entre sí mediante vocalizaciones, gruñidos, bufidos y gestos corporales.'
          },
          {
            'funFact':
                'Los osos tienen un sentido del gusto poco desarrollado y pueden no ser particularmente selectivos con su comida.'
          },
          {
            'funFact':
                'Los osos son criaturas inteligentes y pueden aprender rápidamente a asociar ciertos estímulos con la comida.'
          },
          {
            'funFact':
                'Los osos pueden viajar largas distancias en busca de alimento y agua, especialmente durante los períodos de escasez.'
          },
          {
            'funFact':
                'Los osos pardos pueden cavar madrigueras para refugiarse durante el mal tiempo o como lugar de hibernación.'
          },
          {
            'funFact':
                'Los osos son animales muy adaptables y pueden sobrevivir en una variedad de hábitats, desde bosques densos hasta tundras árticas.'
          },
          {
            'funFact':
                'Los osos tienen una excelente memoria espacial y pueden recordar la ubicación de recursos clave, como fuentes de alimento y agua.'
          },
          {
            'funFact':
                'Los osos pueden ser tanto diurnos como nocturnos, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Los osos son muy protectores con sus crías y pueden ser agresivos si perciben una amenaza.'
          },
          {
            'funFact':
                'Los osos pueden tener una amplia variedad de vocalizaciones, que incluyen gruñidos, bufidos, gemidos y rugidos.'
          },
          {
            'funFact':
                'Los osos pueden ser entrenados para realizar una variedad de comportamientos en cautiverio, pero siempre deben tratarse con respeto y cautela debido a su naturaleza salvaje.'
          },
          {
            'funFact':
                'Los osos tienen una mandíbula poderosa y dientes afilados que les permiten morder y desgarrar la carne de sus presas.'
          },
          {
            'funFact':
                'Los osos tienen una excelente capacidad de natación y pueden cruzar ríos y lagos con facilidad en busca de alimento.'
          },
          {
            'funFact':
                'Los osos pueden alcanzar velocidades sorprendentes en tierra, especialmente cuando están persiguiendo presas o defendiendo su territorio.'
          },
          {
            'funFact':
                'Los osos pueden entrar en conflicto con los humanos cuando se acercan a las áreas habitadas en busca de alimento, lo que a veces resulta en ataques.'
          },
          {
            'funFact':
                'Los osos pardos pueden hibernar durante varios meses durante el invierno, mientras que otras especies pueden hibernar por períodos más cortos o no hibernar en absoluto.'
          },
          {
            'funFact':
                'Los osos polares son excelentes nadadores y pueden viajar largas distancias en el mar en busca de comida.'
          },
          {
            'funFact':
                'Los osos pandas gigantes dependen en gran medida del bambú como fuente principal de alimento y pueden consumir hasta 30 kilogramos de bambú por día.'
          },
          {
            'funFact':
                'Los osos pardos son omnívoros y su dieta puede incluir una variedad de alimentos, como frutas, bayas, insectos, peces y mamíferos pequeños.'
          },
          {
            'funFact':
                'Los osos negros son excelentes escaladores y pueden trepar árboles con facilidad para escapar de los depredadores o buscar alimento.'
          },
          {
            'funFact':
                'Los osos polares tienen una capa de grasa gruesa y pelaje denso que les ayuda a mantenerse calientes en el frío ártico.'
          },
          {
            'funFact':
                'Los osos son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Los osos tienen una lengua áspera que les ayuda a raspar la carne de los huesos y extraer insectos de los troncos de los árboles.'
          },
          {
            'funFact':
                'Los osos pueden utilizar una variedad de técnicas de caza, que incluyen acechar, emboscar y perseguir a sus presas.'
          },
          {
            'funFact':
                'Los osos pueden acumular grandes reservas de grasa antes de hibernar para proporcionarles energía durante los meses de inactividad.'
          },
          {
            'funFact':
                'Los osos pueden tener una amplia variedad de comportamientos sociales, que incluyen jugar, pelear y comunicarse entre sí.'
          },
          {
            'funFact':
                'Los osos tienen una excelente memoria espacial y pueden recordar la ubicación de recursos clave, como fuentes de alimento y agua.'
          },
          {
            'funFact':
                'Los osos son muy protectores con sus crías y pueden ser agresivos si perciben una amenaza.'
          },
          {
            'funFact':
                'Los osos pueden tener una amplia variedad de vocalizaciones, que incluyen gruñidos, bufidos, gemidos y rugidos.'
          },
          {
            'funFact':
                'Los osos pueden ser entrenados para realizar una variedad de comportamientos en cautiverio, pero siempre deben tratarse con respeto y cautela debido a su naturaleza salvaje.'
          },
          {
            'funFact':
                'Los osos tienen una mandíbula poderosa y dientes afilados que les permiten morder y desgarrar la carne de sus presas.'
          },
          {
            'funFact':
                'Los osos tienen una excelente capacidad de natación y pueden cruzar ríos y lagos con facilidad en busca de alimento.'
          },
          {
            'funFact':
                'Los osos pueden alcanzar velocidades sorprendentes en tierra, especialmente cuando están persiguiendo presas o defendiendo su territorio.'
          },
          {
            'funFact':
                'Los osos pueden entrar en conflicto con los humanos cuando se acercan a las áreas habitadas en busca de alimento, lo que a veces resulta en ataques.'
          },
          {
            'funFact':
                'Los osos pardos pueden hibernar durante varios meses durante el invierno, mientras que otras especies pueden hibernar por períodos más cortos o no hibernar en absoluto.'
          },
          {
            'funFact':
                'Los osos polares son excelentes nadadores y pueden viajar largas distancias en el mar en busca de comida.'
          },
          {
            'funFact':
                'Los osos pandas gigantes dependen en gran medida del bambú como fuente principal de alimento y pueden consumir hasta 30 kilogramos de bambú por día.'
          },
          {
            'funFact':
                'Los osos pardos son omnívoros y su dieta puede incluir una variedad de alimentos, como frutas, bayas, insectos, peces y mamíferos pequeños.'
          },
          {
            'funFact':
                'Los osos negros son excelentes escaladores y pueden trepar árboles con facilidad para escapar de los depredadores o buscar alimento.'
          },
          {
            'funFact':
                'Los osos polares tienen una capa de grasa gruesa y pelaje denso que les ayuda a mantenerse calientes en el frío ártico.'
          },
          {
            'funFact':
                'Los osos son animales muy curiosos y pueden investigar objetos extraños en su entorno.'
          },
          {
            'funFact':
                'Los osos tienen una lengua áspera que les ayuda a raspar la carne de los huesos y extraer insectos de los troncos de los árboles.'
          },
          {
            'funFact':
                'Los osos pueden utilizar una variedad de técnicas de caza, que incluyen acechar, emboscar y perseguir a sus presas.'
          },
        ];
        break;
      case 'Águila':
        funFacts = [
          {
            'funFact':
                'Las águilas son aves rapaces pertenecientes a la familia Accipitridae y al género Aquila, que incluye varias especies grandes y poderosas.'
          },
          {
            'funFact':
                'Las águilas son conocidas por su aguda visión, fuertes garras y pico afilado, que les permiten cazar presas con precisión.'
          },
          {
            'funFact':
                'Existen alrededor de 60 especies de águilas que se encuentran en todo el mundo, con una distribución que abarca desde las regiones árticas hasta las selvas tropicales.'
          },
          {
            'funFact':
                'Las águilas son aves de presa diurnas y se alimentan principalmente de mamíferos pequeños, aves, reptiles y peces.'
          },
          {
            'funFact':
                'Las águilas son conocidas por su capacidad para cazar presas mucho más grandes que ellas mismas, incluyendo ciervos, cabras montesas y monos.'
          },
          {
            'funFact':
                'Las águilas tienen una vista excepcionalmente aguda y pueden detectar presas desde grandes distancias mientras planean en el aire.'
          },
          {
            'funFact':
                'Las águilas tienen una envergadura impresionante, que puede alcanzar hasta 2.5 metros en algunas especies.'
          },
          {
            'funFact':
                'Las águilas son expertas en el vuelo planeado y pueden permanecer en el aire durante largos períodos de tiempo sin batir las alas.'
          },
          {
            'funFact':
                'Las águilas construyen grandes nidos en árboles, acantilados o en el suelo, utilizando ramas, hierbas y otros materiales disponibles.'
          },
          {
            'funFact':
                'Las águilas son animales territoriales y pueden defender agresivamente sus territorios de intrusos.'
          },
          {
            'funFact':
                'Las águilas son conocidas por su gran longevidad, con algunas especies viviendo hasta 30 años en la naturaleza.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del oído agudo que les ayuda a localizar presas y detectar posibles peligros.'
          },
          {
            'funFact':
                'Las águilas juveniles suelen tener un plumaje de color marrón o moteado, que se aclara a medida que maduran.'
          },
          {
            'funFact':
                'Las águilas adultas suelen tener plumajes oscuros en la parte superior y blancos en la parte inferior, lo que les ayuda a camuflarse mientras cazan desde arriba.'
          },
          {
            'funFact':
                'Las águilas tienen una dieta variada que puede incluir desde mamíferos pequeños hasta peces capturados en vuelo sobre el agua.'
          },
          {
            'funFact':
                'Las águilas son aves monógamas y forman parejas que pueden durar toda la vida.'
          },
          {
            'funFact':
                'Las águilas ponen de uno a tres huevos en cada nidada, que son incubados por ambos padres durante aproximadamente un mes.'
          },
          {
            'funFact':
                'Las águilas recién nacidas son conocidas como pollos y son alimentadas por sus padres con presas regurgitadas.'
          },
          {
            'funFact':
                'Las águilas juveniles pueden permanecer en el nido durante varios meses antes de aventurarse a volar y cazar por sí mismas.'
          },
          {
            'funFact':
                'Las águilas tienen un vuelo poderoso y ágil que les permite cazar presas en movimiento y maniobrar hábilmente en el aire.'
          },
          {
            'funFact':
                'Las águilas pueden alcanzar altitudes impresionantes durante el vuelo, lo que les permite explorar grandes áreas en busca de presas.'
          },
          {
            'funFact':
                'Las águilas tienen una garra afilada en cada pie que utilizan para sujetar y matar a sus presas.'
          },
          {
            'funFact':
                'Las águilas suelen cazar en solitario, pero a veces pueden formar grupos pequeños para cazar presas grandes o defender su territorio.'
          },
          {
            'funFact':
                'Las águilas son conocidas por su habilidad para robar presas de otras aves rapaces, como halcones y buitres.'
          },
          {
            'funFact':
                'Las águilas tienen una vista excepcionalmente aguda que les permite ver detalles minúsculos en el suelo desde grandes alturas.'
          },
          {
            'funFact':
                'Las águilas suelen anidar en lugares elevados y protegidos, como acantilados rocosos o árboles altos.'
          },
          {
            'funFact':
                'Las águilas son animales muy adaptativos y pueden habitar una variedad de hábitats, desde bosques hasta desiertos y tundras.'
          },
          {
            'funFact':
                'Las águilas juveniles pueden tardar varios años en desarrollar el plumaje completo de un adulto y alcanzar la madurez sexual.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del olfato relativamente pobre en comparación con su aguda vista y oído.'
          },
          {
            'funFact':
                'Las águilas son cazadoras eficientes y pueden capturar presas mucho más grandes que ellas mismas con facilidad.'
          },
          {
            'funFact':
                'Las águilas son animales muy territoriales y pueden luchar ferozmente con otros individuos por el control de un área de caza.'
          },
          {
            'funFact':
                'Las águilas tienen una amplia variedad de vocalizaciones, que incluyen chillidos, gritos y gruñidos.'
          },
          {
            'funFact':
                'Las águilas pueden ser entrenadas para cazar presas en colaboración con los humanos, una práctica conocida como cetrería.'
          },
          {
            'funFact':
                'Las águilas tienen un vuelo majestuoso y pueden planear en el aire durante largos períodos de tiempo sin esfuerzo.'
          },
          {
            'funFact':
                'Las águilas son símbolos de poder, libertad y coraje en muchas culturas de todo el mundo.'
          },
          {
            'funFact':
                'Las águilas pueden ser muy selectivas en la elección de su pareja y pueden realizar elaboradas exhibiciones de cortejo para atraer a un compañero.'
          },
          {
            'funFact':
                'Las águilas son depredadores de la cima de la cadena alimentaria y tienen pocos depredadores naturales.'
          },
          {
            'funFact':
                'Las águilas pueden volar a velocidades sorprendentes, alcanzando hasta 120 kilómetros por hora durante el vuelo de caza.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del equilibrio excepcional que les permite mantenerse estables en el aire incluso en condiciones de viento fuerte.'
          },
          {
            'funFact':
                'Las águilas pueden recorrer grandes distancias durante la migración estacional en busca de alimento y condiciones climáticas más favorables.'
          },
          {
            'funFact':
                'Las águilas tienen un instinto de caza muy desarrollado y pueden detectar presas incluso cuando están ocultas bajo la vegetación.'
          },
          {
            'funFact':
                'Las águilas son animales muy adaptables y pueden sobrevivir en una variedad de hábitats, desde montañas hasta humedales y áreas urbanas.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del olfato relativamente pobre en comparación con su aguda vista y oído.'
          },
          {
            'funFact':
                'Las águilas son cazadoras eficientes y pueden capturar presas mucho más grandes que ellas mismas con facilidad.'
          },
          {
            'funFact':
                'Las águilas son animales muy territoriales y pueden luchar ferozmente con otros individuos por el control de un área de caza.'
          },
          {
            'funFact':
                'Las águilas tienen una amplia variedad de vocalizaciones, que incluyen chillidos, gritos y gruñidos.'
          },
          {
            'funFact':
                'Las águilas pueden ser entrenadas para cazar presas en colaboración con los humanos, una práctica conocida como cetrería.'
          },
          {
            'funFact':
                'Las águilas tienen un vuelo majestuoso y pueden planear en el aire durante largos períodos de tiempo sin esfuerzo.'
          },
          {
            'funFact':
                'Las águilas son símbolos de poder, libertad y coraje en muchas culturas de todo el mundo.'
          },
          {
            'funFact':
                'Las águilas pueden ser muy selectivas en la elección de su pareja y pueden realizar elaboradas exhibiciones de cortejo para atraer a un compañero.'
          },
          {
            'funFact':
                'Las águilas son depredadores de la cima de la cadena alimentaria y tienen pocos depredadores naturales.'
          },
          {
            'funFact':
                'Las águilas pueden volar a velocidades sorprendentes, alcanzando hasta 120 kilómetros por hora durante el vuelo de caza.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del equilibrio excepcional que les permite mantenerse estables en el aire incluso en condiciones de viento fuerte.'
          },
          {
            'funFact':
                'Las águilas pueden recorrer grandes distancias durante la migración estacional en busca de alimento y condiciones climáticas más favorables.'
          },
          {
            'funFact':
                'Las águilas tienen un instinto de caza muy desarrollado y pueden detectar presas incluso cuando están ocultas bajo la vegetación.'
          },
          {
            'funFact':
                'Las águilas son animales muy adaptables y pueden sobrevivir en una variedad de hábitats, desde montañas hasta humedales y áreas urbanas.'
          },
          {
            'funFact':
                'Las águilas tienen un sentido del olfato relativamente pobre en comparación con su aguda vista y oído.'
          },
          {
            'funFact':
                'Las águilas son cazadoras eficientes y pueden capturar presas mucho más grandes que ellas mismas con facilidad.'
          },
          {
            'funFact':
                'Las águilas son animales muy territoriales y pueden luchar ferozmente con otros individuos por el control de un área de caza.'
          },
          {
            'funFact':
                'Las águilas tienen una amplia variedad de vocalizaciones, que incluyen chillidos, gritos y gruñidos.'
          },
        ];
        break;
      case 'Mariposa':
        funFacts = [
          {
            'funFact':
                'Las mariposas son insectos del orden Lepidoptera y se caracterizan por sus alas membranosas cubiertas de escamas.'
          },
          {
            'funFact':
                'Existen alrededor de 180,000 especies de mariposas en el mundo, que se encuentran en una amplia variedad de hábitats, desde selvas tropicales hasta desiertos y tundras.'
          },
          {
            'funFact':
                'Las mariposas pasan por cuatro etapas de desarrollo: huevo, larva (oruga), pupa (crisálida) y adulto.'
          },
          {
            'funFact':
                'Las mariposas adultas se alimentan principalmente de néctar de flores, pero algunas especies también pueden alimentarse de frutas podridas, excrementos y otras fuentes de nutrientes.'
          },
          {
            'funFact':
                'Las mariposas son polinizadores importantes y juegan un papel crucial en la reproducción de muchas plantas con flores.'
          },
          {
            'funFact':
                'Las mariposas tienen un ciclo de vida corto, que puede durar desde unas pocas semanas hasta varios meses, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Las mariposas adultas tienen un aparato bucal en forma de espiral que les permite absorber el néctar de las flores.'
          },
          {
            'funFact':
                'Las mariposas se caracterizan por sus colores brillantes y patrones llamativos en las alas, que pueden servir para el camuflaje, la advertencia o el cortejo.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar olores con sus antenas largas y delgadas, que están cubiertas de pequeñas estructuras sensoriales llamadas sensilas.'
          },
          {
            'funFact':
                'Las mariposas pueden mover sus alas de forma independiente, lo que les permite volar en patrones complejos y maniobrar hábilmente en el aire.'
          },
          {
            'funFact':
                'Las mariposas tienen un sistema de vuelo muy eficiente y pueden viajar largas distancias durante la migración estacional.'
          },
          {
            'funFact':
                'Las mariposas macho suelen ser más coloridas que las hembras y pueden utilizar sus colores brillantes en el cortejo.'
          },
          {
            'funFact':
                'Las mariposas hembra ponen sus huevos en plantas hospederas específicas, donde las larvas recién nacidas se alimentan de las hojas.'
          },
          {
            'funFact':
                'Las mariposas pasan por una metamorfosis completa durante su desarrollo, en la que cambian completamente de forma y estructura.'
          },
          {
            'funFact':
                'Las mariposas pueden comunicarse entre sí mediante señales visuales, químicas y acústicas.'
          },
          {
            'funFact':
                'Las mariposas tienen una serie de adaptaciones físicas que les ayudan a sobrevivir en su entorno, incluyendo patas delanteras pequeñas y antenas sensibles.'
          },
          {
            'funFact':
                'Las mariposas pueden regenerar parte de sus alas si son dañadas, gracias a células madre especializadas que se encuentran en la base de las escamas.'
          },
          {
            'funFact':
                'Las mariposas son conocidas por su comportamiento de mudar de piel, en el que se deshacen de la capa exterior de la cutícula para crecer.'
          },
          {
            'funFact':
                'Las mariposas pueden ser solitarias o migratorias, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Las mariposas monarca son conocidas por su migración anual desde América del Norte hasta México, donde pasan el invierno en grandes colonias.'
          },
          {
            'funFact':
                'Las mariposas tienen una variedad de depredadores naturales, que incluyen aves, arañas, reptiles y mamíferos.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar la luz ultravioleta con sus ojos compuestos, lo que les ayuda a encontrar néctar en las flores.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar cambios en la temperatura y la humedad con receptores especializados en sus antenas.'
          },
          {
            'funFact':
                'Las mariposas tienen una serie de adaptaciones comportamentales que les permiten evitar depredadores, como el vuelo errático y la rápida huida.'
          },
          {
            'funFact':
                'Las mariposas pueden utilizar una variedad de estrategias de camuflaje para evitar ser detectadas por los depredadores, como el mimetismo y la cripsis.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar feromonas liberadas por individuos del sexo opuesto a largas distancias, lo que les permite encontrar pareja para el apareamiento.'
          },
          {
            'funFact':
                'Las mariposas tienen una tasa metabólica alta que les permite mantener una temperatura corporal adecuada para el vuelo.'
          },
          {
            'funFact':
                'Las mariposas pueden migrar grandes distancias durante su vida adulta en busca de alimento, reproducción y refugio.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar y evitar plantas tóxicas utilizando el sentido del gusto y el olfato.'
          },
          {
            'funFact':
                'Las mariposas tienen una amplia variedad de formas y tamaños, que van desde pequeñas especies que apenas superan los centímetros hasta grandes especies que pueden tener envergaduras de hasta 30 centímetros.'
          },
          {
            'funFact':
                'Las mariposas pueden ser una fuente importante de alimento para otros animales, incluyendo aves, murciélagos y arañas.'
          },
          {
            'funFact':
                'Las mariposas pueden percibir el campo magnético terrestre con receptores especializados en sus antenas, lo que les ayuda a navegar durante la migración.'
          },
          {
            'funFact':
                'Las mariposas pueden tener una serie de comportamientos territoriales, como defender un área de alimentación o cortejar a una pareja.'
          },
          {
            'funFact':
                'Las mariposas pueden utilizar una variedad de recursos para reproducirse, incluyendo plantas hospederas específicas y hábitats de reproducción adecuados.'
          },
          {
            'funFact':
                'Las mariposas pueden ser criadas en cautiverio para fines educativos, de conservación o comerciales, como la producción de mariposas vivas para eventos.'
          },
          {
            'funFact':
                'Las mariposas pueden ser polillas, que son insectos similares pero pertenecen a una familia diferente (Heterocera).'
          },
          {
            'funFact':
                'Las mariposas pueden tener una variedad de colores y patrones en las alas, que pueden variar según la especie, el sexo y la región geográfica.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar cambios en la presión atmosférica con receptores especializados en sus antenas, lo que les ayuda a prever cambios en el clima.'
          },
          {
            'funFact':
                'Las mariposas pueden regenerar parte de sus alas si son dañadas, gracias a células madre especializadas que se encuentran en la base de las escamas.'
          },
          {
            'funFact':
                'Las mariposas pueden ser criadas en cautiverio para fines educativos, de conservación o comerciales, como la producción de mariposas vivas para eventos.'
          },
          {
            'funFact':
                'Las mariposas pueden ser polillas, que son insectos similares pero pertenecen a una familia diferente (Heterocera).'
          },
          {
            'funFact':
                'Las mariposas pueden tener una variedad de colores y patrones en las alas, que pueden variar según la especie, el sexo y la región geográfica.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar cambios en la presión atmosférica con receptores especializados en sus antenas, lo que les ayuda a prever cambios en el clima.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar y evitar plantas tóxicas utilizando el sentido del gusto y el olfato.'
          },
          {
            'funFact':
                'Las mariposas pueden ser una fuente importante de alimento para otros animales, incluyendo aves, murciélagos y arañas.'
          },
          {
            'funFact':
                'Las mariposas pueden percibir el campo magnético terrestre con receptores especializados en sus antenas, lo que les ayuda a navegar durante la migración.'
          },
          {
            'funFact':
                'Las mariposas pueden tener una serie de comportamientos territoriales, como defender un área de alimentación o cortejar a una pareja.'
          },
          {
            'funFact':
                'Las mariposas pueden utilizar una variedad de recursos para reproducirse, incluyendo plantas hospederas específicas y hábitats de reproducción adecuados.'
          },
          {
            'funFact':
                'Las mariposas pueden ser criadas en cautiverio para fines educativos, de conservación o comerciales, como la producción de mariposas vivas para eventos.'
          },
          {
            'funFact':
                'Las mariposas pueden ser polillas, que son insectos similares pero pertenecen a una familia diferente (Heterocera).'
          },
          {
            'funFact':
                'Las mariposas pueden tener una variedad de colores y patrones en las alas, que pueden variar según la especie, el sexo y la región geográfica.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar cambios en la presión atmosférica con receptores especializados en sus antenas, lo que les ayuda a prever cambios en el clima.'
          },
          {
            'funFact':
                'Las mariposas pueden regenerar parte de sus alas si son dañadas, gracias a células madre especializadas que se encuentran en la base de las escamas.'
          },
          {
            'funFact':
                'Las mariposas pueden ser criadas en cautiverio para fines educativos, de conservación o comerciales, como la producción de mariposas vivas para eventos.'
          },
          {
            'funFact':
                'Las mariposas pueden ser polillas, que son insectos similares pero pertenecen a una familia diferente (Heterocera).'
          },
          {
            'funFact':
                'Las mariposas pueden tener una variedad de colores y patrones en las alas, que pueden variar según la especie, el sexo y la región geográfica.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar cambios en la presión atmosférica con receptores especializados en sus antenas, lo que les ayuda a prever cambios en el clima.'
          },
          {
            'funFact':
                'Las mariposas pueden detectar y evitar plantas tóxicas utilizando el sentido del gusto y el olfato.'
          },
          {
            'funFact':
                'Las mariposas pueden ser una fuente importante de alimento para otros animales, incluyendo aves, murciélagos y arañas.'
          },
          {
            'funFact':
                'Las mariposas pueden percibir el campo magnético terrestre con receptores especializados en sus antenas, lo que les ayuda a navegar durante la migración.'
          },
        ];
        break;
      case 'Serpiente':
        funFacts = [
          {
            'funFact':
                'Las serpientes son reptiles sin patas pertenecientes al suborden Serpentes y se encuentran distribuidas en todo el mundo, excepto en la Antártida.'
          },
          {
            'funFact':
                'Existen más de 3,000 especies de serpientes, que varían en tamaño, color, hábitat y comportamiento.'
          },
          {
            'funFact':
                'Las serpientes son carnívoras y se alimentan principalmente de presas vivas, como roedores, aves, peces, anfibios e insectos.'
          },
          {
            'funFact':
                'Las serpientes no tienen párpados móviles y no pueden cerrar completamente los ojos, por lo que duermen con los ojos abiertos.'
          },
          {
            'funFact':
                'Las serpientes capturan a sus presas usando una combinación de movimientos rápidos, camuflaje y veneno en el caso de las especies venenosas.'
          },
          {
            'funFact':
                'Las serpientes venenosas tienen colmillos especializados para inyectar veneno en sus presas o en defensa propia.'
          },
          {
            'funFact':
                'Algunas serpientes no venenosas pueden matar a sus presas por constricción, envolviéndolas con su cuerpo y apretando hasta asfixiarlas.'
          },
          {
            'funFact':
                'Las serpientes pueden tener dientes afilados y curvados hacia atrás para sujetar a sus presas mientras las tragan enteras.'
          },
          {
            'funFact':
                'Las serpientes tienen mandíbulas móviles y articulaciones elásticas que les permiten tragar presas mucho más grandes que su cabeza.'
          },
          {
            'funFact':
                'Las serpientes tienen una lengua bifurcada que utilizan para detectar olores en el aire y rastrear presas.'
          },
          {
            'funFact':
                'Las serpientes mudan su piel periódicamente a medida que crecen, desprendiéndose de la capa externa en un proceso llamado muda.'
          },
          {
            'funFact':
                'Las serpientes pueden pasar largos períodos sin comer después de una comida grande, ya que su metabolismo es lento.'
          },
          {
            'funFact':
                'Las serpientes pueden vivir en una variedad de hábitats, que incluyen bosques, selvas, desiertos, praderas, pantanos y océanos.'
          },
          {
            'funFact':
                'Algunas serpientes son venenosas y su veneno puede causar desde dolor y hinchazón hasta parálisis y muerte en humanos.'
          },
          {
            'funFact':
                'La mayoría de las serpientes no son agresivas hacia los humanos y prefieren huir cuando se les molesta, pero pueden morder en defensa propia.'
          },
          {
            'funFact':
                'Las serpientes pueden detectar vibraciones en el suelo a través de su cuerpo y pueden sentir la presencia de depredadores o presas cercanas.'
          },
          {
            'funFact':
                'Las serpientes pueden regular su temperatura corporal tomando el sol para calentarse o buscando refugio en lugares frescos para enfriarse.'
          },
          {
            'funFact':
                'Las serpientes hembra ponen huevos en nidos o cavidades protegidas, o pueden dar a luz a crías vivas, dependiendo de la especie.'
          },
          {
            'funFact':
                'Las serpientes pueden comunicarse entre sí mediante una variedad de comportamientos, incluyendo movimientos corporales, posturas y vocalizaciones.'
          },
          {
            'funFact':
                'Las serpientes tienen una mala vista y dependen en gran medida del sentido del olfato y la vibración para localizar presas y evitar depredadores.'
          },
          {
            'funFact':
                'Las serpientes pueden ser solitarias o vivir en grupos, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Las serpientes pueden vivir durante varios años o incluso décadas en la naturaleza, dependiendo de factores como el tamaño, la especie y el hábitat.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas que les ayudan a sobrevivir en su entorno, incluyendo escamas que les permiten deslizarse suavemente sobre superficies ásperas.'
          },
          {
            'funFact':
                'Las serpientes pueden ser venenosas o no venenosas, y la presencia de colmillos o glándulas venenosas varía según la especie.'
          },
          {
            'funFact':
                'Las serpientes venenosas suelen tener colores brillantes o patrones llamativos en su piel para advertir a los depredadores potenciales de su peligro.'
          },
          {
            'funFact':
                'Las serpientes no venenosas pueden tener una variedad de colores y patrones en su piel, que pueden servir para camuflarse con su entorno.'
          },
          {
            'funFact':
                'Las serpientes pueden detectar olores con su lengua bifurcada y órganos sensoriales especiales en el paladar.'
          },
          {
            'funFact':
                'Las serpientes son importantes para el equilibrio ecológico como depredadores de poblaciones de roedores y otras especies de presas.'
          },
          {
            'funFact':
                'Las serpientes pueden vivir en una variedad de hábitats, que incluyen bosques, selvas, desiertos, praderas, pantanos y océanos.'
          },
          {
            'funFact':
                'Las serpientes son valiosas para los humanos como controladores naturales de plagas y como fuentes de alimento y medicina en algunas culturas.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de depredadores naturales, que incluyen aves rapaces, mamíferos carnívoros y otros reptiles.'
          },
          {
            'funFact':
                'Las serpientes pueden tener una variedad de comportamientos defensivos, incluyendo mordeduras, siseos, camuflaje y mimetismo.'
          },
          {
            'funFact':
                'Las serpientes pueden tener una variedad de comportamientos reproductivos, incluyendo apareamiento ritualizado, cuidado de los huevos y defensa del nido.'
          },
          {
            'funFact':
                'Las serpientes pueden ser capturadas y criadas en cautiverio para su uso como mascotas, para la investigación científica o para la producción de cuero y carne.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes son conocidas por su capacidad para deslizarse suavemente sobre superficies ásperas utilizando una combinación de movimientos musculares y escamas especializadas.'
          },
          {
            'funFact':
                'Las serpientes pueden ser activas durante el día o la noche, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Las serpientes pueden regular su temperatura corporal tomando el sol para calentarse o buscando refugio en lugares frescos para enfriarse.'
          },
          {
            'funFact':
                'Las serpientes pueden cambiar de color para adaptarse a su entorno, lo que les permite camuflarse con su entorno y evitar a los depredadores.'
          },
          {
            'funFact':
                'Las serpientes pueden regenerar parte de su cola si es dañada o cortada, gracias a un proceso llamado autotomía.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes son importantes para el equilibrio ecológico como depredadores de poblaciones de roedores y otras especies de presas.'
          },
          {
            'funFact':
                'Las serpientes pueden vivir durante varios años o incluso décadas en la naturaleza, dependiendo de factores como el tamaño, la especie y el hábitat.'
          },
          {
            'funFact':
                'Las serpientes pueden ser capturadas y criadas en cautiverio para su uso como mascotas, para la investigación científica o para la producción de cuero y carne.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de depredadores naturales, que incluyen aves rapaces, mamíferos carnívoros y otros reptiles.'
          },
          {
            'funFact':
                'Las serpientes pueden tener una variedad de comportamientos defensivos, incluyendo mordeduras, siseos, camuflaje y mimetismo.'
          },
          {
            'funFact':
                'Las serpientes pueden tener una variedad de comportamientos reproductivos, incluyendo apareamiento ritualizado, cuidado de los huevos y defensa del nido.'
          },
          {
            'funFact':
                'Las serpientes pueden ser capturadas y criadas en cautiverio para su uso como mascotas, para la investigación científica o para la producción de cuero y carne.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes son conocidas por su capacidad para deslizarse suavemente sobre superficies ásperas utilizando una combinación de movimientos musculares y escamas especializadas.'
          },
          {
            'funFact':
                'Las serpientes pueden ser activas durante el día o la noche, dependiendo de la especie y las condiciones ambientales.'
          },
          {
            'funFact':
                'Las serpientes pueden regular su temperatura corporal tomando el sol para calentarse o buscando refugio en lugares frescos para enfriarse.'
          },
          {
            'funFact':
                'Las serpientes pueden cambiar de color para adaptarse a su entorno, lo que les permite camuflarse con su entorno y evitar a los depredadores.'
          },
          {
            'funFact':
                'Las serpientes pueden regenerar parte de su cola si es dañada o cortada, gracias a un proceso llamado autotomía.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde desiertos hasta selvas.'
          },
          {
            'funFact':
                'Las serpientes son importantes para el equilibrio ecológico como depredadores de poblaciones de roedores y otras especies de presas.'
          },
        ];
        break;
      case 'Mapache':
        funFacts = [
          {
            'funFact':
                'Los mapaches, también conocidos como "zarigüeyas", son mamíferos omnívoros pertenecientes a la familia Procyonidae y al género Procyon.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por sus máscaras faciales distintivas y sus colas anilladas, así como por su pelaje grisáceo o marrón.'
          },
          {
            'funFact':
                'Existen varias especies de mapaches, pero el más común es el mapache común (Procyon lotor), nativo de América del Norte.'
          },
          {
            'funFact':
                'Los mapaches son animales muy inteligentes y adaptables, lo que les permite sobrevivir en una amplia variedad de hábitats, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son omnívoros y se alimentan de una variedad de alimentos, incluyendo frutas, bayas, nueces, insectos, pequeños mamíferos, aves, huevos y carroña.'
          },
          {
            'funFact':
                'Los mapaches son animales nocturnos y pasan la mayor parte del día descansando en madrigueras o refugios arbóreos.'
          },
          {
            'funFact':
                'Los mapaches son excelentes trepadores y pueden escalar árboles con facilidad utilizando sus garras afiladas y sus habilidades agiles.'
          },
          {
            'funFact':
                'Los mapaches tienen una capacidad manual notable y pueden manipular objetos con destreza utilizando sus patas delanteras.'
          },
          {
            'funFact':
                'Los mapaches tienen una vista y oído agudos, lo que les permite detectar presas y peligros fácilmente.'
          },
          {
            'funFact':
                'Los mapaches tienen una reputación de ser animales astutos y pueden resolver problemas simples para obtener comida o escapar de peligros.'
          },
          {
            'funFact':
                'Los mapaches tienen una esperanza de vida promedio de 2 a 3 años en la naturaleza, aunque algunos individuos pueden vivir hasta 5 años o más en cautiverio.'
          },
          {
            'funFact':
                'Los mapaches son animales solitarios pero pueden formar grupos sociales temporales, especialmente durante la época de reproducción o la crianza de los jóvenes.'
          },
          {
            'funFact':
                'Los mapaches machos suelen ser más grandes que las hembras, pero por lo demás tienen un aspecto similar.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por lavar su comida en el agua antes de comerla, aunque en realidad están manipulando el alimento para explorarlo mejor con sus manos.'
          },
          {
            'funFact':
                'Los mapaches pueden tener una variedad de vocalizaciones, que incluyen gruñidos, siseos, chillidos y chasquidos.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas que les permiten sobrevivir en ambientes urbanos, incluyendo la capacidad de abrir bolsas de basura y contenedores de alimentos.'
          },
          {
            'funFact':
                'Los mapaches pueden transmitir enfermedades zoonóticas a los humanos, incluyendo la rabia y la leptospirosis, por lo que es importante mantener distancia y no alimentarlos.'
          },
          {
            'funFact':
                'Los mapaches pueden sufrir de obesidad en áreas urbanas donde tienen acceso a alimentos ricos en calorías, como basura y comida de mascotas.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su capacidad para descomponer sistemas de basura y causar daños a propiedades en busca de alimentos.'
          },
          {
            'funFact':
                'Los mapaches tienen una gestación de alrededor de 60 días y dan a luz a camadas de 2 a 5 crías, llamadas "mapachitos" o "cachorros".'
          },
          {
            'funFact':
                'Los mapaches recién nacidos son ciegos y dependen completamente de su madre para alimentarse y cuidarlos.'
          },
          {
            'funFact':
                'Los mapaches jóvenes comienzan a aventurarse fuera del nido a las pocas semanas de edad y aprenden habilidades de supervivencia de su madre.'
          },
          {
            'funFact':
                'Los mapaches son animales sociales y pueden comunicarse entre sí mediante señales visuales, químicas y vocales.'
          },
          {
            'funFact':
                'Los mapaches tienen una capacidad de aprendizaje notable y pueden adaptarse a cambios en su entorno rápidamente.'
          },
          {
            'funFact':
                'Los mapaches son cazadores oportunistas y pueden aprovechar una variedad de fuentes de alimentos disponibles en su hábitat.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su curiosidad y pueden investigar cualquier objeto nuevo en su entorno.'
          },
          {
            'funFact':
                'Los mapaches tienen una memoria excelente y pueden recordar la ubicación de fuentes de alimentos y refugios durante largos períodos de tiempo.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su habilidad para abrir cierres y contenedores utilizando sus patas delanteras hábiles.'
          },
          {
            'funFact':
                'Los mapaches pueden ser entrenados para realizar trucos simples y pueden ser mascotas cariñosas y afectuosas en entornos domésticos adecuados.'
          },
          {
            'funFact':
                'Los mapaches son importantes para los ecosistemas como dispersores de semillas y controladores de poblaciones de insectos y pequeños mamíferos.'
          },
          {
            'funFact':
                'Los mapaches son comunes en las culturas indígenas de América del Norte y América Central, donde han sido objeto de mitos y leyendas.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son animales sociales y pueden formar grupos familiares unidos, especialmente durante la crianza de los jóvenes.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son animales curiosos y pueden investigar cualquier objeto nuevo en su entorno utilizando su aguda inteligencia y habilidades manuales.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su capacidad para abrir cierres y contenedores utilizando sus patas delanteras hábiles.'
          },
          {
            'funFact':
                'Los mapaches pueden ser entrenados para realizar trucos simples y pueden ser mascotas cariñosas y afectuosas en entornos domésticos adecuados.'
          },
          {
            'funFact':
                'Los mapaches son importantes para los ecosistemas como dispersores de semillas y controladores de poblaciones de insectos y pequeños mamíferos.'
          },
          {
            'funFact':
                'Los mapaches son comunes en las culturas indígenas de América del Norte y América Central, donde han sido objeto de mitos y leyendas.'
          },
          {
            'funFact':
                'Los mapaches son animales sociales y pueden formar grupos familiares unidos, especialmente durante la crianza de los jóvenes.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son animales curiosos y pueden investigar cualquier objeto nuevo en su entorno utilizando su aguda inteligencia y habilidades manuales.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su capacidad para abrir cierres y contenedores utilizando sus patas delanteras hábiles.'
          },
          {
            'funFact':
                'Los mapaches pueden ser entrenados para realizar trucos simples y pueden ser mascotas cariñosas y afectuosas en entornos domésticos adecuados.'
          },
          {
            'funFact':
                'Los mapaches son importantes para los ecosistemas como dispersores de semillas y controladores de poblaciones de insectos y pequeños mamíferos.'
          },
          {
            'funFact':
                'Los mapaches son comunes en las culturas indígenas de América del Norte y América Central, donde han sido objeto de mitos y leyendas.'
          },
          {
            'funFact':
                'Los mapaches son animales sociales y pueden formar grupos familiares unidos, especialmente durante la crianza de los jóvenes.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son animales curiosos y pueden investigar cualquier objeto nuevo en su entorno utilizando su aguda inteligencia y habilidades manuales.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su capacidad para abrir cierres y contenedores utilizando sus patas delanteras hábiles.'
          },
          {
            'funFact':
                'Los mapaches pueden ser entrenados para realizar trucos simples y pueden ser mascotas cariñosas y afectuosas en entornos domésticos adecuados.'
          },
          {
            'funFact':
                'Los mapaches son importantes para los ecosistemas como dispersores de semillas y controladores de poblaciones de insectos y pequeños mamíferos.'
          },
          {
            'funFact':
                'Los mapaches son comunes en las culturas indígenas de América del Norte y América Central, donde han sido objeto de mitos y leyendas.'
          },
          {
            'funFact':
                'Los mapaches son animales sociales y pueden formar grupos familiares unidos, especialmente durante la crianza de los jóvenes.'
          },
          {
            'funFact':
                'Los mapaches tienen una serie de adaptaciones físicas y comportamentales que les permiten sobrevivir en una variedad de entornos, desde bosques hasta áreas urbanas.'
          },
          {
            'funFact':
                'Los mapaches son animales curiosos y pueden investigar cualquier objeto nuevo en su entorno utilizando su aguda inteligencia y habilidades manuales.'
          },
          {
            'funFact':
                'Los mapaches son conocidos por su capacidad para abrir cierres y contenedores utilizando sus patas delanteras hábiles.'
          },
          {
            'funFact':
                'Los mapaches pueden ser entrenados para realizar trucos simples y pueden ser mascotas cariñosas y afectuosas en entornos domésticos adecuados.'
          },
          {
            'funFact':
                'Los mapaches son importantes para los ecosistemas como dispersores de semillas y controladores de poblaciones de insectos y pequeños mamíferos.'
          },
          {
            'funFact':
                'Los mapaches son comunes en las culturas indígenas de América del Norte y América Central, donde han sido objeto de mitos y leyendas.'
          },
        ];
        break;
    }

    for (var fact in funFacts) {
      await db.insert('funfacts', {
        'animalID': animalID,
        'funFact': fact['funFact'],
        'state': 0,
      });
    }
  }

  static Future<void> _addFavoriteAnimals(Database db) async {
    await db.insert('favorite_animals', {'userID': 'admin001', 'animalID': 1});
    await db.insert('favorite_animals', {'userID': 'admin001', 'animalID': 2});
  }

  
}
