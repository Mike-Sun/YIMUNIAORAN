//
//  HomeViewController.m
//  YIMUNIAORAN
//
//  Created by Michael Sun on 11/26/15.
//  Copyright © 2015 Michael Sun. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomBanner.h"
#import "BannerDetailViewController.h"
#import "GridView.h"
#import "GridDetailViewController.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, CustomBannerDelegate, GridViewDelegate>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) CustomBanner *customBanner;
@property (nonatomic, strong) GridView *gridView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createInterface];
    // [self networkTest];
    
    
}




- (void)viewWillAppear:(BOOL)animated {
    
    
}


- (void)viewDidAppear:(BOOL)animated {
    [self.customBanner startTimer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.customBanner stopTimer];
    
}


- (void)viewDidDisappear:(BOOL)animated {
    
}

- (void)networkTest {
    
    NetworkManager *network = [[NetworkManager alloc] init];
    NSMutableDictionary *paraDict = [network baseParameterCreator];
    [paraDict setObject:@"18721585607" forKey:@"cell"];
    [paraDict setObject:@"123" forKey:@"password"];
    
    [network POSTConnectionWithUrl:Login_URL parameters:paraDict finishedBlock:^(NSDictionary *resultDict) {
        
        
    } failedBlock:^(NSError *error) {
        
        
    }];
    
    
}


- (void)createInterface {
    
    self.view.backgroundColor = VCBACKGROUND_GRAY;
    self.navigationController.navigationBar.hidden = YES;
    
    // 自定义导航栏
    CustomNavBar *customNavBar = [[CustomNavBar alloc] init];
    [customNavBar NavView:self navText:@"一木鸟然" popState:1];
    customNavBar.backButton.hidden = YES;
    [self.view addSubview:customNavBar];
    
    
    
    // 测试数据
    NSMutableArray *testArr = [NSMutableArray array];
    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"http://marry.qiniudn.com/210BBC2CDD9F37B192C9A47DA59A8ECD" forKey:@"imgUrl"];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"http://marry.qiniudn.com/B4A9BA4066B025F50650617FE54AB5AD" forKey:@"imgUrl"];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObject:@"http://marry.qiniudn.com/BB7BD67E77FDB257CD40B8C686D303DE" forKey:@"imgUrl"];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObject:@"http://marry.qiniudn.com/13036FD68B21CBFB61F33B9B7D75624E" forKey:@"imgUrl"];
    NSDictionary *dict5 = [NSDictionary dictionaryWithObject:@"http://marry.qiniudn.com/A31B21B3B3D0D1F5A034ED0193D6D90D" forKey:@"imgUrl"];
    
    [testArr addObject:dict1];
    [testArr addObject:dict2];
    [testArr addObject:dict3];
    [testArr addObject:dict4];
    [testArr addObject:dict5];
    
    // tableView
    self.homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                       64,
                                                                       SCREEN_WIDTH,
                                                                       SCREEN_HEIGHT - 64 - 49)
                                                      style:UITableViewStylePlain];
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    self.homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.homeTableView.backgroundColor = VCBACKGROUND_GRAY;
    [self.view addSubview:self.homeTableView];
    
    // 轮播区
    self.customBanner = [[CustomBanner alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       SCREEN_WIDTH,
                                                                       SCREEN_WIDTH / 16 * 9)];
    self.customBanner.delegate = self;
    self.customBanner.backgroundColor = [UIColor whiteColor];
    [self.customBanner setImagesWithArray:testArr];
    
    
    // 九宫格
    self.gridView = [[GridView alloc] initWithFrame:CGRectMake(0,
                                                               CGRectGetMaxY(self.customBanner.frame),
                                                               SCREEN_WIDTH,
                                                               SCREEN_WIDTH / 16 * 9)];
    self.gridView.delegate = self;
    
    
    // HeaderView底View
    UIView *headerBackView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                      0,
                                                                      SCREEN_WIDTH,
                                                                      CGRectGetHeight(self.customBanner.frame) + CGRectGetHeight(self.gridView.frame))];
    headerBackView.backgroundColor = VCBACKGROUND_GRAY;
    [headerBackView addSubview:self.customBanner];
    [headerBackView addSubview:self.gridView];
    
    self.homeTableView.tableHeaderView = headerBackView;
    
}

#pragma mark - 轮播区点击协议方法
- (void)selectedScrollDict:(NSDictionary *)selectedDict {
    BannerDetailViewController *bannerDetailVC = [[BannerDetailViewController alloc] init];
    [self.navigationController pushViewController:bannerDetailVC animated:YES];
}

#pragma mark - 九宫格点击协议方法
- (void)gridViewDidClickAtIndex:(NSInteger)index {
    GridDetailViewController *gridDetailVC = [[GridDetailViewController alloc] init];
    [self.navigationController pushViewController:gridDetailVC animated:YES];
}

#pragma mark - tableView协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"chong2";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
