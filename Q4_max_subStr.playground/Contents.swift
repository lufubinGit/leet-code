//: Playground - noun: a place where people can play

//// 求字符串中 最长的不重复的字符串
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 {return s.count }
    var maxValue = 1
    var startIndex = 0
    var dic = [Character:Int]()
    for (index,c) in s.enumerated() {
        if let idxValue = dic[c]{
            if idxValue >= startIndex{
                startIndex = idxValue + 1
            }
        }
        maxValue = max(maxValue, index - startIndex)
        dic.updateValue(index, forKey: c)
    }
    return maxValue
}
