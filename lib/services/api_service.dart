import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/contact.dart';

/// Service pour les opérations CRUD avec l'API
class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  /// GET - Récupérer tous les contacts
  Future<List<Contact>> getContacts() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors du chargement des contacts');
    }
  }

  /// GET - Récupérer un contact par ID
  Future<Contact> getContact(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return Contact.fromJson(json.decode(response.body));
    } else {
      throw Exception('Contact non trouvé');
    }
  }

  /// POST - Créer un nouveau contact
  Future<Contact> createContact(Contact contact) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()),
    );

    if (response.statusCode == 201) {
      return Contact.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur lors de la création du contact');
    }
  }

  /// PUT - Modifier un contact existant
  Future<Contact> updateContact(Contact contact) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/${contact.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()),
    );

    if (response.statusCode == 200) {
      return Contact.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur lors de la modification du contact');
    }
  }

  /// DELETE - Supprimer un contact
  Future<bool> deleteContact(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Erreur lors de la suppression du contact');
    }
  }
}
