//
//  ViewController.m
//  2048
//
//  Created by Richard Zheng on 2/4/19.
//  Copyright © 2019 Richard Zheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


//not sure if this is necessary yet
@implementation tile
@synthesize value;
@end


@implementation ViewController
@synthesize button, label, score, t1, t2;

int counter;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  UISwipeGestureRecognizer *down = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
  down.direction = UISwipeGestureRecognizerDirectionDown;
  [self.view addGestureRecognizer:down];
  
  UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
  right.direction = UISwipeGestureRecognizerDirectionRight;
  [self.view addGestureRecognizer:right];
  
  UISwipeGestureRecognizer *up = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
  up.direction = UISwipeGestureRecognizerDirectionUp;
  [self.view addGestureRecognizer:up];
  
  UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
  left.direction = UISwipeGestureRecognizerDirectionLeft;
  [self.view addGestureRecognizer:left];
  
}

-(void)keepScore {
  counter = t1.text.intValue + t2.text.intValue;
  [score setText:[NSString stringWithFormat: @"%d", counter]];
}

- (IBAction)changeVal:(id)sender {
  //new Game button. I'm not sure why it wont let me change the name of this function.
  [t1 setText:[NSString stringWithFormat: @"%d", 2]];
  [t2 setText:[NSString stringWithFormat: @"%d", 2]];
  [self keepScore];
}


//gesture recognizer to move tiles
-(void)swipe:(UISwipeGestureRecognizer *) sender {
  if(sender.direction == UISwipeGestureRecognizerDirectionDown) {
    [self moveTiles:@"DOWN"];
  }
  if(sender.direction == UISwipeGestureRecognizerDirectionRight) {
    [self moveTiles:@"RIGHT"];
  }
  if(sender.direction == UISwipeGestureRecognizerDirectionUp) {
    [self moveTiles:@"UP"];
  }
  if(sender.direction == UISwipeGestureRecognizerDirectionLeft) {
    [self moveTiles:@"LEFT"];
  }
}

//moves tiles
-(void)moveTiles:(NSString *) direction {
  if([direction isEqualToString:@"DOWN"]) {
    //move
  }
  if([direction isEqualToString:@"RIGHT"]) {
    //move
  }
  if([direction isEqualToString:@"DOWN"]) {
    //move
  }
  if([direction isEqualToString:@"LEFT"]) {
    //move 
  }
}

//CGAffineTransform up = CGAffineTransformMakeTranslation(0, -91);
//CGAffineTransform right = CGAffineTransformMakeTranslation(97, 0);
//CGAffineTransform down = CGAffineTransformMakeTranslation(0, 91);
//CGAffineTransform left = CGAffineTransformMakeTranslation(-97, 0);


@end
