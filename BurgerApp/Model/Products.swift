import Foundation

struct Products: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let subName: String
    let rating: String
    let image: CustomImage
    let favorite: Bool
    let timeOfCooking: String
    let price: String
    let category: Category
    
    static var mock: Self {
        .init(
            name: "333f",
            subName: "wwg",
            rating: "4.3",
            image: .Burger1,
            favorite: false,
            timeOfCooking: " - 29 min",
            price: "350 ₽",
            category: .classic
        )
    }
}

extension Products {
    
    static let sampleProducts: [Products] = [
        Products(
            name: "Чизбургер",
            subName: "Сочный чизбургер с говяжьей котлетой, расплавленным сыром и секретным соусом.",
            rating: "4.3",
            image: .bigBurger1,
            favorite: false,
            timeOfCooking: " - 34 min",
            price: "500 ₽",
            category: .classic
        ),
        Products(
            name: "Королевский Чизбургер",
            subName: "Королевский не просто так, королевский потому что это не просто чизбургер.",
            rating: "4.4",
            image: .bigBurger2,
            favorite: false,
            timeOfCooking: " - 36 min",
            price: "550 ₽",
            category: .combo
        ),
        Products(
            name: "Королевский гамбургер",
            subName: "СКоролевский не просто так, королевский потому что это не просто чизбургер.",
            rating: "4.5",
            image: .bigBurger3,
            favorite: false,
            timeOfCooking: " - 35 min",
            price: "450 ₽",
            category: .combo
        ),
        Products(
            name: "Вегетарианский гамбургер",
            subName: "Для любителей зеленого цвета",
            rating: "4.3",
            image: .Burger4,
            favorite: false,
            timeOfCooking: " - 15 min",
            price: "350 ₽",
            category: .vegetarian
        ),
        Products(
            name: "Куриный гамбургер",
            subName: "Сочный гамбургер с куринной котлетой, расплавленным сыром и секретным соусом.",
            rating: "4.3",
            image: .bigBurger4,
            favorite: false,
            timeOfCooking: " - 24 min",
            price: "400 ₽",
            category: .classic
        ),
        Products(
            name: "Лосось бургер",
            subName: "С лососем",
            rating: "4.3",
            image: .Burger1,
            favorite: false,
            timeOfCooking: " - 26 min",
            price: "650 ₽",
            category: .sleders
        ),
        Products(
            name: "Все тот же Бургер",
            subName: "Ничего не меняется",
            rating: "4.3",
            image: .Burger1,
            favorite: false,
            timeOfCooking: " - 27 min",
            price: "360 ₽",
            category: .classic
        ),
        Products(
            name: "МожетНовый",
            subName: "СМожет и новый",
            rating: "4.3",
            image: .Burger2,
            favorite: false,
            timeOfCooking: " - 4 min",
            price: "370 ₽",
            category: .sale
        ),
        Products(
            name: "Ага",
            subName: "ааааа",
            rating: "4.3",
            image: .Burger1,
            favorite: false,
            timeOfCooking: " - 23 min",
            price: "750 ₽",
            category: .sale
        )
    ]
}
