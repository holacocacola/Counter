//
//  ViewController.swift
//  Counter
//
//  Created by d m on 18.10.2025.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var textHistory: UITextView!
    
    private var counter: Int = 0 {
        didSet { updateLabel() }
    }

    private func updateLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    
    private func addHistory(_ text: String) {
        
        //Подключаем дату для истории с маской yyyy-MM-dd HH:mm:ss и преобразуем в текст
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        
        //добавляем текст в историю новой строкой
        textHistory.text += "\n[\(dateString)]: \(text)"
        
        //Что бы не пришлось скролить историю руками
        let range = NSMakeRange(textHistory.text.count, 0)
        textHistory.scrollRangeToVisible(range)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Устанавливаем начальное значение равное нулю в соответствие с условиями
        updateLabel()
        
    }


    @IBAction func minusButton(_ sender: Any) {
        //Значение счётчика не должно падать ниже нуля
        if counter > 0 {
            counter-=1
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        counter+=1
        addHistory("значение изменено на +1")
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        addHistory("значение сброшено")
    }
}

