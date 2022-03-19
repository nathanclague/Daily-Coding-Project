//
//  main.swift
//  Daily Coding Project
//
//  Created by Nathan Clague on 3/18/22.
//

import Foundation

print("Hello, World!")

//  Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
//
//  For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
//
//  Bonus: Can you do this in one pass?
func problem_1<T: Sequence, U: AdditiveArithmetic>
(seq: T, k: U) -> Bool
where T.Element == U {
    for i in seq {
        for j in seq {
            if (k == (i + j)) {
                return true
            }
        }
    }
    return false
}

//  Without further clarification of what constitutes a "pass", it is difficult to answer this question.
//  If "pass" is relative to O() performance, the best option that I could come up with would be O(n log n). My process would begin with sorting the sequence / list. Then, I would take the 1st element in the sequence / list and search for its compliment in the sorted sequence / list using a binary search.
//  If "pass" is defined as touching, accessing, or reading each element in the sequence / list exactly once, then the only way to aproach this problem would be to require that the input sequence / list be pre-sorted. Assuming that the sequence is sorted in ascending order, you could start by accessing the elements at the head and tail of the sequence. If their sum is greater than k, compare the head with the second to last. And if the sum is less than k, compare the second item with the tail. Repeat these steps until your indicies cross or until you reach a pair that add up to k. One caveat to this approach is that you technically end up accessing each element in the array twice on average.



//  Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.
//
//  For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].
//
//  Follow-up: what if you can't use division?
func problem_2(arr: [Int]) -> [Int] {
    var product = 1
    var output: [Int] = []
    for value in arr {
        product = product * value
    }
    for value in arr {
        output.append(product / value)
    }
    return output
}

func problem_2_follow_up(arr: [Int]) -> [Int] {
    var output: [Int] = []
    if arr.isEmpty {
        return output
    }
    for i in 0...arr.count-1 {
        var product = 1
        for j in 0...arr.count-1 {
            if i != j {
                product = product * arr[j]
            }
        }
        output.append(product)
    }
    return output
}

print(problem_2_follow_up(arr: [1, 2, 3, 4, 5]))
print(problem_2_follow_up(arr: [3, 2, 1]))
print(problem_2_follow_up(arr: []))
