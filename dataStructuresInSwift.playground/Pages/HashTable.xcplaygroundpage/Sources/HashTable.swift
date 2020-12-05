import Foundation

public protocol Hashable {
    func intRepresentation() -> Int
}
 
public struct HashTable<Key: Hashable & Equatable, Value: Any> {
    
    var table: [[(key: Key, value: Value)]] = [[]]
    var hashingFunction: (Hashable) -> Int
    
    public init(hashingFunction: @escaping (Hashable) -> Int, tableSize: Int) {
        self.hashingFunction = hashingFunction
        table = Array(repeating: [], count: tableSize)
    }
    
    public mutating func append(element: (key: Key, value: Value)) {
        let index = hashingFunction(element.key)
        table[index].append(element)
    }
    
    public func get(elementWithKey key: Key) -> (key: Key, value: Value)? {
        let index = hashingFunction(key)
        let bucket = table[index]
        return bucket.first { $0.key == key }
    }
}
