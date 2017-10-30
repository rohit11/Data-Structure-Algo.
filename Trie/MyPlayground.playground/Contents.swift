import UIKit


class TrieNode {
    var child : [Character : TrieNode] = [:]
    var isFinal : Bool = false
    
    func createChildFor(_ character : Character) -> TrieNode {
        let node = TrieNode()
        self.child[character] = node
        return node
    }
    
    func getOrCreateChildFor(character : Character) -> TrieNode {
        
        if let childNode = child[character] {
            return childNode
        }
          return createChildFor(character)
    }
}


class Trie {
    var root : TrieNode =  TrieNode()
    
    func addWord(_ word : String) {
        let characters = Array(word.characters)
        var node = root

        for character in characters {
            node = node.getOrCreateChildFor(character: character)
        }
        node.isFinal = true
    }
    
    func findWord( _ word : String) -> Bool {
      let characters = Array(word.characters)
        
        var node : TrieNode? = root
        for character in characters {
            node = node?.child[character]
            if node == nil {
                return false
            }
        }
        return node!.isFinal
    }
}

var trie : Trie = Trie()
trie.addWord("Rohit")
trie.addWord("Tejas")
trie.addWord("Rishabh")
trie.findWord("Rohit")
trie.findWord("Teja")
trie.findWord("Rishabh")




