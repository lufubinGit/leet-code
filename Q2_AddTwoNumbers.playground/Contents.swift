//: Playground - noun: a place where people can play

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    func des() -> String{
        var str = String(self.val)
        if self.next != nil{
            str = str + "->" + self.next!.des()
        }
        return str
    }
}

// 题2： 将两个链表中的数值先反向组成一个非负值，然后将得到的结果以链表的形式链表的形式
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

///// 解1  直接以将NodeList中的数值转化成整形 然后相加， 最后将结果转化成ListNode类型输出
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    func digValue(_ ln: ListNode) -> Int{
        var value = ln.val
        if ln.next != nil{
           value = digValue(ln.next!) * 10 + value
        }
        return value
    }
    
    func listNodeValue(_ d: Int) -> ListNode{
        let value = d % 10
        let dNext = d / 10
        let listN = ListNode.init(value)
        if dNext > 0 {
           listN.next = listNodeValue(dNext)
        }
        return listN
    }
    return listNodeValue(digValue(l1!) + digValue(l2!))
}

var l1 = ListNode.init(2)
l1.next = ListNode.init(4)
l1.next?.next = ListNode.init(3)
//l1.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
//l1.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next?.next = ListNode.init(3)
l1.des()
var l2 = ListNode.init(5)
l2.next = ListNode.init(6)
l2.next?.next = ListNode.init(4)
l2.des()
//addTwoNumbers(l1, l2)?.des()
///// 总结： 这样的做法只适合位数较少的链表，如果链表的长度增加，则会因为没有足够位数的数字表示而导致失败。  所以这个算法是不合适的




///// 解2 采用递归逐个相加的方式
func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
//    let value1 = l1 != nil ? l1!.val : 0
//    let value2 = l1 != nil ? l2!.val : 0
    let value = (l1 != nil ? l1!.val : 0) + (l2 != nil ? l2!.val : 0)
    
    let ln = ListNode.init(value%10)
    if l1?.next != nil || l2?.next != nil{
        ln.next = addTwoNumbers(l1?.next, l2?.next)
    }
    if value >= 10  {
        if ln.next != nil {
            ln.val = ln.val + 1
        }else{
            ln.next = ListNode(1)
        }
    }
    return ln
}

addTwoNumbers2(l1, l2)?.des()

// 总结 递归产生极大的内存消耗，最终依旧不能处理长链表中的数据

///// 解 3 使用字符串进行转移
func addTwoNumbers3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    func strValue(_ ln: ListNode) -> String {
        var str = String(ln.val)
        if (ln.next != nil) {
            str.append(strValue(ln.next!))
        }
        return str
    }
    
    func firstStrInt(_ s: String?) -> Int{
        guard (s != nil) else {
            return 0
        }
        return Int(String(describing: s!.first))!
    }
    
    func nextList(_ str1:String, _ str2: String) -> ListNode{
        let value = firstStrInt(str1) + firstStrInt(str2)
        let ln = ListNode(value)

        let s1 = str1.dropFirst()
        let s2 = str2.dropFirst()
        if s1.count > 0 || s2.count > 0{
            ln.next = nextList(String(s1), String(s2))
            if value >= 10 {
                ln.next?.val = ln.next!.val + 1
            }
        }
       return ln
    }
    
 strValue(l1!)
 strValue(l2!)
    return nextList( strValue(l1!),  strValue(l2!))
}


///// 解 4  优化

func addTwoNumbers4(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var ln1 = l1
    var ln2 = l2
    var valueArr1 = [Int]()
    var valueArr2 = [Int]()
    repeat{
        valueArr1.append((ln1?.val)!)
        ln1 = ln1?.next
    }while(ln1 != nil)
    
    repeat{
        valueArr2.append((ln2?.val)!)
        ln2 = ln2?.next
    }while(ln2 != nil)
    
    let ln = ListNode(0)
    var next: ListNode? = ln
    let maxCount = max(valueArr1.count, valueArr2.count)
    
    for i in 0..<maxCount {
        let c = (valueArr1.count > i ? valueArr1[i] : 0) + (valueArr2.count > i ? valueArr2[i] : 0)
        let a = c % 10 + next!.val
        next?.val = a % 10
        if  a  >= 10 {
            next?.next = ListNode(1)
        }else{
            next?.next = ListNode(0)
        }
        if c >= 10 {
            next?.next?.val = (next?.next?.val)! + 1
        }
        
        if i == maxCount - 1{
            if next?.next?.val == 0{
                next?.next = nil
            }
        }
        next = next?.next
    }
    return ln
}





