import Foundation

var str = "Hello, playground"

Calendar.current.firstWeekday

var calendar = Calendar(identifier: .gregorian)
calendar.locale = Locale(identifier: "fr")
calendar.firstWeekday

calendar.shortWeekdaySymbols

let array = [1, 2, 3]


let t = array.first { $0 == 3 }
t
array[1..<array.count] + array[0..<1]

func daysInCurrentCalendarOrder() -> ArraySlice<String> {
    var calendar = Calendar.current
    let firstWeekday = min(max(calendar.firstWeekday, 1), 7) - 1 // 0-6 indexed rather than 1-7
    let allDays = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
    let days = allDays[firstWeekday..<allDays.count] + allDays[0..<firstWeekday]
    return days
}

daysInCurrentCalendarOrder()


protocol Thing {}

extension Thing {
    static func printThing() {
        print("Blah")
    }
}

struct Thingy: Thing {}

let thing = Thingy()
let thingType = type(of: thing)
thingType.printThing()
