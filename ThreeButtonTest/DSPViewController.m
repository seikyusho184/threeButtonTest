//
//  DSPViewController.m
//  ThreeButtonTest
//
//  Created by ようへい on 13/03/02.
//  Copyright (c) 2013年 yyyyy. All rights reserved.
//

#import "DSPViewController.h"

@interface DSPViewController ()

//3扉セクション
@property (retain, nonatomic) IBOutlet UIView *threeDoorView;
@property (retain, nonatomic) IBOutlet UIButton *threeDoorLeftButton;
@property (retain, nonatomic) IBOutlet UIButton *threeDoorCenterButton;
@property (retain, nonatomic) IBOutlet UIButton *threeDoorRightButton;

//2扉セクション
@property (retain, nonatomic) IBOutlet UIView *twoDoorView;
@property (retain, nonatomic) IBOutlet UIButton *twoDoorLeftButton;
@property (retain, nonatomic) IBOutlet UIButton *twoDoorRightButton;

//扉の数
@property (nonatomic, assign) NSInteger doorNumber;

//0:未開催（webへ遷移） 1:topに入れる
@property(nonatomic, assign) BOOL canEnterLeft;
@property(nonatomic, assign) BOOL canEnterCenter;
@property(nonatomic, assign) BOOL canEnterRight;

// 0:扉をタップできない 1:扉をタップできる
@property(nonatomic, assign) BOOL canPushLeft;
@property(nonatomic, assign) BOOL canPushCenter;
@property(nonatomic, assign) BOOL canPushRight;


- (IBAction)doorButtonAction:(id)sender;


@end

@implementation DSPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.doorNumber = 2;
    
    self.canEnterLeft = 1;
    self.canEnterCenter = 0;
    self.canEnterRight = 1;

    self.canPushLeft = 1;
    self.canPushCenter = 1;
    self.canPushRight = 0;
    
    [self setDoorViewSection];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setDoorViewSection
{
    
    if (self.doorNumber == 2)
    {
        self.threeDoorView.hidden = YES;
        self.twoDoorView.hidden = NO;
        
        self.twoDoorLeftButton.enabled = self.canPushLeft;
        self.twoDoorRightButton.enabled = self.canPushRight;
    }
    else
    {
        self.threeDoorView.hidden = NO;
        self.twoDoorView.hidden = YES;
        
        self.threeDoorLeftButton.enabled = self.canPushLeft;
        self.threeDoorCenterButton.enabled = self.canPushCenter;
        self.threeDoorRightButton.enabled = self.canPushRight;
    }
}

//扉押下時の動作
- (IBAction)doorButtonAction:(id)sender
{
    
    UIButton * btn = sender;
    
    NSLog(@"btn.tag : %d", btn.tag);
    
    
    //押下したボタン
    switch (btn.tag)
    {
           
        case 0: //左の扉
            
            switch (self.canEnterLeft)
        {
            case 0://webに遷移
                NSLog(@"左の扉webに遷移");

                break;
            case 1://topに遷移
                NSLog(@"左の扉topに遷移");

                break;
            default:
                break;
        }
            break;
            
       
        case 1: //中央の扉
            
            switch (self.canEnterCenter)
        {
            case 0://webに遷移
                NSLog(@"中央の扉webに遷移");

                break;
            case 1://topに遷移
                NSLog(@"中央の扉topに遷移");

                break;
            default:
                break;
        }
            break;
            
        case 2: //右の扉
            
            switch (self.canEnterRight)
        {
            case 0://webに遷移
                NSLog(@"右の扉webに遷移");

                break;
            case 1://topに遷移
                NSLog(@"右の扉topに遷移");

                break;
            default:
                break;
        }
            break;
            
        default:
            break;
    }
}
- (void)dealloc {
    [_threeDoorView release];
    [_twoDoorView release];
    [_threeDoorLeftButton release];
    [_threeDoorCenterButton release];
    [_threeDoorRightButton release];
    [_twoDoorLeftButton release];
    [_twoDoorRightButton release];
    [super dealloc];
}
@end
