class RegexCommon {
  static const adhaarRegex = r'^\d{12}$';

  static const panNumberRegex = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';

  static const gstRegex =
      r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[A-Z0-9]{1}Z[0-9A-Z]{1}$';

  static const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
}
