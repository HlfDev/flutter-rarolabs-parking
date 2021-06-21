import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text14 = GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle text18 = GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle text18White = GoogleFonts.notoSans(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );
}
