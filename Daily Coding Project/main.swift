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
//For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
//
//Bonus: Can you do this in one pass?
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
