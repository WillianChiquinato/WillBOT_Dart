import 'dart:async';

void main() async {
  Stream meuStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Contando: $i");
      await Future.delayed(Duration(seconds: interval));
      // Retorno usado quando é Stream, usa-se o yield mas tem a msm funcao que o return
      yield i++;
    }
    print("Saiu do stream");
  }

  //Manipulando a stream;
  //Listen para ler a stream, sem ele nao da pra ler.
  //A stream so sera executada com o subscripition pois ele vai "Ler" a stream;
  StreamSubscription myObservador = meuStream(1).listen((event) {
    if (event.isEven) {
      print('É par essa bosta');
    }
  }, onError: (e) {
    print('Ocorreu um erro');
  });
  //Dando pausas no stream ou manipulando do jeito que quer.
  //Informações vindo de fora, da pra manipular dando pausa e tals, pra nao sobrecarregar o sistema.
  await Future.delayed(Duration(seconds: 2));
  myObservador.pause();
  await Future.delayed(Duration(seconds: 2));
  myObservador.resume();
  await Future.delayed(Duration(seconds: 2));
  myObservador.cancel();

  //Varias Streams, colocando em variaveis;
  //.asBroadcastStream(), funcao que permite que mais de uma stream seja "Assistidas";
  var willStream = meuStream(2).asBroadcastStream();
  //Nova forma de visualizar o stream
  willStream.map((event) => 'Esta assistindo, o stream2: $event').listen(
    (event) {
      print('Krl');
    },
  );
}
