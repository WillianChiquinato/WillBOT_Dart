import 'dart:io';

//implementar o Timing!

class TimeQuestions {
  String helloW = 'Oi';
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  String question;
  DateTime date = DateTime.now();
  String willBot = 'WillBOT:\n';
  bool isThisATimeQuestion = false;
  bool isThisHello = false;

  TimeQuestions(this.question);

  bool isThisTime() {
    //verificar se estamos numa pergunta sobre Tempo
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }

  bool helloWorld() {
    if (question.contains('Oi') || question.contains('oi')) {
      isThisHello = true;
    }
    return isThisHello;
  }

  timeQuestion() {
    if (question == hour) {
      String _botAnswer =
          willBot + ' Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(_botAnswer);
    } else if (question == day) {
      String _botAnswer = willBot + ' Opa! hoje é dia : ${date.day}';
      print(_botAnswer);
    } else if (question == year) {
      String _botAnswer = willBot + ' Opa! estamos em : ${date.year}';
      print(_botAnswer);
    } else if (question == helloW) {
      String _botHello = willBot +
          'Olá, bora usar esse bot incrivel, outra pergunta por favor!!';
      print(_botHello);
    } else {
      unsure();
    }
  }

  unsure() {
    if (question.contains('horas') || question.contains('Horas')) {
      String _botQuestion =
          willBot + ' Não entendi, você quer saber das horas?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = willBot +
            ' Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(_botAnswer);
      } else {
        String _botAnswer = willBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {
      String _botQuestion =
          willBot + ' Não entendi, você quer saber que dia é hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = willBot + ' Beleza, hoje é dia: ${date.day}';
        print(_botAnswer);
      } else {
        String _botAnswer = willBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {
      String _botQuestion =
          willBot + ' Não entendi, você quer saber em que ano estamos?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = willBot +
            ' Beleza, estamos no ano de 2077, a pandemia já está terminando... \n '
                'Brincadeirinha! estamos em : ${date.year}';
        print(_botAnswer);
      } else {
        String _botAnswer = willBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
      //Boas praticas
    } else if (question.contains("Ola") ||
        question.contains("ola") ||
        question.contains("Bom")) {
      String _botAnswer =
          willBot + 'Ola tudo bem? bora aproveitar esse bot incrivel';
      print(_botAnswer);
    } else if (question.contains("Tarde")) {
      String _botAnswer = willBot + 'Ola tudo bem? uma boa tarde';
      print(_botAnswer);
    } else if (question.contains("Noite")) {
      String _botAnswer = willBot + 'Ola tudo bem? uma otima noite';
      print(_botAnswer);
    }
  }
}
