//
//  ViewController.m
//  2048
//
//  Created by Richard Zheng on 2/4/19.
//  Copyright © 2019 Richard Zheng. All rights reserved.
//

#import "ViewController.h"
#import <time.h>
#import <stdlib.h>

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
 
  [self initSpawn];
  [self spawn];
  
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
  if(counter >= 1048576) {
     [score setText:[NSString stringWithFormat: @"Pls Stop"]];
  }
  if(counter == 4096) {
    [self win];
  }
}

- (IBAction)changeVal:(id)sender {
  //new Game button. I'm not sure why it wont let me change the name of this function.
  [t1 setText:[NSString stringWithFormat: @"%d", 2]];
  [t2 setText:[NSString stringWithFormat: @"%d", 2]];
  [self initSpawn];
  [self spawn];
  [self keepScore];
}


-(void)win {
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"WIN"
                                                                           message:@"YOU WIN!"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
  //We add buttons to the alert controller by creating UIAlertActions:
  UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil]; //button does noting
  [alertController addAction:actionOk];
  [self presentViewController:alertController animated:YES completion:nil];
  
}


//gesture recognizer to read the swipes
-(void)swipe:(UISwipeGestureRecognizer *) sender {
  
  //[self combine];  //works but need to keep swiping for it to update
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
  [self combine]; //much better :)
}

//moves tiles
-(void)moveTiles:(NSString *) direction {
  //moves the tiles and also keeps them on the screen
  if([direction isEqualToString:@"DOWN"]) {
    //move down
    while(t1.center.y <= 677) t1.center = CGPointMake(t1.center.x, t1.center.y + 91);
    while(t2.center.y <= 677) t2.center = CGPointMake(t2.center.x, t2.center.y + 91);
  }
  if([direction isEqualToString:@"RIGHT"]) {
    //move right
    while(t1.center.x <= 318) t1.center = CGPointMake(t1.center.x+97, t1.center.y);
    while(t2.center.x <= 318) t2.center = CGPointMake(t2.center.x+97, t2.center.y);
  }
  if([direction isEqualToString:@"UP"]) {
    //move up
    while(t1.center.y >= 495) t1.center = CGPointMake(t1.center.x, t1.center.y - 91);
    while(t2.center.y >= 495) t2.center = CGPointMake(t2.center.x, t2.center.y - 91);
  }
  if([direction isEqualToString:@"LEFT"]) {
    //move left
    while(t1.center.x >= 124) t1.center = CGPointMake(t1.center.x-97, t1.center.y);
    while(t2.center.x >= 124) t2.center = CGPointMake(t2.center.x-97, t2.center.y);
  }
}

-(void)combine{
  int value = t1.text.intValue * 2;
  if((t1.center.x == t2.center.x) && (t1.center.y == t2.center.y)) {
    [t1 setText:[NSString stringWithFormat:@"%d", value]];
    //t2.center = CGPointMake(158.5, 438.5); //spawns in this spot. change
    [self spawn];
    [t2 setText:[NSString stringWithFormat:@"%d", value]];
  }
  [self keepScore];
}

-(void)spawn {
  int squareNum = arc4random_uniform(16);
  
  if(squareNum == 0) {
    t2.center = CGPointMake(61.5, 438.5);
  } else if (squareNum == 1) {
    t2.center = CGPointMake(158.5, 438.5);
  } else if (squareNum == 2) {
    t2.center = CGPointMake(255.5, 438.5);
  } else if (squareNum == 3) {
    t2.center = CGPointMake(352.5, 438.5);
  } else if (squareNum == 4) {
    t2.center = CGPointMake(61.5, 529.5);
  } else if (squareNum == 5) {
    t2.center = CGPointMake(158.5, 529.5);
  } else if (squareNum == 6) {
    t2.center = CGPointMake(255.5, 529.5);
  } else if (squareNum == 7) {
    t2.center = CGPointMake(352.5, 529.5);
  } else if (squareNum == 8) {
    t2.center = CGPointMake(61.5, 620.5);
  } else if (squareNum == 9) {
    t2.center = CGPointMake(158.5, 620.5);
  } else if (squareNum == 10) {
    t2.center = CGPointMake(255.5, 620.5);
  } else if (squareNum == 11) {
    t2.center = CGPointMake(352.5, 620.5);
  } else if (squareNum == 12) {
    t2.center = CGPointMake(61.5, 711.5);
  } else if (squareNum == 13) {
    t2.center = CGPointMake(158.5, 711.5);
  } else if (squareNum == 14) {
    t2.center = CGPointMake(255.5, 711.5);
  } else {
    t2.center = CGPointMake(352.5, 711.5);
  }
  //small FEATURE that this may spawn on top of the other tile.
  //need to check where the other tile is.
}

-(void)initSpawn {
  int squareNum = arc4random_uniform(16);
  
  if(squareNum == 0) {
    t1.center = CGPointMake(61.5, 438.5);
  } else if (squareNum == 1) {
    t1.center = CGPointMake(158.5, 438.5);
  } else if (squareNum == 2) {
    t1.center = CGPointMake(255.5, 438.5);
  } else if (squareNum == 3) {
    t1.center = CGPointMake(352.5, 438.5);
  } else if (squareNum == 4) {
    t1.center = CGPointMake(61.5, 529.5);
  } else if (squareNum == 5) {
    t1.center = CGPointMake(158.5, 529.5);
  } else if (squareNum == 6) {
    t1.center = CGPointMake(255.5, 529.5);
  } else if (squareNum == 7) {
    t1.center = CGPointMake(352.5, 529.5);
  } else if (squareNum == 8) {
    t1.center = CGPointMake(61.5, 620.5);
  } else if (squareNum == 9) {
    t1.center = CGPointMake(158.5, 620.5);
  } else if (squareNum == 10) {
    t1.center = CGPointMake(255.5, 620.5);
  } else if (squareNum == 11) {
    t1.center = CGPointMake(352.5, 620.5);
  } else if (squareNum == 12) {
    t1.center = CGPointMake(61.5, 711.5);
  } else if (squareNum == 13) {
    t1.center = CGPointMake(158.5, 711.5);
  } else if (squareNum == 14) {
    t1.center = CGPointMake(255.5, 711.5);
  } else {
    t1.center = CGPointMake(352.5, 711.5);
  }
}


//CGAffineTransform up = CGAffineTransformMakeTranslation(0, -91);
//CGAffineTransform right = CGAffineTransformMakeTranslation(97, 0);
//CGAffineTransform down = CGAffineTransformMakeTranslation(0, 91);
//CGAffineTransform left = CGAffineTransformMakeTranslation(-97, 0);


@end
