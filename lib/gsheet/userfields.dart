import 'package:fuelfire/gsheet/UserSheets.dart';
import 'package:fuelfire/main.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';

class UserFields {
  final Worksheet? _usersheet = UserSheetAPI.usersheet;
  late String formattedDate;
  int count = 1;
  Future<String> inputdata() async {
    String res = 'Some error occured';
    double totalsales = a1PetrolPrice +
        a2PetrolPrice +
        b2PetrolPrice +
        b1dieselPrice +
        a1dieselPrice +
        a1powerPetrolPrice +
        oilpricedup;
    double totallitres = a1petrollitres +
        a1diesellitres +
        b1diesellitres +
        b2petrollitres +
        a1powerpetrollitres +
        a2petrollitres +
        oillitres;
    DateTime now = DateTime.now();
    formattedDate = DateFormat('dd-MM-yyyy').format(now);
    try {
      print(a2dupclosing);
      final String datenow = await _usersheet!.values.value(column: 1, row: 1);
      await _usersheet.values
          .insertValue('$formattedDate', column: count, row: count);
      await _usersheet.values
          .insertValue('CLOSING', column: count + 1, row: count);
      await _usersheet.values
          .insertValue('OPENING', column: count + 2, row: count);
      await _usersheet.values
          .insertValue('TEST', column: count + 3, row: count);
      await _usersheet.values
          .insertValue('SALES', column: count + 4, row: count);
      await _usersheet.values
          .insertValue('RATE', column: count + 5, row: count);
      await _usersheet.values
          .insertValue('TOTAL', column: count + 6, row: count);
      await _usersheet.values.insertValue('DIP', column: count, row: count + 1);
      await _usersheet.values.insertValue('HSD', column: count, row: count + 1);
      await _usersheet.values.insertValue('MSP', column: count, row: count + 1);
      await _usersheet.values.insertValue('MS', column: count, row: count + 1);
      await _usersheet.values
          .insertValue('A1-DIESEL', column: count, row: count + 2);
      await _usersheet.values
          .insertValue(a1dieselclosinig, column: count + 1, row: count + 2);
      await _usersheet.values
          .insertValue(a1dieselopening, column: count + 2, row: count + 2);
      await _usersheet.values
          .insertValue(a1diesletest, column: count + 3, row: count + 2);
      await _usersheet.values
          .insertValue(a1diesellitres, column: count + 4, row: count + 2);
      await _usersheet.values
          .insertValue(a1dieselprice, column: count + 5, row: count + 2);
      await _usersheet.values
          .insertValue(a1dieselPrice, column: count + 6, row: count + 2);
      await _usersheet.values
          .insertValue('A1-PETROL', column: count, row: count + 3);
      await _usersheet.values
          .insertValue(a1closinig, column: count + 1, row: count + 3);
      await _usersheet.values
          .insertValue(a1opening, column: count + 2, row: count + 3);
      await _usersheet.values
          .insertValue(a1test, column: count + 3, row: count + 3);
      await _usersheet.values
          .insertValue(a1petrollitres, column: count + 4, row: count + 3);
      await _usersheet.values
          .insertValue(a1petrolprice, column: count + 5, row: count + 3);
      await _usersheet.values
          .insertValue(a1PetrolPrice, column: count + 6, row: count + 3);
      await _usersheet.values
          .insertValue('B1-DIESEL', column: count, row: count + 4);
      await _usersheet.values
          .insertValue(b1closinig, column: count + 1, row: count + 4);
      await _usersheet.values
          .insertValue(b1opening, column: count + 2, row: count + 4);
      await _usersheet.values
          .insertValue(b1test, column: count + 3, row: count + 4);
      await _usersheet.values
          .insertValue(b1diesellitres, column: count + 4, row: count + 4);
      await _usersheet.values
          .insertValue(b1price, column: count + 5, row: count + 4);
      await _usersheet.values
          .insertValue(b1dieselPrice, column: count + 6, row: count + 4);
      await _usersheet.values
          .insertValue('B2-PETROL', column: count, row: count + 5);
      await _usersheet.values
          .insertValue(b2closinig, column: count + 1, row: count + 5);
      await _usersheet.values
          .insertValue(b2opening, column: count + 2, row: count + 5);
      await _usersheet.values
          .insertValue(b2test, column: count + 3, row: count + 5);
      await _usersheet.values
          .insertValue(b2petrollitres, column: count + 4, row: count + 5);
      await _usersheet.values
          .insertValue(b2price, column: count + 5, row: count + 5);
      await _usersheet.values
          .insertValue(b2PetrolPrice, column: count + 6, row: count + 5);
      await _usersheet.values
          .insertValue('A1-POWERPETROL', column: count, row: count + 6);
      await _usersheet.values
          .insertValue(a1powerclosinig, column: count + 1, row: count + 6);
      await _usersheet.values
          .insertValue(a1poweropening, column: count + 2, row: count + 6);
      await _usersheet.values
          .insertValue(a1powertest, column: count + 3, row: count + 6);
      await _usersheet.values
          .insertValue(a1powerpetrollitres, column: count + 4, row: count + 6);
      await _usersheet.values
          .insertValue(a1powerprice, column: count + 5, row: count + 6);
      await _usersheet.values
          .insertValue(a1powerPetrolPrice, column: count + 6, row: count + 6);
      await _usersheet.values
          .insertValue('A2-PETROL', column: count, row: count + 7);
      await _usersheet.values
          .insertValue(a2dupclosing, column: count + 1, row: count + 7);
      await _usersheet.values
          .insertValue(a2dupopening, column: count + 2, row: count + 7);
      await _usersheet.values
          .insertValue(a2test, column: count + 3, row: count + 7);
      await _usersheet.values
          .insertValue(a2petrollitres, column: count + 4, row: count + 7);
      await _usersheet.values
          .insertValue(a2price, column: count + 5, row: count + 7);
      await _usersheet.values
          .insertValue(a2PetrolPrice, column: count + 6, row: count + 7);
      await _usersheet.values.insertValue('OIL', column: count, row: 9);
      await _usersheet.values
          .insertValue(oilclosing, column: count + 1, row: count + 8);
      await _usersheet.values
          .insertValue(oilopening, column: count + 2, row: count + 8);
      await _usersheet.values
          .insertValue(oillitres, column: count + 4, row: count + 8);
      await _usersheet.values
          .insertValue(oilprice1, column: count + 5, row: count + 8);
      await _usersheet.values
          .insertValue(oilpricedup, column: count + 6, row: count + 8);
      await _usersheet.values
          .insertValue(totallitres, column: count + 4, row: count + 9);
      await _usersheet.values
          .insertValue(totalsales, column: count + 6, row: count + 9);
      res = 'Success';
    } catch (e) {
      return res;
    }
    return res;
  }
}
