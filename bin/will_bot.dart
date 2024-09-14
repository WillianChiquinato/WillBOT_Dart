import 'dart:io';

import 'questions/time_questions.dart';
import 'timing/wait_time.dart';

void main() async {
  String willBot = 'WillBOT:\n';
  var a = true;
  String usuario = '';

  //Usando no Bot a stream, objetivo: limite de perguntas, se chegar no limite ele para de executar, para nao sobrecarregar;
  //Fazendo um timer pro nosso bot funcionar, com uma stream escutando as informações de fora;
  var meuStream = SimulacaoBotClock().willBotStream(1, 10);
  var observadorStream = meuStream.listen(
    (event) {
      print('             Escutando: $event');
    },
    onDone: () {
      print('WillBot acabou agora, reinicie o bot');
      a = false;
    },
  );

  print('-- Iniciando o WillBOT, aguarde..--');
  print('-- Você terá 10 Segundos de bot no seu plano gratis :) --');
  await SimulacaoBotClock().clock(1);

  print('WillBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await SimulacaoBotClock().clock(2);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(willBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
      await SimulacaoBotClock().clock(1);
    } else if (TimeQuestions(usuario).helloWorld()) {
      //Questao de Hello
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Nova questao;
      //Codigo morto;
    } else {
      await SimulacaoBotClock().clock(1);
      print(willBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(willBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando WillBOT--');
}
