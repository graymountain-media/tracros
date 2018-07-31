//
//  MainViewController.swift
//  Tracros
//
//  Created by Jake Gray on 7/11/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var proteinView: UIView!
    @IBOutlet weak var carbsView: UIView!
    @IBOutlet weak var fatView: UIView!
    @IBOutlet weak var progressView: UIView!
    
    
    let proteinCircle = CAShapeLayer()
    let carbCircle = CAShapeLayer()
    let fatCircle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.layer.cornerRadius = 5
        
        setupCircles()
        animateCircles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupCircles() {
        let circles = [proteinCircle,fatCircle,carbCircle]
        let circleCenter = CGPoint(x: view.frame.width * 0.98 * 0.28 / 2, y: view.frame.width * 0.98 * 0.28 / 2)
        let radius = proteinView.frame.width / 2.8
        let circularPath = UIBezierPath(arcCenter: circleCenter, radius: radius , startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi * 2, clockwise: true)
        
        for circle in circles{
            let backgroundCircle = CAShapeLayer()
            backgroundCircle.path = circularPath.cgPath
            backgroundCircle.opacity = 0.4
            
            circle.path = circularPath.cgPath
            
            switch circle {
            case proteinCircle:
                proteinView.layer.addSublayer(backgroundCircle)
                proteinView.layer.addSublayer(circle)
                circle.strokeColor = UIColor(named: "proteinColor")?.cgColor
                backgroundCircle.strokeColor = UIColor.brown.cgColor
            case carbCircle:
                carbsView.layer.addSublayer(backgroundCircle)
                carbsView.layer.addSublayer(circle)
                circle.strokeColor = UIColor(named: "carbColor")?.cgColor
                backgroundCircle.strokeColor = UIColor.orange.cgColor
            case fatCircle:
                fatView.layer.addSublayer(backgroundCircle)
                fatView.layer.addSublayer(circle)
                circle.strokeColor = UIColor(named: "fatColor")?.cgColor
                backgroundCircle.strokeColor = UIColor.green.cgColor
            default:
                view.layer.addSublayer(circle)
            }
            
            
            circle.fillColor = UIColor.clear.cgColor
            circle.strokeEnd = 0
            circle.lineCap = kCALineCapRound
            circle.lineWidth = 10
            backgroundCircle.fillColor = UIColor.clear.cgColor
            backgroundCircle.lineCap = kCALineCapRound
            backgroundCircle.lineWidth = 10
            
            
        }
        
    }
    
    private func animateCircles() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        proteinCircle.add(basicAnimation, forKey: "basic")
        carbCircle.add(basicAnimation, forKey: "basic")
        fatCircle.add(basicAnimation, forKey: "basic")
    }

}
