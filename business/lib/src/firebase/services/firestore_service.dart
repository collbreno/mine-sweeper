import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../business.dart';

class FirestoreService {

  Future<String> createGame(BoardSpecs specs) async {
    final path = '/games';
    final collections = Firestore.instance.collection(path);
    var docRef = collections.document();
    print('documento criado: ${docRef.documentID}');
    await docRef.setData(specs.toMap());
    return docRef.documentID;
  }

  Future<void> updateGame(String id, BoardSpecs specs) async {
    final path = 'games/$id';
    var docRef = Firestore.instance.document(path);
    await docRef.setData(specs.toMap(), merge: true);
    print('jogo atualizado no firebase');
  }

}
