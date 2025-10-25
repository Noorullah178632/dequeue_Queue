class Hashing {
  int tableSize;
  List<List<dynamic>> table = [];
  Hashing(this.tableSize) {
    for (int i = 0; i < tableSize; i++) {
      table.add([]);
    }
  }
  //make a function for hashing
  int hashFunction(dynamic key) {
    int hash = 0;
    if (key is int) {
      hash = key;
    } else if (key is String) {
      for (int i = 0; i < key.length; i++) {
        hash += key.codeUnitAt(i);
      }
    } else {
      hash = key.hashCode;
    }
    return hash % tableSize;
  }

  //insetion in hash Function
  void insert(dynamic key) {
    int hash = hashFunction(key);
    table[hash].add(key);
    print("Key:$key is successfully added at index:$hash");
  }

  //Deletion
  void delete(dynamic key) {
    int hash = hashFunction(key);
    if (table[hash].contains(key)) {
      table[hash].remove(key);
      print("Key:$key has been removed ");
    } else {
      print("Key:$key is not found in the table ");
    }
  }

  //searching
  void search(dynamic key) {
    int hash = hashFunction(key);
    if (table[hash].contains(key)) {
      print("Key:$key found in the list ");
    } else {
      print("Not found");
    }
  }

  void display() {
    print("Table :$table");
  }
}

void main() {
  Hashing a = Hashing(9);
  a.insert("salman");
  a.insert("Noorullah");
  a.insert(2);
  a.insert(20);
  a.insert("key");
  a.insert("saad");
  a.insert("subhan");
  a.insert(22);
  a.delete("salman");
  a.delete("subhan");
  a.delete("a");
  a.display();
}
