//
//  ViewController.m
//  Trash
//
//  Created by E Apple Store on 10/5/19.
//  Copyright © 2019 E Apple Store. All rights reserved.
//

//sdsadsdasdasdas
#import "ViewController.h"
#import "PhotoTableViewCell.h"
#import <AFNetworking.h>
#import <AFHTTPRequestOperationManager.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>{
NSArray *namearray;
    IBOutlet UILabel *namellabe;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    namearray = [[NSArray alloc]initWithObjects:@"hadiqa saqib",@"qazi saqib", nil];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 50)];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.text = @"Your Text";
    [self.view addSubview:label];
    
    UIButton *mybutn = [[UIButton alloc]initWithFrame:CGRectMake(40, 50, 200, 40)];
    mybutn.backgroundColor = [UIColor blackColor];
    mybutn.titleLabel.backgroundColor = [UIColor blackColor];
    mybutn.titleLabel.textColor = [UIColor whiteColor];
    mybutn.titleLabel.text = @"my button";
    [self.view addSubview:mybutn];
    
    [mybutn addTarget:nil action:@selector(mybtnaction) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [namearray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Create a cell identifier
    static NSString *CellIdentifier = @"Cell";

    PhotoTableViewCell *Cell = [_mytable dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (Cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PhotoTableViewCell" owner:self options:nil];
        Cell = [nib objectAtIndex:0];
        Cell.accessoryType=UITableViewCellAccessoryNone;

    }
    Cell.namelable.text = [namearray objectAtIndex:indexPath.row];
    return Cell;
}
//for get request
- (void)mybtnaction {
    NSDictionary *dict = @{ @"saqib" : @1, @"sas" : @2};
    NSString *vale = dict[@"saqib"];
    NSLog(@"%@",vale);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://example.com/resources.json" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
