//
//  ViewController.swift
//  Legal Characters
//
//  Created by Tatiana Pasechnik on 12/04/23.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate
{

    @IBOutlet weak var myCounter: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        var alphaNum = CharacterSet.alphanumerics
        alphaNum.insert(" ")
        let charSet = alphaNum.inverted
        let filteredText = text.components(separatedBy:charSet).joined(separator: "")
        
        if(text == "" && range.length > 0) //check backspace
        {
            return true
        }
        if (filteredText == text && myTextView.text.count < 140)
        {
            return true
        }
        else
        {
            return false
        }
    }
    func textViewDidChange(_ textView: UITextView)
    {
        let currentCount : Int = textView.text.count
        myCounter.text = String (currentCount)
        
        let red = CGFloat (currentCount)/140.0
        let green = 1 - red
        
        let newBg = UIColor (displayP3Red: red,
                             green: green,
                             blue: 0.0,
                             alpha: 1.0)
        
        myCounter.backgroundColor = newBg
    }


}

