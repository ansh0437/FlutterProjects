import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/utils.dart';

class DialogHelper {
  DialogHelper._();

  static DialogHelper _dialogHelper;

  static DialogHelper get instance {
    if (_dialogHelper == null) {
      _dialogHelper = DialogHelper._();
    }
    return _dialogHelper;
  }

  void showWinner({
    @required BuildContext context,
    @required String message,
    @required Function okClick,
  }) {
    double dialogWidth = Utils.getWidth(context);

    if (kIsWeb) {
      dialogWidth =
          dialogWidth <= Doubles.fiveTwenty ? dialogWidth : Doubles.fourEighty;
      dialogWidth -= Doubles.twentyFour;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Doubles.sixteen),
          ),
          child: Container(
            width: dialogWidth,
            padding: EdgeInsets.all(Doubles.twelve),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Info",
                    style: TextStyle(
                      fontSize: Doubles.twentyFour,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: Doubles.eight),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: Doubles.eighteen,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      okClick();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Doubles.eight),
                      ),
                    ),
                    child: Container(
                      width: Doubles.eighty,
                      child: Center(
                        child: Text(
                          "Okay",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: Doubles.sixteen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
