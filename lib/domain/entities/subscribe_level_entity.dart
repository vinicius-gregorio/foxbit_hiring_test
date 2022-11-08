class AssetEntity {
  final String symbol;
  final String lastTradedPx;
  final String rolling24HrVolume;
  final String rolling24HrPxChange;

  AssetEntity({
    this.symbol,
    this.lastTradedPx,
    this.rolling24HrVolume,
    this.rolling24HrPxChange,
  });
}
