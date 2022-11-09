class AssetEntity {
  String symbol;
  String instrumentId;
  final String lastTradedPx;
  final String rolling24HrVolume;
  final String rolling24HrPxChange;

  AssetEntity({
    this.symbol,
    this.instrumentId,
    this.lastTradedPx,
    this.rolling24HrVolume,
    this.rolling24HrPxChange,
  });
}
