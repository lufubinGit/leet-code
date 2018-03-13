//: Playground - noun: a place where people can play

import UIKit
//
//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note: The solution set must not contain duplicate triplets.
//
//For example, given array S = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var lowSet = Set<Int>()
        var zeroArr = [Int]()
        var hightSet = Set<Int>()
        var dic1 = [Int:[Int]]()
        var dic2 = [Int:[Int]]()
        var set = Set<Set<Int>>()
        
        for (index,a) in nums.enumerated() {
            if a > 0 {
                hightSet.insert(a)
                if let arr = dic2[a] {
                    var ar = [Int].init(arr)
                    ar.append(index)
                    dic2.updateValue(ar, forKey: a)
                }else{
                    dic2.updateValue([index], forKey: a)
                }
            }
            else if a < 0 {
                lowSet.insert(a)
                if let arr = dic1[a] {
                    var ar = [Int].init(arr)
                    ar.append(index)
                    dic1.updateValue(ar, forKey: a)
                }else{
                    dic1.updateValue([index], forKey: a)
                }
            }
            else {zeroArr.append(a) }
        }
        
        var result = [[Int]]()
        lowSet.forEach { (a) in
            hightSet.forEach({ (b) in
                let value = a + b
                if value == 0 && !zeroArr.isEmpty{
                    result.append([a,b,0])
                }else if value < 0{
                    if let indexAr = dic2[-value]{
                        if -value == b {
                            if indexAr.count >= 2{
                                result.append([a,b,-value].sorted())
                            }
                        } else{
                            set.insert(Set<Int>.init([a,b,-value].sorted()))
                        }
                        
                    }
                }else {
                    if let indexAr = dic1[-value]{
                        if -value == a {
                            if indexAr.count >= 2{
                                result.append([a,b,-value].sorted())
                            }
                        }else{
                            set.insert(Set<Int>.init([a,b,-value].sorted()))
                        }
                    }
                }
            })
        }
        
        if zeroArr.count >= 3{
            result.append([0,0,0])
        }
        set.forEach { (set) in
            let arr = [Int].init(set)
            result.append(arr)
        }
        
        return result
    }

    //解 2
func threeSum2(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [] }
    let nums = nums.sorted{$0 < $1}
    
    var result = [[Int]]()
    
    for i in 0..<nums.count - 2 {
        if nums[i] > 0 { break }      //  去重第一步
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }
        let target = -nums[i]
        // find two sums
        var j = i+1, k = nums.count - 1
        while j < k {  //去重第二步
            let sum = nums[j] + nums[k]
            if sum > target {
                k -= 1
            }
            else if sum < target {
                j += 1
            }
            else {
                result.append([nums[i], nums[j], nums[k]])
                j += 1
                while j < k && nums[j] == nums[j-1] {
                    j += 1
                }
                k -= 1
                while k > j && nums[k] == nums[k+1] {
                    k -= 1
                }
            }
        }
    }
    
    return result
}

