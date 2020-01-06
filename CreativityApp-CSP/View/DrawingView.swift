//
//  DrawingView.swift
//  CreativityApp-CSP
//
//  Created by Ben Faerber on 10/21/19.
//  Copyright © 2019 CTEC. All rights reserved.
//

import UIKit

class DrawingView : UIView
{
    // Dont call it bruh
    public override func draw(_ rect: CGRect) -> Void
    {
        createStickFigure().stroke()
    }
    
    private func createStickFigure() -> UIBezierPath
    {
        let figure :UIBezierPath = UIBezierPath()
        
        UIColor.magenta.setStroke()
        figure.lineWidth = 3.0
        
        figure.addArc(withCenter: CGPoint(x: 200, y: 200),
                      radius: CGFloat(20),
                      startAngle: CGFloat(0),
                      endAngle: CGFloat(2) * CGFloat.pi,
                      clockwise: true)
        
        figure.move(to: CGPoint(x: 200, y: 220))
        figure.addLine(to: CGPoint(x:200, y:270))
        figure.move(to: CGPoint(x: 180, y: 240))
        figure.addLine(to: CGPoint(x:220, y:240))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x:180, y:300))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x:220, y:300))
        
        return figure
    }
    
    private func lotsOfFigures() -> Void
    {
        for _ in 0..<5
        {
            let randomX = CGFloat(arc4random() % 300)
            let randomY = CGFloat(arc4random() % 300)
            let randomSize = CGFloat(arc4random() % 100)
            
            createStickFigure(at: CGPoint(x: randomX, y: randomY), ofSize: randomSize)
        }
        
    }
    
    private func makeRandomColor() -> UIColor
    {
        let red :CGFloat = CGFloat( Double(arc4random() % 256) / 255.0)
        let green :CGFloat = CGFloat( Double(arc4random() % 256) / 255.0)
        let blue :CGFloat = CGFloat( Double(arc4random() % 256) / 255.0)
        let color = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(1.0))
        return color;
    }
    
    private func createStickFigure(at center : CGPoint, ofSize: CGFloat) -> Void
    {
        let specialFigure :UIBezierPath = UIBezierPath()
        specialFigure.addArc(withCenter: center,
            radius: CGFloat(ofSize),
            startAngle: CGFloat(0),
            endAngle: CGFloat(2) * CGFloat.pi,
            clockwise: true)
        
        specialFigure.move(to: CGPoint(x: center.x, y: center.y + CGFloat(ofSize)))
        specialFigure.addLine(to: CGPoint(x: center.x, y: center.y + (ofSize * 3.5)))
        specialFigure.move(to: CGPoint(x: center.x - ofSize, y: center.y + (ofSize * 2)))
        
        specialFigure.addLine(to: CGPoint(x: center.x + ofSize, y: center.y + (ofSize * 2)))
        specialFigure.move(to: CGPoint(x: center.x, y: center.y + CGFloat(ofSize * 3.5)))
        specialFigure.addLine(to: CGPoint(x: center.x - ofSize, y: center.y + (ofSize * 5)))
        specialFigure.move(to: CGPoint(x: center.x, y: center.y + (ofSize * 5)))
        specialFigure.addLine(to: CGPoint(x: center.x + ofSize, y: center.y + (ofSize * 5)))
        
        makeRandomColor().setStroke()
        specialFigure.lineWidth = CGFloat(arc4random() % 6 + 1)
        specialFigure.stroke()
    }

    private func drawTurtle() -> Void
    {
        let logo = UIBezierPath()
        UIColor.white.setFill()
        logo.move(to: CGPoint(x: 50, y: 250))
        logo.addLine(to: CGPoint(x: 100, y: 300))
        logo.addLine(to: CGPoint(x: 50, y: 350))
        logo.close()
        logo.fill()
    }
    
    private func drawWithImage() -> Void
    {
        let bobRoss : UIBezierPath = UIBezierPath()
        
        UIColor(patternImage: UIImage(named: "bobpool")!).setFill()
        UIColor.green.setStroke()
        bobRoss.lineWidth = 1.4
        
        bobRoss.move(to: CGPoint(x: 150, y: 40))
        bobRoss.addLine(to: CGPoint(x: 75, y: 200))
        bobRoss.addLine(to: CGPoint(x: 50, y: 200))
        bobRoss.addLine(to: CGPoint(x: 0, y: 200))
        bobRoss.close()
        bobRoss.stroke()
        bobRoss.fill()
    }
    
    private func drawF()
    {
        let f = UIBezierPath()
        UIColor.white.setFill()
        let scalar = 7
        // bottom left corner of f
        let x = 100
        let y = 100
        
        f.move(to: CGPoint(x: x, y: y))
        f.addLine(to: CGPoint(x: x, y: y+(20 * scalar))) // 1
        f.addLine(to: CGPoint(x: x+(10 * scalar), y: y+(20 * scalar))) // 2
        f.addLine(to: CGPoint(x: x+(10 * scalar), y: y+(16 * scalar))) // 3
        f.addLine(to: CGPoint(x: x+(4 * scalar), y: y+(16 * scalar))) // 4
        f.addLine(to: CGPoint(x: x+(8 * scalar), y: y+(12 * scalar))) // 5
        f.addLine(to: CGPoint(x: x+(8 * scalar), y: y+(8 * scalar))) // 6
        f.addLine(to: CGPoint(x: x+(4 * scalar), y: y+(8 * scalar))) // 7
        f.addLine(to: CGPoint(x: x+(4 * scalar), y: y)) // 8
        f.addLine(to: CGPoint(x: x, y: y)) // 9
        f.close()
        f.fill()
    }
}
