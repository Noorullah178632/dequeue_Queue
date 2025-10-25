//this code is for open addresing
class OpenAddressing {
  int tableSize;
  late List<dynamic> table;
  OpenAddressing(this.tableSize) {
    table = List.filled(tableSize, null);
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

  //linear probing
  void linearProbingInsertion(dynamic key) {
    int hash = hashFunction(key);
    int newHash = hash;

    while (table[hash] != null) {
      print("Collision occured at index $hash for key :$key ");
      hash = (hash + 1) % tableSize;
      if (hash == newHash) {
        print("The List is full and we can't add key:$key");
        return;
      }
    }

    table[hash] = key;
    print("Key:$key has been added in the linear probing having index:$hash");
  }

  //delete
  void delete(dynamic key) {
    int hash = hashFunction(key);
    int newHash = hash;
    while (table[hash] != null) {
      if (table[hash] == key) {
        table[hash] = null;
        print("Key:$key has been removed at index :$hash");
        return;
      }
      hash = (hash + 1) % tableSize;
      if (hash == newHash) {
        break;
      }
    }
    print("Key:$key not found in the table ");
  }

  //display list
  void display() {
    if (table.isNotEmpty) {
      print("Table:$table");
    } else {
      print("Table is empty!");
    }
  }
}

void main() {
  OpenAddressing a = OpenAddressing(4);
  a.linearProbingInsertion("salman");
  a.linearProbingInsertion(2);
  a.linearProbingInsertion(8);
  a.linearProbingInsertion(3);

  a.delete(111);
  a.delete(3);
  a.display();
}
