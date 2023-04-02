import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:money_management_app/model/category/category_model.dart';

class GoogleSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "money-manager-gsheets",
  "private_key_id": "e08a4993ed3cb851bc745ce280697ad3d985256f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCncTL4M/UpIntw\nJMwyUKuLiPt0pxqfaUkuLpiyM4z6CLyHOdNmS3Nm3Fzc7CZbL1WctgxSWhWbBhDq\nmFv/GBgxwFqSOSGnserqdSRKiFl53dJgteNOuMB0XVNlgdySX/Fwg8jrDLg+txLV\n5uWYHQcYdS6E96UW9EMmALzVNP4yO3YMNAHllKTmskKQYKjVQ6zCJ9fA51h0/6o2\nigun8eAS3tu4brEUugj6Nd+fmqE0bINeuzfE7/zM9ix0aJP7AWZgnAT9QD4J771C\n7QORO0sF6uKv8R+a3BsKVScrsiXAdmhdX2DLfyoq9n0FDIIE8/JLjxxBRIUYgqba\n/rPAns4pAgMBAAECggEAAsHlODuoz6Ta+gmNGE4GSS24EF95G4NxGlLXnmWlbm+q\n5SIxZkebTqgV2miEKC/DHenMkaWcofkrWaWpLC4CJf2YMDzDHl8acoJ71sNgj9Z0\nkrWkGOWHe9MWnr8Q+hMc54CwFBjZRuUeaQncoZDmz0MMwVFPtW1P1sYf1fYBsqOL\nuCkgY9I+qL8Nv65Eo25374M78Y2/M+dlokOLnlQBL0Op6zNVPOiXLWcAvBe6vlN5\nG7vEPHf74IYE3mhjMeedORJd6aTbnHYgjYcyKWENE1jDqPlU603aC8VKFMQ8w6dM\nIDSHOaLDy2HV4gs3VF3sUTMotTjHeRW9yNRh7mtF4QKBgQDQSxVW8Qdul+Xs6JFJ\naeKFgWdRuDwp8Zfy6P0Qnw2W7nfPEqcna+fl3S3D0zGv25hj4617iHupwuMqOBU8\naKLRumjOdCdw5qVTdbUrm/GmZHVRA7lA1rLu7NevqvaWtSkquMAp+0N0Xh01y/OW\n/F5/9QnDZgGcvxxGrQBfLf1GkQKBgQDNyuGx5+N/uU+CInB5wsNTu5URFZw8iCAh\nplcauy3QstGgz/EQCUi3uNSacQlUe/FBStAR7cURoRPsfWBsUR/9CH+22+9KL6DA\nV+wSaRw6zbxA6IdbrhiakBj82zV5IP22QnFzYSp4Y62hJrDRCk2H5Ogp3AkLIap7\ny/1R1S1KGQKBgQC+kKMSauwow3IJgHFD4ErtaAnV2x+4JB+njn/RECOHvd8BJYim\naXO9etDfAz7HLLpMUUYr6h9xnirlOnA7V2P3S3uNvvlCstH4/IznPAInAGvQ1f5M\nEuGb9DYUsu5tzYq/Wk39WrNJKL3CtTjEH1p56P6otY+uD67X/nmDmvjI8QKBgETf\nKittDNEZBofp2LSXPuGN/LRsBA6qC/7W+X3DuPCId+mWzfls8f4yiExrmhDBLhuI\n2xu09GgS/WT/DL8TY14+cueSsYGlcOoOQr5imQUBB4i9iVdga3GG2iX9gubX6LEP\niYJwuVLzIQ+2sCQ1i374V85yikBEcxbdTRkO/Ao5AoGBAICVoAUkyU7XX/cDUBWq\ns+OAaTpD3+QEJbsQ8IHbWWpbrdmuo1kXipVMwOrOvDZA/jvaCiuqCOpsbnYt3Kq8\nibgPae2qHz8aHp1lf24WSeh283cn/xHwfqrO99c7CApbtXa1P0vJ5eaw7P/KxA+U\n89840lXtGMjZ92bMjRNE+tTN\n-----END PRIVATE KEY-----\n",
  "client_email": "money-manager-gsheets@money-manager-gsheets.iam.gserviceaccount.com",
  "client_id": "117214942648574351772",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/money-manager-gsheets%40money-manager-gsheets.iam.gserviceaccount.com"
}

''';

//SET UP AND CONNECT TO THE SPREADSHEET
  static final _spreadsheetId = '1Vu8WY7pTtw6yNxuuia4JXqVnNKlNf949y0u6-7wS9JI';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

//some variable to keep track of..
  static int numberofTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

//initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Transsheet');
    countRows();
  }

//count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberofTransactions + 1)) !=
        '') {
      numberofTransactions++;
    }
    //now we know how may notes to load, now lets load them!
    loadTransactions();
  }

//load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberofTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberofTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    //this will stop the circular loading indicator
    loading=false;
  }
  //insert a new transaction
  static Future insert(String name,String amount,String category,)async{
    if(_worksheet==null)return;
    numberofTransactions++;
    currentTransactions.add([
      name,
      amount,
      category,
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      category,
      
    ]); 
  }
}
