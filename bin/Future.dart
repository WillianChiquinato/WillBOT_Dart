void main() {
  // Objeto assincrono = Objeto que demore mais para o carregamento, entao na linha de execução, ele joga pro ultimo na ultima etapa;
  // then ("E dps"), Buscar informações do tipo FUTURE quando ele finaliza a função, Espera finalizar o future para colher as informações;
  // Usar funcoes com future geralmente para aguardar informações externas para depois executar (CallBack com o servidor por exemplo)
  Future meuFuture = Future(() {
    print('Estamos no future');
    return 30;
  }).then((value) => print('O valor é $value'));

  print(meuFuture);

  // Future.dalayed
  // Future.delayed(Duration(seconds: 3));

  // Funcao com future, quando vc sabe o retorno que essa funcao vai darm vc adiciona <Tipo>
  // Funcao assincrona
  // Await = "Pedir para a funcao esperar o tempo do dalayed", esse delay nao funciona sem o await, sem o "PEDIDO"
  // Habilitando o async para permitir fazer isso, a funcao assincrona
  Future<int> meuFutureFunc() async {
    print('Entrar na funcao delayed teste');

    await Future.delayed(Duration(seconds: 3));
    return 12;
  }
  print(meuFutureFunc);

  // Usando o error caso a cumincação nao é 100%, exceptions e error
  // WhenComplete, ele vai exibir o que tem dentro dele independente da situação, se der erro na future ou nao, igual o FINALLY no tryCatch no Expception;
  // meuFutureFunc()
  //     .then((value) => print('A funcao terá retorno de $value'))
  //     .onError((error, stackTrace) => print('Um erro ocorreu'))
  //     .whenComplete(() => print('A funcao future acabou'));

  // Usando uma forma mais formal do que a tratamento de exceptions acima, uma forma mais direto e objetiva com o TRY;
  Future<int> meuFutureError(int a, int b) async {
    try 
    {
      if (a > b) 
      {
        throw Exception();
      }

      print('Outra funcao assincrona com erro tratado');

      await Future.delayed(Duration(seconds: 2));
      return 50;
    } 
    catch (e) 
    {
      print('Erro indicado: $e');
      return 50;
    } 
    finally 
    {
      print('Final teste com excessões');
    }
  }

  meuFutureError(6, 5).then((value) => print('Valor: $value'));

  print('Saindo do future');
}

