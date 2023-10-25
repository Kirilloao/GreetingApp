//
//  GreetingPresenter.swift
//  GreetingApp
//
//  Created by Kirill Taraturin on 21.10.2023.
//

protocol GreetingPresenterProtocol {
    init(view: GreetingViewProtocol, person: Person)
    func showGreeting()
}

class GreetingPresenter: GreetingPresenterProtocol {
    /*
     безхозная ссылка на view, потому что у самой view есть ссылку на презентер,
     чтобы не было цикла сильных ссылок, мы эту ссылку создали как безхозную
     */
    private unowned let view: GreetingViewProtocol
    
    /*
     Экхемпляр модели мы передали в этот клаcc при инициализации
     */
    private let person: Person
    
    required init(view: GreetingViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    //3 этап
    /*
     Cоздаем свойство для привествия которое берет данные из экземпляра модели
     */
    func showGreeting() {
        let greeting = "Hello, \(person.name) \(person.surname)!"
        /*
         Сформированное приветствие нужно обрать вернуть во view.
         для этого у Презентера есть ссылка на это view.
         Обращаемся к view, у view есть метод setGreeting, потому что view имеет тип проктола
         GreetingViewProtocol, и у этого протокола есть один метод setGreeting.
         Вызывая этот метод мы передаем в него сформированное приветствие.
         */
        view.setGreeting(greeting)
    }
}
