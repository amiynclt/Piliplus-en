// enum MsgType {
//   invalid(value: 0, label: "Empty~"),
//   text(value: 1, label: "text message"),
//   pic(value: 2, label: "Picture message"),
//   audio(value: 3, label: "voice message"),
//   share(value: 4, label: "share news"),
//   revoke(value: 5, label: "Withdraw message"),
//   customFace(value: 6, label: "Custom expressions"),
//   shareV2(value: 7, label: "Share v2 news"),
//   sysCancel(value: 8, label: "System revoked"),
//   miniProgram(value: 9, label: "Mini program"),
//   notifyMsg(value: 10, label: "Business notification"),
//   archiveCard(value: 11, label: "Contribution card"),
//   articleCard(value: 12, label: "Column cards"),
//   picCard(value: 13, label: "Picture cards"),
//   commonShare(value: 14, label: "Alien card"),
//   autoReplyPush(value: 16, label: "Automatic reply push"),
//   notifyText(value: 18, label: "text prompt");

//   final int value;
//   final String label;
//   const MsgType({required this.value, required this.label});
//   static MsgType parse(int value) {
//     return MsgType.values
//         .firstWhere((e) => e.value == value, orElse: () => MsgType.invalid);
//   }
// }
