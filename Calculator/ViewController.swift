//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTyping = false
    var displayValue: Float {
        get {
            let displayText = label.text ?? ""
            return (displayText as NSString).floatValue
        }
        set {
            label.text = "\(newValue)"
            isTyping = false
        }
    }

    var label = UILabel()
    var buttonZero = UIButton()
    var buttonOne = UIButton()
    var buttonTwo = UIButton()
    var buttonThree = UIButton()
    var buttonFour = UIButton()
    var buttonFive = UIButton()
    var buttonSix = UIButton()
    var buttonSeven = UIButton()
    var buttonEight = UIButton()
    var buttonNine = UIButton()
    var buttonAdd = UIButton()
    var buttonSubtract = UIButton()
    var buttonMultiply = UIButton()
    var buttonDivide = UIButton()
    var buttonEnter = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createTopRow()
        createSecondRow()
        createThirdRow()
        createBottomRow()

        buttonZero.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonOne.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonTwo.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonThree.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonFour.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonFive.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonSix.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonSeven.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonEight.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
        buttonNine.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)

    }

    func createLabel() {
        label.backgroundColor = .blackColor()
        label.text = ""
        self.view.addSubview(label)
        addLabelConstraints()
    }

    func createTopRow() {
        buttonSeven.setTitle("7", forState: .Normal)
        buttonEight.setTitle("8", forState: .Normal)
        buttonNine.setTitle("9", forState: .Normal)
        buttonDivide.setTitle("÷", forState: .Normal)

        buttonSeven.backgroundColor = .grayColor()
        buttonEight.backgroundColor = .grayColor()
        buttonNine.backgroundColor = .grayColor()
        buttonDivide.backgroundColor = .orangeColor()
        buttonDivide.setTitleColor(.whiteColor(), forState: .Normal)

        self.view.addSubview(buttonSeven)
        self.view.addSubview(buttonEight)
        self.view.addSubview(buttonNine)
        self.view.addSubview(buttonDivide)
        addTopRowConstraints()
    }

    func createSecondRow() {
        buttonFour.setTitle("4", forState: .Normal)
        buttonFive.setTitle("5", forState: .Normal)
        buttonSix.setTitle("6", forState: .Normal)
        buttonMultiply.setTitle("×", forState: .Normal)

        buttonFour.backgroundColor = .grayColor()
        buttonFive.backgroundColor = .grayColor()
        buttonSix.backgroundColor = .grayColor()
        buttonMultiply.backgroundColor = .orangeColor()
        buttonMultiply.setTitleColor(.whiteColor(), forState: .Normal)

        self.view.addSubview(buttonFour)
        self.view.addSubview(buttonFive)
        self.view.addSubview(buttonSix)
        self.view.addSubview(buttonMultiply)
        addSecondRowConstraints()
    }

    func createThirdRow() {
        buttonOne.setTitle("1", forState: .Normal)
        buttonTwo.setTitle("2", forState: .Normal)
        buttonThree.setTitle("3", forState: .Normal)
        buttonSubtract.setTitle("-", forState: .Normal)

        buttonOne.backgroundColor = .grayColor()
        buttonTwo.backgroundColor = .grayColor()
        buttonThree.backgroundColor = .grayColor()
        buttonSubtract.backgroundColor = .orangeColor()
        buttonSubtract.setTitleColor(.whiteColor(), forState: .Normal)

        self.view.addSubview(buttonOne)
        self.view.addSubview(buttonTwo)
        self.view.addSubview(buttonThree)
        self.view.addSubview(buttonSubtract)
        addThirdRowConstraints()
    }

    func createBottomRow() {
        buttonZero.setTitle("0", forState: .Normal)
        buttonEnter.setTitle("⏎", forState: .Normal)
        buttonAdd.setTitle("+", forState: .Normal)

        buttonZero.backgroundColor = .grayColor()
        buttonEnter.backgroundColor = .greenColor()
        buttonAdd.backgroundColor = .orangeColor()
        buttonAdd.setTitleColor(.whiteColor(), forState: .Normal)

        self.view.addSubview(buttonZero)
        self.view.addSubview(buttonEnter)
        self.view.addSubview(buttonAdd)
        addBottomRowConstraints()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addLabelConstraints() {

        label.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: [], metrics: [:], views: ["label": label]))

        //        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(margin)-[label]|", options: [], metrics: ["margin":20.0], views: ["label": label]))

        view.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/3), constant: 0))


    }

    func addTopRowConstraints() {

        buttonSeven.translatesAutoresizingMaskIntoConstraints = false
        buttonEight.translatesAutoresizingMaskIntoConstraints = false
        buttonNine.translatesAutoresizingMaskIntoConstraints = false
        buttonDivide.translatesAutoresizingMaskIntoConstraints = false

        self.view.leadingAnchor.constraintEqualToAnchor(buttonSeven.leadingAnchor).active = true
        buttonSeven.trailingAnchor.constraintEqualToAnchor(buttonEight.leadingAnchor).active = true
        buttonEight.trailingAnchor.constraintEqualToAnchor(buttonNine.leadingAnchor).active = true
        buttonNine.trailingAnchor.constraintEqualToAnchor(buttonDivide.leadingAnchor).active = true
        buttonDivide.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true

        label.bottomAnchor.constraintEqualToAnchor(buttonSeven.topAnchor).active = true
        label.bottomAnchor.constraintEqualToAnchor(buttonEight.topAnchor).active = true
        label.bottomAnchor.constraintEqualToAnchor(buttonNine.topAnchor).active = true
        label.bottomAnchor.constraintEqualToAnchor(buttonDivide.topAnchor).active = true

        view.addConstraint(NSLayoutConstraint(item: buttonSeven, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonEight, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonNine, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonSeven, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonEight, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonNine, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))


    }

    func addSecondRowConstraints() {

        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        buttonFive.translatesAutoresizingMaskIntoConstraints = false
        buttonSix.translatesAutoresizingMaskIntoConstraints = false
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false

        self.view.leadingAnchor.constraintEqualToAnchor(buttonFour.leadingAnchor).active = true
        buttonFour.trailingAnchor.constraintEqualToAnchor(buttonFive.leadingAnchor).active = true
        buttonFive.trailingAnchor.constraintEqualToAnchor(buttonSix.leadingAnchor).active = true
        buttonSix.trailingAnchor.constraintEqualToAnchor(buttonMultiply.leadingAnchor).active = true
        buttonMultiply.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true

        buttonSeven.bottomAnchor.constraintEqualToAnchor(buttonFour.topAnchor).active = true
        buttonEight.bottomAnchor.constraintEqualToAnchor(buttonFive.topAnchor).active = true
        buttonNine.bottomAnchor.constraintEqualToAnchor(buttonSix.topAnchor).active = true
        buttonDivide.bottomAnchor.constraintEqualToAnchor(buttonMultiply.topAnchor).active = true

        view.addConstraint(NSLayoutConstraint(item: buttonFour, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonFive, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonSix, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonFour, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonFive, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonSix, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

    }

    func addThirdRowConstraints() {

        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false

        self.view.leadingAnchor.constraintEqualToAnchor(buttonOne.leadingAnchor).active = true
        buttonOne.trailingAnchor.constraintEqualToAnchor(buttonTwo.leadingAnchor).active = true
        buttonTwo.trailingAnchor.constraintEqualToAnchor(buttonThree.leadingAnchor).active = true
        buttonThree.trailingAnchor.constraintEqualToAnchor(buttonSubtract.leadingAnchor).active = true
        buttonSubtract.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true

        buttonFour.bottomAnchor.constraintEqualToAnchor(buttonOne.topAnchor).active = true
        buttonFive.bottomAnchor.constraintEqualToAnchor(buttonTwo.topAnchor).active = true
        buttonSix.bottomAnchor.constraintEqualToAnchor(buttonThree.topAnchor).active = true
        buttonMultiply.bottomAnchor.constraintEqualToAnchor(buttonSubtract.topAnchor).active = true

        view.addConstraint(NSLayoutConstraint(item: buttonOne, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonTwo, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonThree, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonSubtract, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonOne, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonTwo, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonThree, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonSubtract, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))



    }

    func addBottomRowConstraints() {

        buttonZero.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false

        self.view.leadingAnchor.constraintEqualToAnchor(buttonZero.leadingAnchor).active = true
        buttonZero.trailingAnchor.constraintEqualToAnchor(buttonEnter.leadingAnchor).active = true
        buttonEnter.trailingAnchor.constraintEqualToAnchor(buttonAdd.leadingAnchor).active = true
        buttonAdd.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true

        buttonOne.bottomAnchor.constraintEqualToAnchor(buttonZero.topAnchor).active = true
        buttonThree.bottomAnchor.constraintEqualToAnchor(buttonEnter.topAnchor).active = true
        buttonSubtract.bottomAnchor.constraintEqualToAnchor(buttonAdd.topAnchor).active = true

        self.view.bottomAnchor.constraintEqualToAnchor(buttonZero.bottomAnchor).active = true
        self.view.bottomAnchor.constraintEqualToAnchor(buttonEnter.bottomAnchor).active = true
        self.view.bottomAnchor.constraintEqualToAnchor(buttonAdd.bottomAnchor).active = true

        view.addConstraint(NSLayoutConstraint(item: buttonZero, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonEnter, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonAdd, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: (1/6), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonZero, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/2), constant: 0))

        view.addConstraint(NSLayoutConstraint(item: buttonEnter, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: buttonAdd, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: (1/4), constant: 0))
    }
    
    func buttonTapped(button: UIButton) {
        guard let digit = button.currentTitle else { return }
        let displayText = label.text ?? ""
        if isTyping {
            label.text = displayText + digit
        } else {
            label.text = digit
            isTyping = true
        }
        
        
    }
}