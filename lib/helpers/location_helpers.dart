const GOOGLE_API_KEY = "AIzaSyC8BM5FMb0UZ-tExLGjc2ZXrthPNFPYm0s";

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude = 0.0, double? longitude = 0.0}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=400x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }
}
