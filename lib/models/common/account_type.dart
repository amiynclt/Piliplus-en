enum AccountType {
  main('main account'),
  heartbeat('Record viewing'),
  recommend('recommend'),
  video('Video streaming'),
  ;

  final String title;
  const AccountType(this.title);
}
