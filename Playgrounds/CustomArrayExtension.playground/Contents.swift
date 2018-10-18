import UIKit

// Softball Question
// function that can sum up a list of numbers

func sum(numbers: [Int]) -> Int {
//    var res = 0
//    numbers.forEach { (num) in
//        res += num
//    }
//    return res
    return numbers.reduce(0, {$0 + $1})
}

extension Array where Element: Numeric {
    
    func customSum() -> Element {
        return self.reduce(0, {$0 + $1})
    }
    
}

[1.2, 2.4].customSum()
sum(numbers: [1, 2, 3, 4, 5])

extension Array where Element == String {
    
    func concatenate() -> String {
        return self.reduce("", {$0 + " " + $1})
    }
    
}

["Hello", "World", "!"].concatenate()





