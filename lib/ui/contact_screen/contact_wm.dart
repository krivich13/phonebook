import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/app_model.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:phonebook2/main.dart';
import 'package:phonebook2/service/contact_service.dart';
import 'package:phonebook2/service/navigation_helper.dart';
import 'package:phonebook2/ui/contacts_list_screen/contacts_list_screen_widget.dart';
import 'contact_model.dart';
import 'contact_widget.dart';

abstract class IContactWidgetModel extends IWidgetModel {
  Contact get contact;
  TextEditingController get lastNameCtrl;
  TextEditingController get firstNameCtrl;
  TextEditingController get secondNameCtrl;
  TextEditingController get nickNameCtrl;
  ValueListenable<List<TextEditingController>> get phonesCtrlList;
  ValueListenable<List<TextEditingController>> get emailCtrlList;
  ValueListenable<List<TextEditingController>> get socNetCtrlList;
  ValueListenable<bool> get readOnly;

  void addPhone();

  void addEmail();

  void changeMode();

  void saveContact();

  void addSocNet();
}

ContactWidgetModel defaultContactWidgetModelFactory(BuildContext context) {
  return ContactWidgetModel(
      ContactModel(getIt<AppModel>(), ContactService()),
      NavigationHelper()
  );
}

class ContactWidgetModel extends WidgetModel<ContactWidget, ContactModel>
    implements IContactWidgetModel {

  final NavigationHelper _navigator;

  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _firstNameCtrl = TextEditingController() ;
  final TextEditingController _secondNameCtrl = TextEditingController();
  final TextEditingController _nickNameCtrl = TextEditingController();
  final ValueNotifier<List<TextEditingController>> _phonesCtrlList = ValueNotifier([]);
  final ValueNotifier<List<TextEditingController>> _emailCtrlList = ValueNotifier([]);
  final ValueNotifier<List<TextEditingController>> _socNetCtrlList = ValueNotifier([]);

  @override
  Contact get contact => model.contact;

  @override
  ValueListenable<List<TextEditingController>> get phonesCtrlList => _phonesCtrlList;

  @override
  ValueListenable<List<TextEditingController>> get emailCtrlList => _emailCtrlList;

  @override
  TextEditingController get firstNameCtrl => _firstNameCtrl;

  @override
  TextEditingController get lastNameCtrl => _lastNameCtrl;

  @override
  TextEditingController get nickNameCtrl => _nickNameCtrl;

  @override
  TextEditingController get secondNameCtrl => _secondNameCtrl;

  @override
  ValueListenable<List<TextEditingController>> get socNetCtrlList => _socNetCtrlList;

  ContactWidgetModel(ContactModel model, this._navigator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContact();
    _lastNameCtrl.text = contact.lastName;
    _firstNameCtrl.text = contact.firstName;
    _secondNameCtrl.text = contact.secondName;
    _nickNameCtrl.text = contact.nickName;
    _phonesCtrlList.value = contact.phones.map<TextEditingController>((String phone) {
      TextEditingController controller = TextEditingController();
      controller.text = phone;
      return controller;
    }).toList();
    _emailCtrlList.value = contact.email.map<TextEditingController>((String email) {
      TextEditingController controller = TextEditingController();
      controller.text = email;
      return controller;
    }).toList();
    _socNetCtrlList.value = contact.socNet.map<TextEditingController>((String socnet) {
      TextEditingController controller = TextEditingController();
      controller.text = socnet;
      return controller;
    }).toList();
  }
  
  @override
  void addPhone() {
    TextEditingController controller = TextEditingController();
    controller.text = "";
    _phonesCtrlList.value.add(controller);
    _phonesCtrlList.notifyListeners();
  }
  
  @override
  ValueListenable<bool> get readOnly => model.readOnly;
  
  @override
  void changeMode() {
    model.changeMode();
  }
  
  @override
  void saveContact() async {
    Contact newContact = Contact(
          id: model.contact.id,
          lastName: _lastNameCtrl.text,
          firstName: _firstNameCtrl.text,
          secondName: _secondNameCtrl.text,
          nickName: _nickNameCtrl.text,
          phones:
              _phonesCtrlList.value.map<String>((ctrl) => ctrl.text).toList(),
          email: 
              _emailCtrlList.value.map<String>((ctrl) => ctrl.text).toList(),
          socNet:
              _socNetCtrlList.value.map<String>((ctrl) => ctrl.text).toList(),
          importantDate: [],
          comment: "");
      model.contact = newContact;
    if (model.selectedContact == null) {
      await model.saveContact();
    } else {
      await model.updateContact();
    }
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const ContactsListScreenWidget(),
      ),
    );
  }
  
  @override
  void addEmail() {
    TextEditingController controller = TextEditingController();
    controller.text = "";
    _emailCtrlList.value.add(controller);
    _emailCtrlList.notifyListeners();
  }

  @override
  void addSocNet() {
    TextEditingController controller = TextEditingController();
    controller.text = "";
    _socNetCtrlList.value.add(controller);
    _socNetCtrlList.notifyListeners();
  }
    
}