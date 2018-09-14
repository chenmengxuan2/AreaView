//
//  AreaView.swift
//  AreaAlarm
//
//  Created by Mengxuan Chen on 2018/9/14.
//  Copyright © 2018年 Mengxuan Chen. All rights reserved.
//

import UIKit

class AreaView: UIView {
    
    let landscapeLineNumber = 10  //横向宽度
    let verticalLineNumber = 8    //纵向宽度
    let interval:CGFloat = 20
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        //绘制棋盘，获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        //绘制横向线条
        for i in 0...landscapeLineNumber {
            context?.move(to: CGPoint(x: 0, y: CGFloat(i)*interval))
            context?.addLine(to: CGPoint(x: interval*8, y:CGFloat(i)*interval ))
            context?.setStrokeColor(UIColor.black.cgColor)
            context?.strokePath()
        }
        
        //绘制纵向线条
        for j in 0...verticalLineNumber {
            context?.move(to: CGPoint(x: CGFloat(j)*interval, y: 0))
            context?.addLine(to: CGPoint(x: CGFloat(j)*interval, y: interval*10))
            context?.setStrokeColor(UIColor.black.cgColor)
            context?.strokePath()
        }
        
        //增加点击事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(fingerTapAction))
        self.addGestureRecognizer(tap)
    }

}

extension AreaView {
    
    ///点击某一块区域生成四个坐标
    fileprivate func createCoordinate(tapPoint:CGPoint) -> CGRect{
        let landscapeX = Int(tapPoint.x/interval) * Int(interval)  //横坐标
        let verticalY =  Int(tapPoint.y/interval) * Int(interval)   //纵坐标
        return CGRect(x: landscapeX, y: verticalY, width:  Int(interval) , height:  Int(interval) )
    }
    
    ///从点击获取的区域中覆盖UIView
    fileprivate func drawOverlay(rect:CGRect, color:UIColor) {
        let overlay = UIView(frame: rect)
        overlay.backgroundColor = color
        overlay.tag = getTag(point: rect.origin)
        self.addSubview(overlay)
    }
    
    @objc func fingerTapAction(tap:UITapGestureRecognizer) {
        //判断当前区域是否有图形，如果有的话就删掉
        let point = tap.location(in: self)
        guard let overlay = self.viewWithTag(getTag(point: point)) else {
            let rect = createCoordinate(tapPoint: point)
            drawOverlay(rect: rect, color: UIColor.red)
            return
        }
        overlay.removeFromSuperview()
    }

    ///取得tag，删除覆盖的图形
    fileprivate func getTag(point:CGPoint) ->Int{
        return Int(point.x/interval) * 10 +  Int(point.y/interval)
    }
}
