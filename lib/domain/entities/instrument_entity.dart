class InstrumentEntity {
  final String instrumentId;
  final String symbol;
  final String sortIndex;

  InstrumentEntity({
    this.instrumentId,
    this.symbol,
    this.sortIndex,
  });

  @override
  String toString() =>
      'InstrumentEntity(instrumentId: $instrumentId, symbol: $symbol, sortIndex: $sortIndex)';
}
