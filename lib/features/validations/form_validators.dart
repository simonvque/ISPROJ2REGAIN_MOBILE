class Validators {
  static String capitalize(String text) =>
      text[0].toUpperCase() + text.substring(1);

// Username Validation
  static String? usernameValidation(String? value,
      {String fieldName = 'username'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only letters and numbers (no spaces or special characters)
    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} must only contain letters and numbers';
    }

    // Ensure the value is not numbers only
    if (RegExp(r'^\d+$').hasMatch(value)) {
      return '${capitalize(fieldName)} cannot be numbers only';
    }

    return null;
  }

// Name Validation
  static String? nameValidation(String? value, {String fieldName = 'name'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only letters and spaces
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain letters and spaces';
    }

    return null;
  }

  //Junk shop validation
  static String? junkShopNameValidation(String? value,
      {String fieldName = 'junk shop name'}) {
    // Allow null or empty values (field is optional)
    if (value == null || value.isEmpty) {
      return null;
    }

    // Ensure the value contains only letters, numbers, spaces, dashes, apostrophes, and commas
    final regex = RegExp(r"^[a-zA-Z0-9\s'\-,]+$");
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain letters, numbers, spaces, dashes, apostrophes, and commas';
    }

    // Ensure the value contains at least one letter
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return '${capitalize(fieldName)} must contain at least one letter';
    }

    return null;
  }

//Product Name
  static String? productNameValidation(String? value,
      {String fieldName = 'field'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only letters, numbers, and spaces
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain letters, numbers, and spaces';
    }

    // Ensure the value contains at least one letter (can't be just numbers or spaces)
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return '${capitalize(fieldName)} must contain at least one letter';
    }

    return null;
  }

  // Price Validation
  static String? priceValidation(String? value, {String fieldName = 'price'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Attempt to parse the value to a double
    final parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      return '${capitalize(fieldName)} must be a valid number';
    }

    // Ensure the value is not a negative number
    if (parsedValue < 0) {
      return '${capitalize(fieldName)} cannot be a negative number';
    }

    // Ensure the value has up to two decimal places
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} must have at most two decimal places';
    }

    return null;
  }

//Weight Validation
  static String? weightValidation(String? value,
      {String fieldName = 'weight'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Attempt to parse the value to a double
    final weight = double.tryParse(value);
    if (weight == null) {
      return '${capitalize(fieldName)} must be a valid number';
    }

    // Ensure the value is not a negative number
    if (weight < 0) {
      return '${capitalize(fieldName)} cannot be a negative number';
    }

    // Ensure the value has up to two decimal places
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} must have at most two decimal places';
    }

    // Ensure the weight is at least 0.1
    if (weight < 0.1) {
      return '${capitalize(fieldName)} must be 0.1 or above';
    }

    return null;
  }

  // Description Validation
  static String? descriptionValidation(String? value,
      {String fieldName = 'description'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only letters, numbers, spaces, periods, and exclamation marks
    final regex = RegExp(r'^[a-zA-Z0-9\s.!]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain letters, numbers, spaces, periods, and exclamation marks';
    }

    // Ensure the value contains at least one letter
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return '${capitalize(fieldName)} must contain at least one letter';
    }

    return null;
  }

  // Report Validation
  static String? ReportValidation(String? value, {String fieldName = 'field'}) {
    if (value == null || value.isEmpty) {
      return 'Please provide a $fieldName';
    }

    // Ensure the value contains only letters, numbers, spaces, and periods
    final regex = RegExp(r'^[a-zA-Z0-9\s.]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain letters, numbers, spaces, and periods';
    }

    // Ensure the value contains at least one letter
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return '${capitalize(fieldName)} must contain at least one letter';
    }

    return null;
  }

//Amount Details
  static String? amountValidation(String? value,
      {String fieldName = 'amount'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Check if the value can be parsed to a double first
    final amount = double.tryParse(value);
    if (amount == null) {
      return '${capitalize(fieldName)} must be a valid number';
    }

    // Ensure the value is not negative
    if (amount < 0) {
      return '${capitalize(fieldName)} cannot be negative';
    }

    // Ensure the value has up to two decimal places
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} must be a valid number';
    }

    return null;
  }

  // Reference Number
  static String? RefNumberValidation(String? value,
      {String fieldName = 'reference number'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only numbers and letters (no spaces or special characters)
    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regex.hasMatch(value)) {
      return '${capitalize(fieldName)} can only contain numbers and letters';
    }

    return null;
  }

  // ID Number Validation
  static String? idNumberValidation(String? value,
      {String fieldName = 'ID number'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName';
    }

    // Ensure the value contains only letters, numbers, spaces, and dashes
    final regex = RegExp(r'^[a-zA-Z0-9\s-]+$');
    if (!regex.hasMatch(value)) {
      return '$fieldName can only contain letters, numbers, spaces, and dashes';
    }

    // Ensure the value is not only spaces or dashes
    if (RegExp(r'^[\s-]+$').hasMatch(value)) {
      return '$fieldName cannot be spaces or dashes only';
    }

    return null;
  }

  // Birthday Validation
  static String? birthdayValidation(DateTime? birthDate,
      {String fieldName = 'birth date'}) {
    if (birthDate == null) {
      return 'Please select a $fieldName';
    }

    final DateTime today = DateTime.now();
    final int age = today.year - birthDate.year;
    final bool hasHadBirthdayThisYear = today.month > birthDate.month ||
        (today.month == birthDate.month && today.day >= birthDate.day);

    if (age < 18 || (age == 18 && !hasHadBirthdayThisYear)) {
      return 'User must be at least 18 years old';
    }

    return null;
  }

  // Password Validation
  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }

    final errors = [];

    if (value.length < 12) errors.add('12+ characters');
    if (!RegExp(r'[A-Z]').hasMatch(value)) errors.add('an uppercase letter');
    if (!RegExp(r'[a-z]').hasMatch(value)) errors.add('a lowercase letter');
    if (!RegExp(r'\d').hasMatch(value)) errors.add('a number');
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value))
      errors.add('a special character');

    if (errors.isNotEmpty) {
      return 'Password must have: ${errors.join(', ')}.';
    }

    return null;
  }

  // Confirm Password Validation
  static String? confirmPasswordValidation(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Email Validation
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
