//
//  AirportListViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "AirportListViewController.h"

@interface AirportListViewController ()

@end

@implementation AirportListViewController

@synthesize airportList;
@synthesize delegate;
@synthesize originalSelectedRow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    airportList = [[NSArray alloc] initWithObjects:@"Atlanta",@"NY",@"CA",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [airportList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *currentCell = [airportList objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentCell];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *returnValue = [airportList objectAtIndex:indexPath.row];
    [self.delegate selectedAirport:self originalSelectedRow:originalSelectedRow selectedItem:returnValue];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
