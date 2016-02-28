//
//  SurvivalScoreViewController.m
//  foal score
//
//  Created by Jun on 1/25/16.
//  Copyright © 2016 osu.edu. All rights reserved.
//

#import "SurvivalScoreViewController.h"

@interface SurvivalScoreViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *coldEx_seg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prematurity_seg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *infection_seg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *igG_seg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *glucose_seg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *wbc_seg;
@property (weak, nonatomic) IBOutlet UILabel *coldEx_lb;
@property (weak, nonatomic) IBOutlet UILabel *prematurity_lb;
@property (weak, nonatomic) IBOutlet UILabel *infection_lb;
@property (weak, nonatomic) IBOutlet UILabel *igG_lb;
@property (weak, nonatomic) IBOutlet UILabel *glucose_lb;
@property (weak, nonatomic) IBOutlet UILabel *wbc_lb;
@property (strong, nonatomic) IBOutlet UIView *scrollContent;

@end

@implementation SurvivalScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.delegate = self;

    CGRect newFrame = self.scrollContent.frame;
    newFrame.size.width = [UIScreen mainScreen].bounds.size.width;
    [self.scrollContent setFrame:newFrame];
    
    self.scrollView.frame = self.view.frame;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.scrollContent];
    self.scrollView.contentSize = self.scrollContent.frame.size;
    // read data
    // initialize a fss
    NSInteger ce = 0;
    if(self.coldEx_seg.selectedSegmentIndex == 0){
        ce = 0;
    }else{
        ce = 2;
    }
    
    NSInteger p = 0;
    if(self.prematurity_seg.selectedSegmentIndex == 0){
        p = 0;
    }else{
        p = 1;
    }

    NSInteger inf = 0;
    if(self.infection_seg.selectedSegmentIndex == 0){
        inf = 0;
    }else{
        inf = 1;
    }
    
    NSInteger igG = 0;
    if(self.igG_seg.selectedSegmentIndex == 0){
        igG = 0;
    }else{
        igG = 1;
    }

    NSInteger glucose = 0;
    if(self.glucose_seg.selectedSegmentIndex == 0){
        glucose = 0;
    }else{
        glucose = 1;
    }

    NSInteger wbc = 0;
    if(self.wbc_seg.selectedSegmentIndex == 0){
        wbc = 0;
    }else{
        wbc = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segementChoosing:(UISegmentedControl*)sender {
        NSInteger selectedSegment = sender.selectedSegmentIndex;
    if(sender.tag == 0){
        if (selectedSegment == 0) {
            self.coldEx_lb.text = @"0";
        }
        else{
            self.coldEx_lb.text = @"2";
        }
    }else if (sender.tag ==1){
        if(selectedSegment == 0){
            self.prematurity_lb.text = @"0";
        }else{
            self.prematurity_lb.text = @"1";
        }
    }else if (sender.tag ==2){
        if(selectedSegment == 0){
            self.infection_lb.text = @"0";
        }else{
            self.infection_lb.text = @"1";
        }
    }else if (sender.tag ==3){
        if(selectedSegment == 0){
            self.igG_lb.text = @"0";
        }else{
            self.igG_lb.text = @"1";
        }
    }else if (sender.tag ==4){
        if(selectedSegment == 0){
            self.glucose_lb.text = @"0";
        }else{
            self.glucose_lb.text = @"1";
        }
    }else if (sender.tag ==5){
        if(selectedSegment == 0){
            self.wbc_lb.text = @"0";
        }else{
            self.wbc_lb.text = @"1";
        }
    }
}

- (IBAction)pressCalculator:(id)sender {
    
    FoalSurvivalScore* fss = [[FoalSurvivalScore alloc]initWithColdExtremities: [self.coldEx_lb.text integerValue] Prematurity:[self.prematurity_lb.text integerValue] Infection:[self.infection_lb.text integerValue] IgG:[self.igG_lb.text integerValue] Glucose:[self.glucose_lb.text integerValue] WBC:[self.wbc_lb.text integerValue]];
    NSInteger totalScore = [fss calculateTotalScore];
    // To Do
    // send HTTP request
    ShowScoreViewController* ss = [[ShowScoreViewController alloc]init];
    ss.survivalScore = totalScore;
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:ss];
    [self presentViewController:nv animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
