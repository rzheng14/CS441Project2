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
  t1.center = CGPointMake(255.5, 438.5); //moves to initial starting spot
  t2.center = CGPointMake(158.5, 438.5); //moves to initial starting spot
  [self keepScore];
}


//gesture recognizer to read the swipes
-(void)swipe:(UISwipeGestureRecognizer *) sender {
  
  [self combine];  //works but need to keep swiping for it to update
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
  //moves the tiles and also keeps them on the screen
  if([direction isEqualToString:@"DOWN"]) {
    //move down
    if(t1.center.y <= 677) t1.center = CGPointMake(t1.center.x, t1.center.y + 91);
    if(t2.center.y <= 677) t2.center = CGPointMake(t2.center.x, t2.center.y + 91);
  }
  if([direction isEqualToString:@"RIGHT"]) {
    //move right
    if(t1.center.x <= 318) t1.center = CGPointMake(t1.center.x+97, t1.center.y);
    if(t2.center.x <= 318) t2.center = CGPointMake(t2.center.x+97, t2.center.y);
  }
  if([direction isEqualToString:@"UP"]) {
    //move up
    if(t1.center.y >= 495) t1.center = CGPointMake(t1.center.x, t1.center.y - 91);
    if(t2.center.y >= 495) t2.center = CGPointMake(t2.center.x, t2.center.y - 91);
  }
  if([direction isEqualToString:@"LEFT"]) {
    //move left
    if(t1.center.x >= 124) t1.center = CGPointMake(t1.center.x-97, t1.center.y);
    if(t2.center.x >= 124) t2.center = CGPointMake(t2.center.x-97, t2.center.y);
  }
}

-(void)combine{
  int value = t1.text.intValue * 2;
  if((t1.center.x == t2.center.x) && (t1.center.y == t2.center.y)) {
    [t1 setText:[NSString stringWithFormat:@"%d", value]];
    t2.center = CGPointMake(158.5, 438.5);
    [t2 setText:[NSString stringWithFormat:@"%d", value]];
  }
  [self keepScore];
}


//CGAffineTransform up = CGAffineTransformMakeTranslation(0, -91);
//CGAffineTransform right = CGAffineTransformMakeTranslation(97, 0);
//CGAffineTransform down = CGAffineTransformMakeTranslation(0, 91);
//CGAffineTransform left = CGAffineTransformMakeTranslation(-97, 0);


@end
