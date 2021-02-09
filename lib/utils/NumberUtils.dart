class NumberUtils {

  static String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

}