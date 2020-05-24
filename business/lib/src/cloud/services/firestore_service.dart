import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../business.dart';

class FirestoreService {

  Future<String> createGame(BoardCloudSpecs specs) async {
    final path = '/games';
    final collections = Firestore.instance.collection(path);
    var docRef = collections.document();
    print('documento criado: ${docRef.documentID}');
    await docRef.setData(specs.toMap());
    return docRef.documentID;
  }

  Stream<BoardCloudSpecs> getGameStream(String id) {
    final path = 'games/$id';
    final docRef = Firestore.instance.document(path);
    final snapshots = docRef.snapshots();
    return snapshots.map((snapshot){
      return BoardCloudSpecs.fromObject(snapshot.data);
    });
  }

  Future<bool> checkIfGameExists(String id) async {
    final path = 'games/$id';
    final doc = await Firestore.instance.document(path).get();
    return doc.exists;
  }

  Future<void> updateGame(String id, BoardCloudSpecs specs) async {
    final path = 'games/$id';
    var docRef = Firestore.instance.document(path);
    await docRef.setData(specs.toMap(), merge: true);
    print('jogo atualizado no firebase');
  }

}
