/*:
 
 # HashTable
 
 ### Definition
 
 HashTable or HashMap is a super efficient data structure that allows basically constant time for key/value lookup.
 
 ### How it works
 
 Intuitively is hard to understand how searching for a key in a table could ever be a constant time operation O(1), because the obvious aproach for doing so would be iterating through every key of the table, and at the worst case scenario, the last key of the table would be the one you are searching for, hence linear time O(n).
 
 To do so there is a magic step: the hashing function.
 
 The hashing function receive the key of the key/value pair to be stored, and generates an array index where this key/value will be stored. Later, to retrieve the key/value pair, the key is passed to the hashing function once again. The function returns the array index where the desired key/value is stored. And we know that accessing an element in a array by its index is a constant time operation, as it is executing the hashing function.
 
 ### Hashing function
 
 A hashing function has the objective of getting a hashable key and generate an array index.
 
 One hashable object is any kind of object that can generate a numerical representation. A string could genarate this numerical representation by doing some type of arithimetical operation considering the ASC code of its characters. A arbitrary business object might be hashed using its ID, and so on.
 
 The choosen hashing function might vary a lot depending on the data to be hashed. Idealy you want to genarate hashs in homogeneus distribution (minimum concentration of values as possible). If the data has a lot of patterns or fixed values, you want to use a function that is not biased for theese values.
 
 Example: We want to create a HashTable to store products, and we decide that we will use the serial ID to be the key. But all our serial codes end with the year where the product was manufactured (like "xxxx-xxxx-xxxx-2020)". To avoid having biases and genarate too many duplicated hashs we could have our hashing function removing the last 4 characters first, or maybe amassing all the numbers to genarate a single one with a reduce-like function.
 
 ### Colisions
 
 As you might have figured, hashing functions don't garantee that hashs will be unique. So instead of saving a key/value for each index of the array, we save a bucket of values instead. This bucket is just an array, so in the end the table that actually stores data is an array of arrays. When different key/values generates the same hash and go to the same bucket, we call it a colision.
 
 When searching for a key/value in a bucket we actually have to iterate through every element to find it, which leads to efficiency O(bucket_size). So to make a HashTable linear time O(1), bucket_size should be 1. In order to come as close as possible to achieve that, it is necessary to implement a hashing function that does a good job on distributing key/values into bucket equally. On the best case scenario, there will be one key/value per bucket to be perfectly time efficient, and have no empty buckets for space efficiency.
*/

import HashTable_PageSources

// MARK: - Creates hashable objects and a hashing function

func simpleHashingFunction(key: Hashable) -> Int {
    let hash = key.intRepresentation() % 31
//    print("Generated hash -> \(hash)")
    return hash
}

extension Int: Hashable {
    public func intRepresentation() -> Int {
        self
    }
}

// MARK: - Tests HashTable

var hashTable = HashTable<Int, String>(hashingFunction: simpleHashingFunction, tableSize: 31)

hashTable.append(element: (123, "OneTwoThree")) // 123 % 31 -> Genrates hash 30

hashTable.append(element: (115, "OneOneFive")) // 123 % 31 -> Genrates hash 22
hashTable.append(element: (30, "ThreeZero")) // 30 % 31 -> Genrates hash 30

/*
 At this point the table looks like
--------------------------------------------------
[0 ... 21] -> nil
[22] -> (115, "OneOneFive")
[23 ... 29] -> nil
[30] -> (30, "ThreeZero"), (123, "OneTwoThree")
[31 ... 32] -> nil
 -------------------------------------------------
*/

print(hashTable.get(elementWithKey: 0)?.value as Any) // nil
print(hashTable.get(elementWithKey: 30)?.value as Any) // ThreeZero
print(hashTable.get(elementWithKey: 115)?.value as Any) // OneOneFive
print(hashTable.get(elementWithKey: 123)?.value as Any) // OneTwoThree
print(hashTable.get(elementWithKey: 321)?.value as Any) // nil
