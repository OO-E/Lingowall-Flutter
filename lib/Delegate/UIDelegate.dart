import 'package:lingowall/Core/model/country_list_model.dart';

mixin UIDelegate {
  void onRefreshPage();
}

mixin CountryDelegate {

  void selectedCountry(String type, Countries country);

}