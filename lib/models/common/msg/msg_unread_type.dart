enum MsgUnReadType {
  pm('private message'),
  reply('reply to mine'),
  at('@我'),
  like('likes received'),
  sysMsg('System notification'),
  ;

  final String title;
  const MsgUnReadType(this.title);
}
