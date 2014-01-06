//
//  ViewController.m
//  140p
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
-(void)stopTimer;
-(void)startTimer;
@end

@implementation ViewController{
    NSTimer *timer;
    BOOL timerWorking;
}

// 각 1초마다 1분씩감소
-(void)tickDown:(NSTimer *)timer{
    self.datePicker.countDownDuration = self.datePicker.countDownDuration - 60;
    // 1분이내면 정지
    if(self.datePicker.countDownDuration <= 60){
        NSLog(@"Done!");
        [self stopTimer];
    }
}

// 타이머 시작
-(void)startTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:Nil repeats:YES];
}

// 타이머 정지
-(void)stopTimer{
    [timer invalidate];
    timer = nil;
    timerWorking = NO;
}

-(IBAction)toggleTimer:(UIButton *)sender{
    //버튼토클설정
    NSString *title = timerWorking ? @"Start" : @"Stop";
    [sender setTitle:title forState:UIControlStateNormal];
    timerWorking = !timerWorking;
    if (timerWorking) {
        [self startTimer];
    }
    else{
        [self stopTimer];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
