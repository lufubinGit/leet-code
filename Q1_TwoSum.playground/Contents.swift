//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 题目： 给定一个Int类型的数组和一个目标值，从数组中找出两个元素，要出满足两个元素之和等于目标值。 最后输出两个元素的下标值。
// 例如：
// Given nums = [2, 7, 11, 15], target = 9,
//
// Because nums[0] + nums[1] = 2 + 7 = 9,
//
// return [0, 1].

/////  解1  最简单粗暴的方式
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i != j && nums[i] + nums[j] == target{
                return [i,j]
            }
        }
    }
    return []
}
twoSum([2, 7, 11, 15], 9)
twoSum([5,6767,7,6565,99,656,12,-5,67, 7, 11, 15], 10)
// 总结： 时间复杂度为O(N^2)

///// 解2  利用哈希 以空间换时间
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dic = [Int: Int]()
    for (index,value) in nums.enumerated(){
        dic.updateValue(index, forKey: value)
    }
    for i in 0..<nums.count {
        if let a = dic[target - nums[i]] {
            if i != a {
                return [i,a]
            }
        }
    }
    return []
}
twoSum2([2, 7, 11, 15], 9)
twoSum2([5,6767,7,6565,99,656,12,-5,67, 7, 11, 15], 10)
// 总结： 时间复杂度为O(N*2)

///// 解3  --  对解2进行优化
func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dic = [Int: Int]()
    for i in 0..<nums.count {
        if let a = dic[target - nums[i]] {
            if i != a {
                return [i,a]
            }
        }else{
            dic.updateValue(i, forKey: nums[i])
        }
    }
    return []
}
twoSum3([2, 7, 11, 15], 9)
twoSum3([5,6767,7,6565,99,656,12,-5,67, 7, 11, 15], 10)
// 总结： 时间复杂度为O(N)


