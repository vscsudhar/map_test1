import 'package:map_test1/app/app.bottomsheets.dart';
import 'package:map_test1/app/app.dialogs.dart';
import 'package:map_test1/app/app.locator.dart';
import 'package:map_test1/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> launchUrl1() async {
    const link = 'https://www.google.com/maps/dir/?api=1&destination=malumachampatti&query=malumachampatti';

      await launchUrl(
        Uri.parse(link),
        mode: LaunchMode.inAppWebView,
      );
    
  }
}
