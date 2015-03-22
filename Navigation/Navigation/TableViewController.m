//
//  TableViewController.m
//  Navigation
//
//  Created by Victor Lisboa on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TableViewController.h"
#import "ClasseDicionario.h"
#import "DicionarioViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize table,imgView;
- (void)viewDidLoad {
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    [super viewDidLoad];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];

    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 15.f)];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 50.f)];
                                                                              
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    return [dic.letras count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"letra"];
    
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    
    long row = indexPath.row;
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%c",[[dic.palavras objectAtIndex:row]characterAtIndex:0]]];
    [cell.detailTextLabel setText:[dic.palavras objectAtIndex:row]];
    [cell.imageView setImage:[UIImage imageNamed: [dic.imagens objectAtIndex:row]]];
    
    return cell;
}
-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle{
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        UITabBarItem *tb = [self tabBarItem];
        [tb setTitle:@"Lista"];
        UIImage *i = [UIImage imageNamed:@"lista.png"];
        [tb setImage:i];
    }
    return self;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
