//
//  MemoDetailViewController.swift
//  MyColorMemoApp
//
//  Created by JIHA on 2021/10/08.
//

import Foundation
import UIKit
import RealmSwift

class MemoDetailViewController: UIViewController {
    
    var memoData = MemoDataModel()
    
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayData()
        setDoneButton()
        textView.delegate = self
    }
    
    func configure(memo: MemoDataModel) {
        memoData.text = memo.text
        memoData.recordDate = memo.recordDate
//        print("data is \(memoData.text) and \(memoData.recordDate)")
    }
    
    func displayData() {
        textView.text = memoData.text
        navigationItem.title = dateFormat.string(from: memoData.recordDate)
    }
    
    @objc func tapDoneButton() {
        view.endEditing(true)
    }
    
    func setDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDoneButton))
        toolBar.items = [commitButton]
        textView.inputAccessoryView = toolBar
    }
    
    func saveData(with text: String) {
        let realm = try! Realm()
        try! realm.write{
            memoData.text = text
            memoData.recordDate = Date()
            realm.add(memoData)
        }
//        print("text : \(memoData.text)   recordDate: \(memoData.recordDate)")
    }
}

extension MemoDetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let updateText = textView.text ?? ""
        saveData(with: updateText)
    }
}
