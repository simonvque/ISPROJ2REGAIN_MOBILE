  double computeAverageRating(List<dynamic> ratings) {
    if (ratings.isEmpty) {
      return 0.0; // If there are no ratings, return 0.0 as average
    }

    double totalRating = 0.0;

    for (var rating in ratings) {
      totalRating += rating?.toDouble() ?? 0.0; 
    }

    // Return the average rating
    return totalRating / ratings.length;
  }