//
//  ViewController.m
//  Piraa
//
//  Created by Helia Taghavi on 7/28/15.
//  Copyright (c) 2015 Gereh. All rights reserved.
//

#import "ViewController.h"
#import "barberShopTableViewCell.h"
#import "customSegue.h"
#import "unwindSegue.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* favTableView;
    UITableView* nearTableView;
    UITableView* sugTableView;
    UIButton* menuBtn;
    UIButton* filterBtn;
    UIView* hiddenView;
    BOOL isMenuOn;
    BOOL isFilterOn;

}
@end

@implementation ViewController
#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // navigation bar color and buttons
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0.585 blue:0.859 alpha:1];
    menuBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-55, 0,100/3, 64/3)];
    menuBtn.layer.cornerRadius=25;
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(sideMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnSample = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    self.navigationItem.rightBarButtonItem = btnSample;
    
    filterBtn=[[UIButton alloc]initWithFrame:CGRectMake(5, 0,69/3, 72/3)];
    filterBtn.layer.cornerRadius=25;
    [filterBtn setBackgroundImage:[UIImage imageNamed:@"filter.png"] forState:UIControlStateNormal];
    [filterBtn addTarget:self action:@selector(filterButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *filterBtnSample = [[UIBarButtonItem alloc] initWithCustomView:filterBtn];
    self.navigationItem.leftBarButtonItem = filterBtnSample;
    
    
    
    
    
    // create and adding subViews
    
    hiddenView=[[UIView alloc]initWithFrame:self.view.frame];
    hiddenView.backgroundColor=[UIColor clearColor];
    [self.view addSubview: hiddenView];
    hiddenView.hidden=YES;
   
    nearTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60 , self.view.frame.size.width, self.view.frame.size.height -self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60)] ;
    nearTableView.delegate=self;
    nearTableView.dataSource=self;
    nearTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:nearTableView];

    sugTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60 , self.view.frame.size.width, self.view.frame.size.height -self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60)] ;
    sugTableView.delegate=self;
    sugTableView.dataSource=self;
    sugTableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    [self.view addSubview:sugTableView];
    favTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60 , self.view.frame.size.width, self.view.frame.size.height -self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height +60)] ;
    favTableView.delegate=self;
    favTableView.dataSource=self;
    favTableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    [self.view addSubview:favTableView];

    [self.view bringSubviewToFront:hiddenView];
    
    // allocating and initializing arrays
    self.nearBS=[[NSMutableArray alloc]initWithObjects:@"نیما",@"شاهرخ",@"میثم",@"باربد",@"امید", nil];
    self.sugBS=[[NSMutableArray alloc]initWithObjects:@"فربد",@"منصور",@"رضا", nil];
    self.favBS=[[NSMutableArray alloc]initWithObjects:@"دانیال",@"علی",@"محمد",@"امید", nil];
    
    self.nearBSArea=[[NSMutableArray alloc]initWithObjects:@"۸",@"۳",@"۶",@"۳",@"۱", nil];
    self.sugBSArea=[[NSMutableArray alloc]initWithObjects:@"۵",@"۴",@"۴", nil];
    self.favBSArea=[[NSMutableArray alloc]initWithObjects:@"۲",@"۲",@"۲",@"۱", nil];

    self.nearBSInitials=[[NSMutableArray alloc]initWithObjects:@"N",@"SH",@"M",@"B",@"O", nil];
    self.sugBSInitials=[[NSMutableArray alloc]initWithObjects:@"F",@"M",@"R", nil];
    self.favBSInitials=[[NSMutableArray alloc]initWithObjects:@"D",@"A",@"M",@"O", nil];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - buttons action
- (IBAction)segmentControlTabChange:(UISegmentedControl*)sender {
    if (sender.selectedSegmentIndex==0){
        [self.view addSubview:favTableView];
        [sugTableView removeFromSuperview];
        [nearTableView removeFromSuperview];
    }
    else if(sender.selectedSegmentIndex==1){
        [favTableView removeFromSuperview];
        [sugTableView removeFromSuperview];
        [self.view addSubview:nearTableView];
        
    }
    else if(sender.selectedSegmentIndex==2){
        [favTableView removeFromSuperview];
        [nearTableView removeFromSuperview];
        [self.view addSubview:sugTableView];
    }
}
- (IBAction)sideMenuAction:(id)sender {
    
    if(!isMenuOn){
        isMenuOn=YES;
        
        [UIView animateWithDuration:0.3 animations:^{
//            self.collectionList.transform=CGAffineTransformMakeTranslation(-self.collectionList.frame.size.width/2, 0);
//            hiddenView.transform=CGAffineTransformMakeTranslation(-self.collectionList.frame.size.width/2, 0);
            hiddenView.hidden=NO;
        } completion:^(BOOL finished) {
            
        }];
//        userBtn.userInteractionEnabled=NO;
//        self.collectionList.userInteractionEnabled=NO;
        filterBtn.userInteractionEnabled=NO;
        
    }
    else{
        isMenuOn=NO;
        [UIView animateWithDuration:0.3 animations:^{
//            self.collectionList.transform=CGAffineTransformMakeTranslation(0, 0);
            hiddenView.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            hiddenView.hidden=YES;
            
        }];
//        userBtn.userInteractionEnabled=YES;
//        self.collectionList.userInteractionEnabled=YES;
        filterBtn.userInteractionEnabled=YES;
        
    }
    
}
- (IBAction)filterButtonClicked:(id)sender {
//    [((searchFilterView*)searchView).resturantName resignFirstResponder];
//    ((searchFilterView*)searchView).resturantName.text=@"";
//    if (!isFilterOn) {
//        isFilterOn=YES;
//        [UIView animateWithDuration:0.4 animations:^{
//            searchView.transform=CGAffineTransformMakeTranslation(0, 0);
//        }];
//        menuBtn.userInteractionEnabled=NO;
//    }
//    else
//    {
//        isFilterOn=NO;
//        [UIView animateWithDuration:0.4 animations:^{
//            searchView.transform=CGAffineTransformMakeTranslation(0, -searchView.frame.size.height);
//        }];
//        menuBtn.userInteractionEnabled=YES;
//    }
    
}
#pragma mark - tableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==favTableView) {
        return self.favBS.count;
    }
    else if (tableView== sugTableView){
        return self.sugBS.count;
    }
    else if (tableView==nearTableView){
        return self.nearBS.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier=@"favBarberCell";
    barberShopTableViewCell * cell = (barberShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray * topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"barberShopTableViewCell" owner:self options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = [[barberShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:cellIdentifier];
                cell = (barberShopTableViewCell *)currentObject;
                
                
                
                break;
            }
            
        }
        cell.BSImg.layer.cornerRadius=cell.BSImg.frame.size.width/2;
        if (indexPath.row%2==1) {
            cell.BSImg.backgroundColor=[UIColor colorWithRed:0.007 green:0.457 blue:0.664 alpha:1];
        }
        if (tableView==favTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.favBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.favBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.favBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];        }
        else if (tableView==nearTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.nearBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.nearBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.nearBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];

        }
        else if (tableView==sugTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.sugBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.sugBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.sugBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];


        }
        
    }
    else
    {
        cell.BSImg.layer.cornerRadius=cell.BSImg.frame.size.width/2;
        if (indexPath.row%2==1) {
            cell.BSImg.backgroundColor=[UIColor colorWithRed:0.007 green:0.457 blue:0.664 alpha:1];
        }
        if (tableView==favTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.favBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.favBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.favBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];        }
        else if (tableView==nearTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.nearBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.nearBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.nearBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
        }
        else if (tableView==sugTableView) {
            cell.BSname.text=[NSString stringWithFormat:@"آرایشگاه %@",[self.sugBS objectAtIndex:indexPath.row]];
            cell.BSCity.text=[NSString stringWithFormat:@"تهران | منطقه %@",[self.sugBSArea objectAtIndex:indexPath.row]];
            [cell.BSImg setTitle:[self.sugBSInitials objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
            
        }

        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"goToBarberShop" sender:self];
}
//- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
//    customSegue *segue = [[customSegue alloc] initWithIdentifier:@"unwind" source:fromViewController destination:toViewController];
//    return segue;
//}
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    unwindSegue *segue = [[unwindSegue alloc] initWithIdentifier:@"unwind" source:fromViewController destination:toViewController];
    NSLog(@"ddddddd");
    return segue;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"gooooooood");
}
@end
