import 'dart:io';
import 'timing/wait_time.dart';

//Fazendo um bate papo com assincronismo
void main() async {
  String usuario = '';
  var a = true;

  print('Bem vindo ao teste Joãozinho');
  await SimulacaoBotClock().clock(1);

  print('Começa o CHAT:');

  do {
    try {
      usuario = stdin.readLineSync().toString();
      print('Digitando...');
      await SimulacaoBotClock().clock(2);
      if (usuario.contains('xau') ||
          usuario.contains('Xau') ||
          usuario.contains('Adeus') ||
          usuario.contains('adeus')) {
        a = false;
        print('Até a proxima!!');
      } else if (ContadorMensagens(usuario).isThisResposta()) {
        ContadorMensagens(usuario).respostas();
        await SimulacaoBotClock().clock(2);
      } else if (ContadorMensagens(usuario).isThisResposta2()) {
        ContadorMensagens(usuario).respostas();
        await SimulacaoBotClock().clock(2);
      } else {
        await SimulacaoBotClock().clock(2);
        print('Nao fui treinado pra isso!!');
      }
    } catch (e) {
      print(e);
    }
  } while (a);

  print('Chat Encerrado');
}

class ContadorMensagens {
  String fala1 = 'Bom dia, grupo!';
  String fala2 = 'Suave, e vc?';
  String pergunta;
  bool isResposta = false;
  bool isResposta2 = false;

  ContadorMensagens(this.pergunta);

  bool isThisResposta() {
    if (pergunta.contains('Bom') || pergunta.contains('bom')) {
      isResposta = true;
    }
    return isResposta;
  }

  bool isThisResposta2() {
    if (pergunta.contains('Suave') || pergunta.contains('suave')) {
      isResposta2 = true;
    }
    return isResposta2;
  }

  respostas() {
    if (pergunta == fala1) {
      String _resposta = 'Bom dia! Tudo bem?';
      print(_resposta);
    } else if (pergunta == fala2) {
      String _resposta = 'Certinho.';
      print(_resposta);
    } else {
      print('Nao tenho essa resposta!!');
    }
  }
}
