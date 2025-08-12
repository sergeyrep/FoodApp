import Foundation

struct Products: Identifiable, Equatable {
  let id = UUID()
  let name: String
  let subName: String
  let rating: String
  let image: CustomImage
  var favorite: Bool
  let timeOfCooking: String
  let price: Double
  let category: Category
  
  static var mock: Self {
    .init(
      name: "333f",
      subName: "wwg",
      rating: "4.3",
      image: .Burger1,
      favorite: false,
      timeOfCooking: " - 29 min",
      price: 350,
      category: .classic
    )
  }
}

extension Products {
  
  static let sampleProducts: [Products] = [
    Products(
      name: "Чизбургер Классик",
      subName: "Говяжья котлета, сыр Чеддер, фирменный соус",
      rating: "4.5",
      image: .bigBurger1,
      favorite: false,
      timeOfCooking: "15-20 мин",
      price: 450,
      category: .classic
    ),
    Products(
      name: "Бекон Чизбургер",
      subName: "С подкопченным беконом и двойным сыром",
      rating: "4.7",
      image: .bigBurger2,
      favorite: false,
      timeOfCooking: "20-25 мин",
      price: 550,
      category: .classic
    ),
    Products(
      name: "Веган Бургер",
      subName: "На основе горохового белка с овощами",
      rating: "4.3",
      image: .bigBurger3,
      favorite: false,
      timeOfCooking: "10-15 мин",
      price: 400,
      category: .vegetarian
    ),
    Products(
      name: "Куриный Ранч",
      subName: "С куриной котлетой и соусом Ранч",
      rating: "4.4",
      image: .bigBurger4,
      favorite: false,
      timeOfCooking: "12-18 мин",
      price: 420,
      category: .classic
    ),
    Products(
      name: "Комбо Обед №1",
      subName: "Чизбургер + картофель фри + напиток",
      rating: "4.6",
      image: .burgerCola,
      favorite: false,
      timeOfCooking: "25-30 мин",
      price: 650,
      category: .combo
    ),
    Products(
      name: "Острый Дьявол",
      subName: "С перцем халапеньо и острым соусом",
      rating: "4.8",
      image: .diablo,
      favorite: false,
      timeOfCooking: "18-22 мин",
      price: 480,
      category: .spicy
    ),
    Products(
      name: "Двойной Бекон",
      subName: "Две говяжьи котлеты с тройным беконом",
      rating: "4.9",
      image: .doubleBecon,
      favorite: false,
      timeOfCooking: "25-30 мин",
      price: 690,
      category: .classic
    ),
    Products(
      name: "Грибной Бургер",
      subName: "С шампиньонами и сливочным соусом",
      rating: "4.2",
      image: .mushroomBurger,
      favorite: false,
      timeOfCooking: "15-20 мин",
      price: 430,
      category: .vegetarian
    ),
    Products(
      name: "Комбо Обед №2",
      subName: "Гамбургер + луковые кольца + напиток",
      rating: "4.5",
      image: .combo2,
      favorite: false,
      timeOfCooking: "20-25 мин",
      price: 580,
      category: .combo
    ),
    Products(
      name: "Черный Бургер",
      subName: "С черной булочкой и фирменным соусом",
      rating: "4.7",
      image: .black,
      favorite: false,
      timeOfCooking: "18-22 мин",
      price: 520,
      category: .all
    ),
    Products(
      name: "Рыбный Бургер",
      subName: "С котлетой из лосося и лимонным соусом",
      rating: "4.4",
      image: .fish,
      favorite: false,
      timeOfCooking: "15-20 мин",
      price: 570,
      category: .sleders
    ),
    Products(
      name: "Детский Набор",
      subName: "Мини-бургер + картофель + игрушка",
      rating: "4.6",
      image: .kids,
      favorite: false,
      timeOfCooking: "10-15 мин",
      price: 350,
      category: .all
    ),
    Products(
      name: "Тройной Чизбургер",
      subName: "Три котлеты и четыре вида сыра",
      rating: "4.9",
      image: .triple,
      favorite: false,
      timeOfCooking: "30-35 мин",
      price: 750,
      category: .classic
    ),
    Products(
      name: "Сырные Палочки",
      subName: "Хрустящие с соусом маринара",
      rating: "4.3",
      image: .cheez,
      favorite: false,
      timeOfCooking: "8-12 мин",
      price: 280,
      category: .snacks
    ),
    Products(
      name: "Комбо Обед №3",
      subName: "Двойной бургер + картофель + напиток",
      rating: "4.7",
      image: .combo3,
      favorite: false,
      timeOfCooking: "25-30 мин",
      price: 720,
      category: .combo
    ),
    Products(
      name: "Бургер с Авокадо",
      subName: "Свежий авокадо и соус гуакамоле",
      rating: "4.5",
      image: .avocado,
      favorite: false,
      timeOfCooking: "15-20 мин",
      price: 490,
      category: .vegetarian
    ),
    Products(
      name: "Картофель Фри",
      subName: "Хрустящий с солью и травами",
      rating: "4.2",
      image: .friPotato,
      favorite: false,
      timeOfCooking: "7-10 мин",
      price: 180,
      category: .snacks
    ),
    Products(
      name: "Луковые Кольца",
      subName: "В хрустящей панировке",
      rating: "4.1",
      image: .luk,
      favorite: false,
      timeOfCooking: "8-12 мин",
      price: 220,
      category: .snacks
    ),
    Products(
      name: "Шоколадный Коктейль",
      subName: "Густой и насыщенный вкус",
      rating: "4.6",
      image: .chokoKokteil,
      favorite: false,
      timeOfCooking: "5-7 мин",
      price: 250,
      category: .drinks
    ),
    Products(
      name: "Ванильный Коктейль",
      subName: "Нежный сливочный вкус",
      rating: "4.5",
      image: .vanilKok,
      favorite: false,
      timeOfCooking: "5-7 мин",
      price: 250,
      category: .drinks
    ),
    Products(
      name: "Клубничный Коктейль",
      subName: "Свежий ягодный вкус",
      rating: "4.4",
      image: .klubnich,
      favorite: false,
      timeOfCooking: "5-7 мин",
      price: 250,
      category: .drinks
    ),
    Products(
      name: "Сет #1",
      subName: "2 бургера + картофель + 2 напитка",
      rating: "4.7",
      image: .set1,
      favorite: false,
      timeOfCooking: "30-35 мин",
      price: 950,
      category: .combo
    ),
    Products(
      name: "Сет #2",
      subName: "3 бургера + картофель + 3 напитка",
      rating: "4.8",
      image: .set1,
      favorite: false,
      timeOfCooking: "35-40 мин",
      price: 1250,
      category: .combo
    ),
    Products(
      name: "Бургер с Барбекю",
      subName: "С соусом барбекю и луковыми чипсами",
      rating: "4.6",
      image: .bbq,
      favorite: false,
      timeOfCooking: "18-22 мин",
      price: 530,
      category: .classic
    ),
    Products(
      name: "Бургер с Яйцом",
      subName: "С жареным яйцом и беконом",
      rating: "4.5",
      image: .eag,
      favorite: false,
      timeOfCooking: "20-25 мин",
      price: 570,
      category: .combo
    ),
    Products(
      name: "Салат Цезарь",
      subName: "С курицей и соусом Цезарь",
      rating: "4.3",
      image: .cesar,
      favorite: false,
      timeOfCooking: "10-15 мин",
      price: 350,
      category: .classic
    ),
    Products(
      name: "Греческий Салат",
      subName: "Свежие овощи и фета",
      rating: "4.2",
      image: .grek,
      favorite: false,
      timeOfCooking: "10-15 мин",
      price: 320,
      category: .classic
    ),
    Products(
      name: "Молочный Коктейль",
      subName: "Классический ванильный вкус",
      rating: "4.4",
      image: .milk,
      favorite: false,
      timeOfCooking: "5-7 мин",
      price: 230,
      category: .drinks
    ),
    Products(
      name: "Кола",
      subName: "Классический газированный напиток",
      rating: "4.0",
      image: .cola,
      favorite: false,
      timeOfCooking: "1-2 мин",
      price: 120,
      category: .drinks
    )
  ]
}
