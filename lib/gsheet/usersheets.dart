import 'package:fuelfire/gsheet/userfields.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetAPI {
  static const crenditials = r'''
{
  "type": "service_account",
  "project_id": "gsheet-420613",
  "private_key_id": "23641ab8b5a383462ccec6b92131dbe24f3dc2c3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCtXcusx99/0zCx\nSMmzo6XFX1DUCRL3Bi+TokWeMJKUQySCXMMt1/4mIZZ23M2n8gSfRHz1ffDtJquT\nV5byYZtez+xl15ki4t+gsLKo85aumHha1OdqHANMff8sMsQedGVvvhao4b5AlL6g\nOYEEQ/7kcwJ7rKawQn7TCvfePlKKt7clWcQ4+2QqrtN384+GosX6g/gE6Atfx3B1\no1uvAuDpVMA3eLFfMAOmBFMI+CNxwv11TAQbnc4ikrOMyC9CfLpTDVFbco77XiLm\n3tQxtWrLvOJZ0UvdGIXsyBHdPPELkQNt+8jmXJYiD8L0gCdbIgd5jXPlcay6G2y1\n2/LnZqztAgMBAAECggEAKawiZXuc7musKG076LWlRwKAmhs9RwoiXQ00SVBZJ5DV\nIY3dL7Ob6HwJ4DP2rlBHSqZqmBMIGuVA+FelVclfEMUPiLJwoblhsk1PALwexASr\n53+GSdQGefhOYkgoqr5lVJ0fcsRimED46mgwKj+S8URw/Bv17GfrdtzL1IzsB+I4\nXCA88RfinnHh0BNLK7lJ5mlLGXAGfoWGGEeoRCpAframh4P+h7yGpC5tSSmn1CYr\nwi+3LPF4N5UTq/EJqVNxXmM0r9gs+Z2JMZDqex3MUUOaePw/dPgCog/q8Gv777e/\nGKQgIw1qjGbVYOdHORsMtD8vyUI/qFFJ2rtMphMHAQKBgQDc2ZU1lETS75xlqixR\nMqa2fNQEKLZjmm3YIBgGU4DkdPbNNS0jxjL+2U2ii0EvN3Lut3wN2eFvjacacpyI\nqVGpuRPSp/xxzh66nZ+AYmUMP1vZQcI0pUpK3HsXyZ/GbV5yA8JhjQHBBMi6A1y1\nkr5B8lvZOiiLCIVlxnNBW3B/7QKBgQDI9YUnge+ClFteo30H8fH/1p+wicfwJn7w\n7n/ELFxA8X6OZQeIByy7h8gOy8aDnTv6NgwI2mAf0i0g66ZUPQR1VnTFWH8qGGbr\ndqdkOPA7VQ8mHbsbw7+QGRAhZtKIH/GLUZfDL76HQriHWw6y0MhmA6zdU3A3OHqt\ntwVY7AdBAQKBgQCwnShf8rSfY5NVEiPiw3jjEyySLuS8/rC9V90eogS/rnH4ZYA1\nzbjWaX1WcbqtQdCd6wpAIW/RQBzUX7ei6pUt/55EpqaRdF7Kqmb1yro4cyrGsXnX\nlB+3gl7GBS3LB4ex8iOu048FhwfnCe1IH5QbNPAS5hmqJiRX4b4mFDQBeQKBgBZ1\nObg8kSOqqLte0e49X6oTtizoeOuhobYTMTwfKQAo/Ne0+q58/sbGWdktdLXosHc5\n6wZiQTPNLTXsn93yI7lpPAuB5FQz/ex6iiJtKou26cZ8tBhaO+JCqsbQ0t5bk4ba\nS3eIsmYzUqPtzSq2om6kIoFpfbTuHuei+HoDhpwBAoGAdaZ4dCabav41s+cmpcl4\n2f3Egxvm0GGyYnSUD+I5doNwykqjHEyFjep4VehiXzO/UtTo8keLMt3aOUTCbipA\nspEBwKpP14LFeMcbJexFlX50UL7ESNpEP2FGoeysbUc2EximUfnqpMf3TV8WFKdQ\nEQJJ7CuHyAOgwK8sWUn0YsY=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheet-420613.iam.gserviceaccount.com",
  "client_id": "110549834455869615241",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheet-420613.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static final spreadsheetid = '17nTeaFrgIdlNHtTJiUdQ3uTilLycj89Klbr-A6VK__I';
  static final gsheets = GSheets(crenditials);
  static Worksheet? usersheet;

  static Future init() async {
    try {
      final spreadsheet = await gsheets.spreadsheet(spreadsheetid);
      usersheet = await getworksheet(spreadsheet, title: 'Test');
      // await usersheet!.values.insertValue('Date', column: 1, row: 1);
    } catch (e) {
      print('Init error: $e');
    }
  }

  static Future<Worksheet> getworksheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    usersheet!.values.appendRow(rowlist);
  }
}
