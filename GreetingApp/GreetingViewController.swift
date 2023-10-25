//
//  ViewController.swift
//  GreetingApp
//
//  Created by Kirill Taraturin on 20.10.2023.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func setGreeting(_ greeting: String)
}

// 1 этап
/*
 Когда мы запускаем симулятор запускается данный экран
 */
class GreetingViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var greetingLabel: UILabel!
    
    private var presenter: GreetingPresenterProtocol!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Tim", surname: "Cook")
        presenter = GreetingPresenter(view: self, person: person)
    }
    
    // 2 этап
    /*
     По тапу на экране обращаемся к presenter и вызываем метод showGreeting
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presenter.showGreeting()
    }
}

// MARK: - GreetingViewProtocol
extension GreetingViewController: GreetingViewProtocol {
    func setGreeting(_ greeting: String) {
        greetingLabel.text = greeting
    }
}
