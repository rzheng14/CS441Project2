//
//  ViewController.h
//  2048
//
//  Created by Richard Zheng on 2/4/19.
//  Copyright © 2019 Richard Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel *score;
@property (nonatomic, strong) IBOutlet UIButton *button;
@property (nonatomic, strong) IBOutlet UILabel *t1;
@property (nonatomic, strong) IBOutlet UILabel *t2;
@property (strong, nonatomic) IBOutlet UIView *frame;

@end

@interface tile: NSObject

@property int *value;

@end

