# Pré-requisitos

#### O que é permitido:
- Usar as dependências já adicionadas ao projeto
- Adicionar novas dependências conforme a necessidade, pensando nos pró e contras das novas dependências ao projeto
- Alterar o código fonte base fornecido conforme julgar necessário

#### O que não é permitido:
- Mudar a linguagem e framework de programação
- Quebrar os testes fornecidos no projeto
- Inserir dependências que não são utilizadas

Lembre-se que você deve implementar testes automatizados para os fluxos que achar necessário.

O objetivo desse teste é avaliar:
- organização;
- semântica;
- funcionamento e usabilidade
- uso e abuso das features das linguagens (Dart e Flutter);
- uso do Clean Architecture;
- performance do código;
- testes automatizados.

# Teste

Você precisará criar a tela de listagem de moedas, conforme layout abaixo, consumindo informações do WebSocket para exibir na tela.

![image](https://user-images.githubusercontent.com/3410356/109640440-3e125400-7b2f-11eb-9def-0708948b0b23.png)

## Métodos para serem chamados no WebSocket

A comunicação será feita toda por WebSocket para a exibição dos dados na tela, sendo as chamadas explicadas abaixo.

### ```GetInstrumentId``` - Pegar listagem de Moedas

A chamada de WebSocket retorna varios campos e informações, porém devem ser considerados os campos descritos abaixo.

Exemplo de requisição:

```JavaScript
{"m":0,"i":0,"n":"getInstruments","o":"{}"}
```

Campos a serem utilizados:

```InstrumentId```: Id do par de moedas negociadas 

```Symbol```: Nome do par negociado

```SortIndex```: ordem de exibição do par

Exemplo de retorno:
```Javascript
{
  "m": 0,
  "i": 0,
  "n": "getInstruments",
  "o": "[{\"OMSId\":1,\"InstrumentId\":1,\"Symbol\":\"BTC/BRL\",\"Product1\":1,\"Product1Symbol\":\"BTC\",\"Product2\":2,\"Product2Symbol\":\"BRL\",\"InstrumentType\":\"Standard\",\"VenueInstrumentId\":1,\"VenueId\":1,\"SortIndex\":0,\"SessionStatus\":\"Running\",\"PreviousSessionStatus\":\"Paused\",\"SessionStatusDateTime\":\"2020-07-11T01:27:02.851Z\",\"SelfTradePrevention\":true,\"QuantityIncrement\":1e-8,\"PriceIncrement\":0.001,\"MinimumQuantity\":1e-8,\"MinimumPrice\":0.001,\"VenueSymbol\":\"BTC/BRL\",\"IsDisable\":false,\"MasterDataId\":0,\"PriceCollarThreshold\":0,\"PriceCollarPercent\":0,\"PriceCollarEnabled\":false,\"PriceFloorLimit\":0,\"PriceFloorLimitEnabled\":false,\"PriceCeilingLimit\":0,\"PriceCeilingLimitEnabled\":false,\"CreateWithMarketRunning\":true,\"AllowOnlyMarketMakerCounterParty\":false},{\"OMSId\":1,\"InstrumentId\":2,\"Symbol\":\"LTC/BRL\",\"Product1\":3,\"Product1Symbol\":\"LTC\",\"Product2\":2,\"Product2Symbol\":\"BRL\",\"InstrumentType\":\"Standard\",\"VenueInstrumentId\":3,\"VenueId\":1,\"SortIndex\":0,\"SessionStatus\":\"Running\",\"PreviousSessionStatus\":\"Paused\",\"SessionStatusDateTime\":\"2020-07-11T01:27:50.427Z\",\"SelfTradePrevention\":true,\"QuantityIncrement\":1e-8,\"PriceIncrement\":0.001,\"MinimumQuantity\":1e-8,\"MinimumPrice\":0.001,\"VenueSymbol\":\"LTC/BRL\",\"IsDisable\":false,\"MasterDataId\":0,\"PriceCollarThreshold\":0,\"PriceCollarPercent\":0,\"PriceCollarEnabled\":false,\"PriceFloorLimit\":0,\"PriceFloorLimitEnabled\":false,\"PriceCeilingLimit\":0,\"PriceCeilingLimitEnabled\":false,\"CreateWithMarketRunning\":true,\"AllowOnlyMarketMakerCounterParty\":false}]"
}
```

### ```SubscribeLevel1``` - Tópico que retorna as atualizações de cotação dos pares
#### Parâmetro: ```InstrumentId```

Este tópico retorna as cotações dos pares de criptomoedas

Exemplo de requisição:

```JavaScript
{"m":0,"i":0,"n":"SubscribeLevel1","o":"{\"InstrumentId\":1}"}
```

Campos a serem utilizados:

```LastTradedPx```: Cotação Atual 

```Rolling24HrVolume```: Volume negociado nas últimas 24 horas

```Rolling24HrPxChange```: Variaçnao de preço nas últimas 24 horas

Exemplo de retorno
```Javascript
{
  "m": 0,
  "i": 0,
  "n": "SubscribeLevel1",
  "o": "{\"OMSId\":1,\"InstrumentId\":1,\"BestBid\":10.1,\"BestOffer\":20,\"LastTradedPx\":20,\"LastTradedQty\":0.1,\"LastTradeTime\":1614613162,\"SessionOpen\":130,\"SessionHigh\":130,\"SessionLow\":10.1,\"SessionClose\":10.1,\"Volume\":0.1,\"CurrentDayVolume\":0.0005,\"CurrentDayNumTrades\":1,\"CurrentDayPxChange\":-119.9,\"Rolling24HrVolume\":0.0005,\"Rolling24NumTrades\":1,\"Rolling24HrPxChange\":-92.2308,\"TimeStamp\":1614623773}"
}
```

# Informações adicionais

- Apesar de poder ser seguida a ordem presente no GetInstruments, os vinculos entre moedas e cotações é:
    - ```Bitcoin```: InstrumentId ```1```
    - ```XRP```: InstrumentId ```10```
    - ```TrueUSD```: InstrumentId ```6```
    - ```Ethereum```: InstrumentId ```4```
    - ```Litecoin```: InstrumentId ```2```
- As imagens das moedas estão adicionadas ao projeto em ```assets/images/${InstrumentId}.png```




