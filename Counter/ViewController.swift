
//
//  ViewController.swift
//  Counter
//
//  Created by d m on 18.10.2025.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var textHistory: UITextView!
    
    // MARK: - Properties
    
    private var counter: Int = 0 {
        didSet { updateLabel() }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }

    // MARK: - Private Methods
    
    private func updateLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func addHistory(_ text: String) {
        // Преобразуем текущую дату в текст с помощью заранее созданного форматтера.
        let dateString = dateFormatter.string(from: Date())
        
        // Добавляем запись в историю.
        textHistory.text += "\n[\(dateString)]: \(text)"
        
        // Автоматически прокручиваем текст к последней строке.
        let range = NSMakeRange(textHistory.text.count, 0)
        textHistory.scrollRangeToVisible(range)
    }

    // MARK: - Actions
    
    @IBAction private func minusButton(_ sender: Any) {
        // Значение счётчика не должно падать ниже нуля.
        if counter > 0 {
            counter -= 1
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        addHistory("значение изменено на +1")
    }
    
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        addHistory("значение сброшено")
    }
}
