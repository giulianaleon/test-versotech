import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<String> names = ObservableList<String>();

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @action
  void addName() {
    if (name.isNotEmpty) {
      names.add(name);
      name = '';
    }
  }

  @action
  void removeName(int index) => names.removeAt(index);

  @action
  String getName(int index) {
    return names[index];
  }

  @action
  void replaceName(int index) => names[index] = name;
}