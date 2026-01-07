import 'package:flutter/foundation.dart';
import '../models/contact.dart';
import '../services/api_service.dart';

/// Provider pour gérer l'état des contacts avec filtrage
class ContactProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = []; // Pour la recherche
  String _searchQuery = '';
  
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Contact> get contacts => _searchQuery.isEmpty ? _contacts : _filteredContacts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;

  /// Charger tous les contacts depuis l'API
  Future<void> loadContacts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _contacts = await _apiService.getContacts();
      _applyFilter(); // Réappliquer le filtre si nécessaire
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Filtrer les contacts
  void search(String query) {
    _searchQuery = query;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (_searchQuery.isEmpty) {
      _filteredContacts = [];
    } else {
      _filteredContacts = _contacts.where((contact) {
        final query = _searchQuery.toLowerCase();
        return contact.name.toLowerCase().contains(query) ||
               contact.email.toLowerCase().contains(query);
      }).toList();
    }
  }

  /// Ajouter un nouveau contact
  Future<bool> addContact(Contact contact) async {
    try {
      // ignore: unused_local_variable
      final newContact = await _apiService.createContact(contact);
      final contactWithId = contact.copyWith(id: _contacts.length + 11);
      _contacts.insert(0, contactWithId);
      _applyFilter();
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Modifier un contact existant
  Future<bool> updateContact(Contact contact) async {
    try {
      await _apiService.updateContact(contact);
      final index = _contacts.indexWhere((c) => c.id == contact.id);
      if (index != -1) {
        _contacts[index] = contact;
        _applyFilter();
        notifyListeners();
      }
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Supprimer un contact
  Future<bool> deleteContact(int id) async {
    try {
      await _apiService.deleteContact(id);
      _contacts.removeWhere((c) => c.id == id);
      _applyFilter();
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
