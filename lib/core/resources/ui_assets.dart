class UIAssets {
  //gif images
  static const gifDir = "assets/gif/";
  static const gifLoading = "${gifDir}loading.gif";

  //helper methods
  static String getImage(String imageName) {
    return 'assets/images/$imageName';
  }

  static String getSvg(String svgName) {
    return 'assets/svg/$svgName';
  }

  static String getAnim(String svgName) {
    return 'assets/anim/$svgName';
  }
}
