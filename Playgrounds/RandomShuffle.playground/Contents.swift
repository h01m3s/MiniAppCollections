import UIKit

let nums = [1, 3, 4, 5, 2, 6]

func shuffledArray<T>(arr: [T]) -> [T] {
    var mutableArr = arr
    var shuffledArr = [T]()
    
    while mutableArr.count > 0 {
        let randomIndex = Int.random(in: 0..<mutableArr.count)
        let removedItem = mutableArr.remove(at: randomIndex)
        shuffledArr.append(removedItem)
    }
    
    return shuffledArr
}

shuffledArray(arr: nums)
