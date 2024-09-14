import 'dart:async';

class SimulacaoBotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream willBotStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));
      // Retorno usado quando é Stream, usa-se o yield mas tem a msm funcao que o return
      yield i++;
    }
  }
}
