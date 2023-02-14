import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/app_model.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:phonebook2/main.dart';
import 'contact_model.dart';
import 'contact_widget.dart';

abstract class IContactWidgetModel extends IWidgetModel {
  ValueListenable<Contact> get contact;
  Mode get mode;
  TextEditingController get lastNameCtrl;
  TextEditingController get firstNameCtrl;
  TextEditingController get secondNameCtrl;
  TextEditingController get nickNameCtrl;
  ListenableState<List<TextEditingController>> get phonesCtrlList;
  List<TextEditingController> get emailCtrlList;
  List<TextEditingController> get socNetCtrlList;

  void addPhone();
}

ContactWidgetModel defaultContactWidgetModelFactory(BuildContext context) {
  return ContactWidgetModel(
      ContactModel(getIt<AppModel>()),
  );
}

// TODO: cover with documentation
/// Default widget model for ContactWidget
class ContactWidgetModel extends WidgetModel<ContactWidget, ContactModel>
    implements IContactWidgetModel {

  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _firstNameCtrl = TextEditingController() ;
  final TextEditingController _secondNameCtrl = TextEditingController();
  final TextEditingController _nickNameCtrl = TextEditingController();
  final StateNotifier<List<TextEditingController>> _phonesCtrlList = StateNotifier();
  final List<TextEditingController> _emailCtrlList = [];
  final List<TextEditingController> _socNetCtrlList = [];

  ContactWidgetModel(ContactModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContact();
    _lastNameCtrl.text = contact.value.lastName;
    _firstNameCtrl.text = contact.value.firstName;
    _secondNameCtrl.text = contact.value.secondName;
    _lastNameCtrl.text = contact.value.lastName;
    _phonesCtrlList.accept(contact.value.phones.map<TextEditingController>((String phone) {
      TextEditingController controller = TextEditingController();
      controller.text = phone;
      return controller;
    }).toList());
  }

  @override
  ValueListenable<Contact> get contact => model.contact;



  @override
  Mode get mode => model.mode;

  @override
  ListenableState<List<TextEditingController>> get phonesCtrlList => _phonesCtrlList;

  @override
  List<TextEditingController> get emailCtrlList => _emailCtrlList;

  @override
  TextEditingController get firstNameCtrl => _firstNameCtrl;

  @override
  TextEditingController get lastNameCtrl => _lastNameCtrl;

  @override
  TextEditingController get nickNameCtrl => _nickNameCtrl;

  @override
  TextEditingController get secondNameCtrl => _secondNameCtrl;

  @override
  List<TextEditingController> get socNetCtrlList => _socNetCtrlList;
  
  @override
  void addPhone() {
    TextEditingController controller = TextEditingController();
    controller.text = "";
    var ctrlList =  _phonesCtrlList.value;
    ctrlList?.add(controller);
    _phonesCtrlList.notifyListeners();  
  }
}
