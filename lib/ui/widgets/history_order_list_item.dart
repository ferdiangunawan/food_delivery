part of 'widgets.dart';

class HistoryOrderList extends StatelessWidget {
  final Transaction? transaction;
  HistoryOrderList({@required this.transaction});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(transaction!.food!.picturePath!,
              width: 60, height: 60, fit: BoxFit.cover),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction!.food!.name!, style: blackFontStyle2),
            Text(
                transaction!.quantity!.toString() +
                    ' item(s)' +
                    ' • ' +
                    NumberFormat.currency(
                            symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                        .format(transaction!.total!),
                style: greyFontStyle.copyWith(fontSize: 13)),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              convertDateTime(transaction!.dateTime!),
              style: greyFontStyle.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 2,
            ),
            (transaction!.status! == TransactionStatus.cancelled)
                ? Text('Cancelled',
                    style: GoogleFonts.poppins(
                        color: Color(0xffD9435E), fontSize: 10))
                : (transaction!.status! == TransactionStatus.pending)
                    ? Text('Pending',
                        style: GoogleFonts.poppins(
                            color: Color(0xffD9435E), fontSize: 10))
                    : (transaction!.status! == TransactionStatus.on_delivery)
                        ? Text('On Delivery',
                            style: GoogleFonts.poppins(
                                color: Color(0xff1ABC9C), fontSize: 10))
                        : (transaction!.status! == TransactionStatus.delivered
                            ? Text('Delivered',
                                style: GoogleFonts.poppins(
                                    color: Color(0xff1ABC9C), fontSize: 10))
                            : SizedBox())
          ],
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;

      default:
        month = 'Des';
    }
    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
