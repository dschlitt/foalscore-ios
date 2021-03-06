//
//  SepsisScoreViewController.m
//  foal score
//
//  Created by Jun on 2/22/16.
//  Copyright © 2016 osu.edu. All rights reserved.
//

#import "SepsisScoreViewController.h"

@interface SepsisScoreViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray* Qs;
@property (nonatomic, strong) NSMutableArray* As;
@property (nonatomic, strong) NSMutableArray* scores;
@property (weak, nonatomic) IBOutlet UILabel *totalScore;
@property (weak, nonatomic) IBOutlet UISwitch *shareOrNot;
@property (nonatomic, assign)BOOL goOn;

@end


@implementation SepsisScoreViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.goOn = false;
    }
    return self;
}
- (IBAction)pressShareInfo:(id)sender {
    [UiModal showModalWithTitle:@"Note" message:@"The FoalScore App offers an option to share data with The Ohio State University that will be used for future studies. If shared, data from this App will ONLY be used for research purposes and it will not reveal personal information from its users. User information is not required to use this App." buttonTitle:@"OK" viewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self tableView];
    [self.tableView reloadData];
    
    // pr select
    NSIndexPath *p1 = [NSIndexPath indexPathForItem:5 inSection:0];
    NSIndexPath *p2 = [NSIndexPath indexPathForItem:3 inSection:1];
    NSIndexPath *p3 = [NSIndexPath indexPathForItem:3 inSection:2];
    NSIndexPath *p4 = [NSIndexPath indexPathForItem:3 inSection:3];
    NSIndexPath *p5 = [NSIndexPath indexPathForItem:3 inSection:4];
    NSIndexPath *p6 = [NSIndexPath indexPathForItem:4 inSection:5];
    NSIndexPath *p7 = [NSIndexPath indexPathForItem:4 inSection:6];
    NSIndexPath *p8 = [NSIndexPath indexPathForItem:2 inSection:7];
    NSIndexPath *p9 = [NSIndexPath indexPathForItem:3 inSection:8];
    NSIndexPath *p10 = [NSIndexPath indexPathForItem:2 inSection:9];
    NSIndexPath *p11 = [NSIndexPath indexPathForItem:3 inSection:10];
    NSIndexPath *p12 = [NSIndexPath indexPathForItem:2 inSection:11];
    NSIndexPath *p13 = [NSIndexPath indexPathForItem:2 inSection:12];
    NSIndexPath *p14 = [NSIndexPath indexPathForItem:4 inSection:13];
 
    
    [self.tableView selectRowAtIndexPath:p2 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p3 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p4 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p5 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p1 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p6 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p7 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p8 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p9 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p10 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p11 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p12 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p13 animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView selectRowAtIndexPath:p14 animated:YES scrollPosition:UITableViewScrollPositionNone];
    NSInteger score = [self calculateTotalScore];
    NSString *score_string = [@(score) stringValue];
    self.totalScore.text = score_string;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (NSMutableArray *)scores{
    if(_scores == nil){
        _scores = [[NSMutableArray alloc]init];
        for(int i = 0;i<14;i++){
            NSMutableArray* scoreArray = [[NSMutableArray alloc]init];
            [_scores addObject:scoreArray];
        }
        // q1
        [_scores[0] addObject:@"3"];
        [_scores[0] addObject:@"2"];
        [_scores[0] addObject:@"1"];
        [_scores[0] addObject:@"2"];
        [_scores[0] addObject:@"0"];
        [_scores[0] addObject:@"0"];
        // q2
        [_scores[1] addObject:@"3"];
        [_scores[1] addObject:@"2"];
        [_scores[1] addObject:@"0"];
        [_scores[1] addObject:@"0"];
        //q3
        [_scores[2] addObject:@"4"];
        [_scores[2] addObject:@"3"];
        [_scores[2] addObject:@"2"];
        [_scores[2] addObject:@"0"];
        //q4
        [_scores[3] addObject:@"2"];
        [_scores[3] addObject:@"1"];
        [_scores[3] addObject:@"0"];
        [_scores[3] addObject:@"0"];
        //q5
        [_scores[4] addObject:@"2"];
        [_scores[4] addObject:@"1"];
        [_scores[4] addObject:@"0"];
        [_scores[4] addObject:@"0"];
        //q6
        [_scores[5] addObject:@"4"];
        [_scores[5] addObject:@"3"];
        [_scores[5] addObject:@"2"];
        [_scores[5] addObject:@"0"];
        [_scores[5] addObject:@"0"];
        //q7
        [_scores[6] addObject:@"3"];
        [_scores[6] addObject:@"2"];
        [_scores[6] addObject:@"1"];
        [_scores[6] addObject:@"0"];
        [_scores[6] addObject:@"0"];
        //q8
        [_scores[7] addObject:@"1"];
        [_scores[7] addObject:@"0"];
        [_scores[7] addObject:@"0"];
        //q9
        [_scores[8] addObject:@"3"];
        [_scores[8] addObject:@"2"];
        [_scores[8] addObject:@"1"];
        [_scores[8] addObject:@"0"];
        //q10
        [_scores[9] addObject:@"2"];
        [_scores[9] addObject:@"1"];
        [_scores[9] addObject:@"0"];
        //q11
        [_scores[10] addObject:@"2"];
        [_scores[10] addObject:@"1"];
        [_scores[10] addObject:@"0"];
        [_scores[10] addObject:@"0"];
        //q12
        [_scores[11] addObject:@"3"];
        [_scores[11] addObject:@"0"];
        [_scores[11] addObject:@"0"];
        //q13
        [_scores[12] addObject:@"3"];
        [_scores[12] addObject:@"0"];
        [_scores[12] addObject:@"0"];
        //q14
        [_scores[13] addObject:@"3"];
        [_scores[13] addObject:@"2"];
        [_scores[13] addObject:@"1"];
        [_scores[13] addObject:@"0"];
        [_scores[13] addObject:@"0"];
    }
    return _scores;
}
- (NSMutableArray *)As{
    NSInteger number = 10;
    NSString *cubedSymbol = @"\u2079";
    NSString *tenSymbol = [NSString stringWithFormat:@"%ld%@",(long)number,cubedSymbol];
    if(_As == nil){
        NSMutableArray* choices1 = [[NSMutableArray alloc]init];
        NSMutableArray* choices2 = [[NSMutableArray alloc]init];
        NSMutableArray* choices3 = [[NSMutableArray alloc]init];
        NSMutableArray* choices4 = [[NSMutableArray alloc]init];
        NSMutableArray* choices5 = [[NSMutableArray alloc]init];
        NSMutableArray* choices6 = [[NSMutableArray alloc]init];
        NSMutableArray* choices7 = [[NSMutableArray alloc]init];
        NSMutableArray* choices8 = [[NSMutableArray alloc]init];
        NSMutableArray* choices9 = [[NSMutableArray alloc]init];
        NSMutableArray* choices10 = [[NSMutableArray alloc]init];
        NSMutableArray* choices11 = [[NSMutableArray alloc]init];
        NSMutableArray* choices12 = [[NSMutableArray alloc]init];
        NSMutableArray* choices13 = [[NSMutableArray alloc]init];
        NSMutableArray* choices14 = [[NSMutableArray alloc]init];

        NSString *c11 = [NSString stringWithFormat:@"%@%@/L",@"< 2.0 * ",tenSymbol];
        
        NSString *c12 = [NSString stringWithFormat:@"%@%@/L",@"2.0 - 4.0* ",tenSymbol];
        
        NSString *c13 = [NSString stringWithFormat:@"%@%@/L",@"8.0 - 12.0 * ",tenSymbol];
        
        NSString *c14 = [NSString stringWithFormat:@"%@%@/L",@"> 12.0 * ",tenSymbol];
        
        
        [choices1 addObject:c11];
        [choices1 addObject:c12];
        [choices1 addObject:c13];
        [choices1 addObject:c14];
        [choices1 addObject:@"Normal"];
        [choices1 addObject:@"Not Available"];
        
        NSString *c21 = [NSString stringWithFormat:@"%@%@/L",@"> 2.0 * ",tenSymbol];
        
        NSString *c22 = [NSString stringWithFormat:@"%@%@/L",@"0.05 - 0.20 * ",tenSymbol];
        
        NSString *c23 = [NSString stringWithFormat:@"%@%@/L",@"< 0.05 * ",tenSymbol];
        
        [choices2 addObject:c21];
        [choices2 addObject:c22];
        [choices2 addObject:c23];
        [choices2 addObject:@"Not Available"];
        
        [choices3 addObject:@"Marked"];
        [choices3 addObject:@"Moderate"];
        [choices3 addObject:@"Slight"];
        [choices3 addObject:@"None"];
        
        
        [choices4 addObject:@"> 600"];
        [choices4 addObject:@"410 - 600"];
        [choices4 addObject:@"< 400"];
        [choices4 addObject:@"Not Available"];

        [choices5 addObject:@"< 49"];
        [choices5 addObject:@"49 - 79"];
        [choices5 addObject:@"> 79"];
        [choices5 addObject:@"Not Available"];
        
        [choices6 addObject:@"< 200"];
        [choices6 addObject:@"200 - 400"];
        [choices6 addObject:@"400 - 800"];
        [choices6 addObject:@"> 800"];
        [choices6 addObject:@"Not Available"];
        
        [choices7 addObject:@"< 40 Torr"];
        [choices7 addObject:@"40 - 50 Torr"];
        [choices7 addObject:@"51 - 70 Torr"];
        [choices7 addObject:@"> 70 Torr"];
        [choices7 addObject:@"Not Available"];
        
        [choices8 addObject:@"Yes"];
        [choices8 addObject:@"No"];
        [choices8 addObject:@"Not Available"];
        
        [choices9 addObject:@"Marked"];
        [choices9 addObject:@"Moderate"];
        [choices9 addObject:@"Mild"];
        [choices9 addObject:@"None"];
        
        [choices10 addObject:@"> 102°F or > 38.8°C"];
        [choices10 addObject:@"< 100°F or < 37.7°C"];
        [choices10 addObject:@"Normal"];
        
        [choices11 addObject:@"Marked"];
        [choices11 addObject:@"Mild"];
        [choices11 addObject:@"Normal"];
        [choices11 addObject:@"Not Available"];
        
        [choices12 addObject:@"Yes"];
        [choices12 addObject:@"No"];
        [choices12 addObject:@"Not Available"];
        
        [choices13 addObject:@"Yes"];
        [choices13 addObject:@"No"];
        [choices13 addObject:@"Not Available"];
        
        [choices14 addObject:@"< 300 days"];
        [choices14 addObject:@"300 - 310 days"];
        [choices14 addObject:@"311 - 330 days"];
        [choices14 addObject:@"> 330 days"];
        [choices14 addObject:@"Not Available"];

        _As = [[NSMutableArray alloc]init];
        [_As addObject:choices1];
        [_As addObject:choices2];
        [_As addObject:choices3];
        [_As addObject:choices4];
        [_As addObject:choices5];
        [_As addObject:choices6];
        [_As addObject:choices7];
        [_As addObject:choices8];
        [_As addObject:choices9];
        [_As addObject:choices10];
        [_As addObject:choices11];
        [_As addObject:choices12];
        [_As addObject:choices13];
        [_As addObject:choices14];
    }
    return _As;
}

- (NSMutableArray*)Qs{
    if (_Qs == nil) {
        _Qs = [[NSMutableArray alloc]init];
        
        // create space in section headers for nonAttributed text that is added after creation.
        // TODO - find a a more succient / cleaner solution to headView changing the casing of input text.
        [_Qs addObject:@"1"];
        [_Qs addObject:@"2"];
        [_Qs addObject:@"Doehle bodies, toxic changes, granulation, or vacuolization in neutrophils"];
        [_Qs addObject:@"4"];
        [_Qs addObject:@"5"];
        [_Qs addObject:@"6"];
        [_Qs addObject:@"7"];
        [_Qs addObject:@"8"];
        [_Qs addObject:@"Petechiation or scleral injection, no secondary to eye disease or trauma"];
        [_Qs addObject:@"10"];
        [_Qs addObject:@"11"];
        [_Qs addObject:@"Anterior uveitis, diarrhea, respiratory distress, swollen joints, open wounds"];
        [_Qs addObject:@"Placentitis, vulvar discharge prior to delivery, dystocia, long transport of mare, mare sick, foal induced"];
        [_Qs addObject:@"14"];
        
    }
    return _Qs;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    switch (section) {
        case 0:
            header.textLabel.text = @"Neutrophil count";
            break;
        case 1:
            header.textLabel.text = @"Band neutrophil count";
            break;
        case 2:
            header.textLabel.text = @"Doehle bodies, toxic changes, granulation, or vacuolization in neutrophils";
            break;
        case 3:
            header.textLabel.text = @"Fibrinogen (mg/dL)";
            break;
        case 4:
            header.textLabel.text=@"Hypoglycemia (mg/dL)";
            break;
        case 5:
            header.textLabel.text=@"IgG (mg/dL)";
            break;
        case 6:
            header.textLabel.text=@"Aterial oxygen (Torr)";
            break;
        case 7:
            header.textLabel.text=@"Metabolic acidosis";
            break;
        case 8:
            header.textLabel.text=@"Petechiation or scleral injection, no secondary to eye disease or trauma";
            break;
        case 9 :
            header.textLabel.text=@"Fever";
            break;
        case 10:
            header.textLabel.text=@"Hypotonia, coma, depression, convulsions";
            break;
        case 11:
            header.textLabel.text=@"Anterior uveitis, diarrhea, respiratory distress, swollen joints, open wounds";
            break;
        case 12:
            header.textLabel.text=@"Placentitis, vulvar discharge prior to delivery, dystocia, long transport of mare, mare sick, foal induced";
            break;
        case 13:
            header.textLabel.text=@"Prematurity";
            break;
            
        default:
            break;
    }
    
    
    //header.textLabel.textColor = [UIColor orangeColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString* title = [[self.As objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    [cell.textLabel setText:title];
    UIView* bv = [[UIView alloc]init];
    bv.backgroundColor = [UIColor colorWithRed:(116/255.0) green:(43/255.0) blue:(36/255.0) alpha:1];
    cell.selectedBackgroundView = bv;
    if(indexPath.row == [self.scores[indexPath.section] count]-1){
        cell.textLabel.highlightedTextColor = [UIColor whiteColor];
    }
    return cell;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (int)[self.Qs count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (int)[[self.As objectAtIndex:section] count];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    for ( NSIndexPath* selectedIndexPath in tableView.indexPathsForSelectedRows ) {
        if ( selectedIndexPath.section == indexPath.section )
            [tableView deselectRowAtIndexPath:selectedIndexPath animated:NO] ;
    }
    return indexPath ;
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.Qs objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger score = [self calculateTotalScore];
    NSString *score_string = [@(score) stringValue];
    self.totalScore.text = score_string;
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlightedTextColor = [UIColor whiteColor];
}


- (IBAction)pressCalculateButton:(id)sender {
    NSArray* selects = [self.tableView indexPathsForSelectedRows];
    ShowSepsisScoreViewController* showSepsisScore = [[ShowSepsisScoreViewController alloc]init];
    NSInteger totalScore = [self calculateTotalScore];
    NSString* result = [self decideSepsis:totalScore];
    BOOL anyNotAvailable = false;
    if([DataManager loginOrNot]){
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[DataManager userInfo].userId forKey:@"userId"];
        for (NSIndexPath* select in selects) {
            NSInteger section = select.section;
            NSInteger row = select.row;
            if(row == [self.As[section] count]-1){
                anyNotAvailable = true;
            }
            if(section == 0){
                [dict setObject:self.scores[0][row] forKey:@"CBC_neutrophilCount"];
            }else if (section == 1){
                [dict setObject:self.scores[1][row] forKey:@"CBC_bandNeutrophilCount"];
            }else if (section == 2){
                [dict setObject:self.scores[2][row] forKey:@"CBC_otherNeutrophilCount"];
            }else if (section == 3){
                [dict setObject:self.scores[3][row] forKey:@"CBC_fibrinogen"];
            }else if (section == 4){
                [dict setObject:self.scores[4][row] forKey:@"otherLabData_hypoglycemia"];
            }else if (section == 5){
                [dict setObject:self.scores[5][row] forKey:@"otherLabData_igG"];
            }else if (section == 6){
                [dict setObject:self.scores[6][row] forKey:@"otherLabData_aterialOxygen"];
            }else if (section == 7){
                [dict setObject:self.scores[7][row] forKey:@"otherLabData_metabolicAcidosis"];
            }else if (section == 8){
                [dict setObject:self.scores[8][row] forKey:@"clinicExam_injection"];
            }else if (section == 9){
                [dict setObject:self.scores[9][row] forKey:@"clinicExam_fever"];
            }else if (section == 10){
                [dict setObject:self.scores[10][row] forKey:@"clinicExam_hypotoniaComa"];
            }else if (section == 11){
                [dict setObject:self.scores[11][row] forKey:@"clinicExam_anteriorUveitisDiarrhea"];
            }else if (section == 12){
                [dict setObject:self.scores[12][row] forKey:@"histData_placentitisVulvar"];
            }else{
                [dict setObject:self.scores[13][row] forKey:@"histData_prematurity"];
            }
        }
        if(self.shareOrNot.isOn == true){
            [dict setObject:@"1" forKey:@"allowShare"];
        }else{
            [dict setObject:@"0" forKey:@"allowShare"];
        }

        // HTTP req
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [[FoalScoreAFAPIClient sharedClient]calculateSepsisScore:dict withCompletitionBlock:^(NSDictionary *response, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (response) {
                if([response[@"status"] isEqual:@"success"]){
                    showSepsisScore.scoreID = response[@"calculationId"];
                    showSepsisScore.message = result;
                    showSepsisScore.sepsisScore = totalScore;
                }else{
                    showSepsisScore.networkError = true;
                    showSepsisScore.scoreID = nil;
                    showSepsisScore.message = result;
                    showSepsisScore.sepsisScore = totalScore;
                }
            }else{
                showSepsisScore.networkError = true;
                showSepsisScore.scoreID = nil;
                showSepsisScore.message = result;
                showSepsisScore.sepsisScore = totalScore;
            }
            showSepsisScore.anyNotAvailable = anyNotAvailable;
            UINavigationController* nv = [[UINavigationController alloc]initWithRootViewController:showSepsisScore];
            nv.navigationBar.tintColor = [UIColor colorWithRed:(90/255.0) green:(17/255.0) blue:(10/255.0) alpha:1];
            [self presentViewController:nv animated:YES completion:nil];
        }];
    }else{
        for (NSIndexPath* select in selects) {
            NSInteger section = select.section;
            NSInteger row = select.row;
            if(row == [self.As[section] count]-1){
                anyNotAvailable = true;
            }
        }
        showSepsisScore.networkError = false;
        showSepsisScore.scoreID = nil;
        showSepsisScore.message = result;
        showSepsisScore.sepsisScore = totalScore;
        showSepsisScore.anyNotAvailable = anyNotAvailable;
        UINavigationController* nv = [[UINavigationController alloc]initWithRootViewController:showSepsisScore];
        nv.navigationBar.tintColor = [UIColor colorWithRed:(90/255.0) green:(17/255.0) blue:(10/255.0) alpha:1];
        [self presentViewController:nv animated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        self.goOn = true;
    }
}
- (NSString*)decideSepsis:(NSInteger)totalScore{
    if(totalScore < 12){
        return @"The foal is predicted to not have Sepsis with 88% accuracy.";
    }else{
        return @"The foal is predicted to have Sepsis with 93% accuracy.";
    }
}
- (NSInteger)calculateTotalScore{
    NSInteger totalScore = 0;
    NSArray* selects = [self.tableView indexPathsForSelectedRows];
    for (NSIndexPath* select in selects) {
        NSString* subscore_string = self.scores[select.section][select.row];
        NSInteger subscore = [subscore_string integerValue];
        totalScore += subscore;
    }
    return totalScore;
}

@end
