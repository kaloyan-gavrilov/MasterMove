class LevelInfo {
  int level;
  int remainingExp;

  LevelInfo(this.level, this.remainingExp);
}

LevelInfo calculateLevel(int exp) {
  int expPerLevel = 10;

  int level = (exp ~/ expPerLevel);

  int remainingExp = ((level * expPerLevel) - exp).abs();

  return LevelInfo(level, remainingExp);
}
