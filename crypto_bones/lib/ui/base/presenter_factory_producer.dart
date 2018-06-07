import '../splash_screen/home_view_presenter.dart';
import 'base_contract.dart';
import 'base_presenter.dart';

enum ViewType { homeview }

class PresenterFactoryProducer {
  static BasePresenter getPresenter(ViewType viewType, BaseContract contract) {
    if (viewType == ViewType.homeview) {
      return new HomeViewPresenter(contract);
    } else
      throw new Exception("Unknown presenter.Have you added it?");
  }
}
