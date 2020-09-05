import UIKit

var str:String?

if let words = str{
    print(words)
}else{
    print("words is nil")
}

str = "bob"

if str != nil{
    print(str!)
}else{
    print("words is nil")
}

enum Book: String {
    case fiction , nonfiction, mystery, adventure
}

var book:Book
book = .fiction
