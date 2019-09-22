class MediaQueryHelper {
  double width;

  MediaQueryHelper();

  get isSmallScreen {
    // use 600 for phones to see how it changes
    return width != null ? width <  1000 : true;
  }

}