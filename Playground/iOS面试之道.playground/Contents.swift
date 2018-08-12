import Cocoa

// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************
// Generics Stack
class Stack<T> {
    var stack: [T]
    var isEmpty: Bool { return stack.isEmpty }
    var peek: T? { return stack.last }
    
    init() {
        stack = [T]()
    }
    
    func push(element: T) {
        stack.append(element)
    }
    
    func pop() -> T? {
        return !isEmpty ? stack.removeLast() : nil
    }
}

var ss = Stack<String>()
ss.push(element: "123")
ss.peek
let last = ss.pop()
let theLast = ss.pop()

// Use protocol to implement Stack
protocol StackProtocol {
    associatedtype T
    
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: T? { get }
    mutating func push(_ element: T)
    mutating func pop() -> T?
}

struct PStack<T>: StackProtocol {
    
    private var stack: [T]
    var isEmpty: Bool { return stack.isEmpty }
    var size: Int { return stack.count }
    var peek: T? { return stack.last }
    
    init() {
        stack = [T]()
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return !isEmpty ? stack.removeLast() : nil
    }
}

var ps = PStack<Int>()
ps.push(5)
ps.peek
// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************

// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************
// Count String by map it into set of (char, 1), then use Dictionary initilizer to count char
let count = Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +)
print(count)

let arrMap = "hello".map { ($0, 1) }
print(arrMap)
// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************

// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************
// MARK: Revers words in sentence
fileprivate func _reverse<T>(_ chars: inout [T], _ start: Int, _ end: Int) {
    var start = start, end = end
    while start < end {
        _swap(&chars, start, end)
        start += 1
        end -= 1
    }
}

fileprivate func _swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
    (chars[p], chars[q]) = (chars[q], chars[p])
}

func reverseWords(s: String?) -> String? {
    guard let s = s else { return  nil }
    
    var chars = Array(s.map { $0 }), start = 0
    _reverse(&chars, 0, chars.count - 1)
    // ["e", "u", "l", "b", " ", "s", "i", " ", "y", "k", "s", " ", "e", "h", "t"]
    
    for i in 0 ..< chars.count {
        // Reverse chars from start to i if i is the index of last char OR next char is " "
        // start reverse index + 2 after reverse
        if i == chars.count - 1 || chars[i + 1] == " " {
            _reverse(&chars, start, i)
            start = i + 2
        }
    }
//    ["b", "l", "u", "e", " ", "i", "s", " ", "s", "k", "y", " ", "t", "h", "e"]
    return String(chars)
}

let rs = reverseWords(s: "the sky is blue")
// ********************************************************************************************************************
// ********************************************************************************************************************
// ********************************************************************************************************************























