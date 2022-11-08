class InstrumentEntity {
  String instrumentId;
  String symbol;
  String sortIndex;

  InstrumentEntity({
    this.instrumentId,
    this.symbol,
    this.sortIndex,
  });

  @override
  String toString() =>
      'InstrumentEntity(instrumentId: $instrumentId, symbol: $symbol, sortIndex: $sortIndex)';
}
