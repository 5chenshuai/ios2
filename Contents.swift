//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array = [Int]()
var isPreimNum = true
for i in 2...100{
    for j in 2..<i{
        if i%j == 0 {
            isPreimNum = false
            break;
        }
    }
    
    
    if isPreimNum {
        
        array.append(i)
    }
    isPreimNum = true
    
}

print(array)
func compare(num1:Int,num2:Int) -> Bool{
    return num1>num2
}

array.sort(by:compare)
print(array)

array.sort(by:{(num1:Int,num2:Int) -> Bool in return num1 > num2})
print(array)

array.sort(by:{(num1,num2) -> Bool in return num1 > num2})
print(array)

array.sort(by:{return $0 > $1})
print(array)

array.sort(by:{$0 > $1})
print(array)


array.sort(){$0 > $1}
print(array)




enum Gender:Int{
    case male = 1
    case female
    
}
//    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；

class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        set{
            
        }
        get{
            return firstName+lastName
        }
    }
//  具有指定构造函数和便利构造函数；
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male)
    }
//  Person实例可以直接用print输出；
    func description() -> String {
        return "firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) gender:\(self.gender)"
    }
}
//两个Person实例对象可以用==和!=进行比较；
func ==(p1:Person,p2:Person) -> Bool{
    return p1.fullName == p2.fullName
}
func !=(p1:Person,p2:Person) -> Bool{
    return p1.fullName != p2.fullName
}
var p1 = Person(firstName: "li", lastName: "guiyang", age: 47, gender: Gender.male)
var p2 = Person(name: "gaoyuexiang")
if p1 == p2 {
    print("==")
}
if p1 != p2 {
    print("!=")
}
//  从Person分别派生Teacher类和Student类：
//  •    Teacher类增加属性title，实例可以直接用print输出；
//    •    Student类增加属性stuNo，实例可以直接用print输出；

class Teacher:Person{
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
}
class Student:Person{
    var stuNo:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
}


var t1 = Teacher(firstName: "liao", lastName: "xuehua", age: 18, gender: Gender.female, title: "c")
var t2 = Teacher(firstName: "xia", lastName: "yu", age: 80, gender: Gender.male, title: "java")
var s1 = Student(firstName: "xiao", lastName: "ming", age: 20, gender: Gender.male, stuNo: "001")
var s2 = Student(firstName: "xiao", lastName: "zhu", age: 19, gender: Gender.female, stuNo: "002")
//  分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var array1 = [p1,p2,t1,t2,s1,s2]

//  对数组执行以下要求：
//    •    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；

var per:Int = 0
var tea:Int = 0
var stu:Int = 0
for i in 0..<array1.count {
    if array1[i] is Student {
        stu = stu + 1
    }else if array1[i] is Teacher{
        tea = tea + 1
    }else{
        per = per + 1
    }
}

var dict = [String:Int]()
dict["Person"] = per
dict["Student"] = stu
dict["Teacher"] = tea

for(key,value) in dict{
    print("\(key):\(value)")
}
//    •    对数组按以下要求排序并输出：age、fullName、gender+age；
array1.sort(by: {
    (per1:Person,per2:Person) -> Bool in
        return per1.age > per2.age
})
print("按年龄")
for a in array1 {
    print(a.description())
}


array1.sort(by: { $0.fullName > $1.fullName })
print("按姓名")
for a in array1 {
    print(a.description())
}


array1.sort(by: { String($0.gender.rawValue)+String($0.age) >  String($1.gender.rawValue)+String($1.age) }
)
print("按性别年龄")
for a in array1 {
    print(a.description())
}











