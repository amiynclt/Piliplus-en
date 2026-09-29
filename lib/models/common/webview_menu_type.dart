enum WebviewMenuItem {
  refresh('refresh'),
  copy('Copy link'),
  openInBrowser('Open in browser'),
  clearCache('clear cache'),
  resetCookie('Reset cookies'),
  goBack('return'),
  ;

  final String title;
  const WebviewMenuItem(this.title);
}
