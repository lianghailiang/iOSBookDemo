//
//  FirstTableViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/17.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "FirstTableViewController.h"
#import "FirstTableViewCell.h"
#import <YYKit/YYKit.h>
#import "SlideTagView.h"
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>

@class SlideTagView;

@interface FirstTableViewController ()<TencentSessionDelegate>{
    TencentOAuth *_tencentOAuth;
}

@property (nonatomic, copy, readonly) NSMutableArray *array;
@property (nonatomic, copy) SlideTagView *slideView;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    NSString *kk = userId.userName;
//    NSLog(@"%@",userId.userName);
    
    
    //iOS 8开始的自适应高度，可以不需要实现定义高度的方法
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 170;
    self.title = @"Home";
    
    _array = [[NSMutableArray alloc] initWithObjects:@"GCD全称为Grand Central Dispatch，是libdispatch的市场名称，而libdispatch是Apple的一个库，其为并发代码在iOS和OS X的多核硬件上执行提供支持。确切地说GCD是一套低层级的C API，通过 GCD，开发者只需要向",@"发现了原因。因为我在对cell中的图片进行赋值的时候，是采用的异步加载图片，所以计算图片的高度会需要一会时间，以至于我往后拉一下所有的图片就会恢复",@"3.详见代码部分(ViewController+Tabl",@"",@"", nil];
    
    NSMutableArray *kkk = _array.mutableCopy;
    [kkk removeFirstObject];
    
    _slideView = [[SlideTagView alloc] init];
    [_slideView setFrame:CGRectMake(100, 100, 100, 110)];
    [self.view addSubview:_slideView];
    
    
    
//    UID = [[UserInfoData alloc] init];
//
//    NSLog(@"%@",UID.userName);
    
    
//    BOOL isLogin = [_tencentOAuth isSessionValid];
//    if (!isLogin) {
////        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"1105037387" andDelegate:self];
//    }
//    
//    NSArray *permissions = [NSArray arrayWithObjects:@"get_user_info", @"add_t", nil] ;
//    NSString* appid = @"1105037387";
//    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:appid andDelegate:self];
//    [_tencentOAuth authorize:permissions];
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [tableView clearSelectedRowsAnimated:YES];
    
//    [_array setObject:@"UITableViewCell的动态高度计算一直是一个交流讨论的话题，也已经有了很多实现的机制，但更多的是需要一些扩展类什么的，还有需要计算什么的，使用起来比较麻烦。因此这里推荐一种自动计算高度的方法，他是在我的MyXXXXLayout体系内实现的一套机制。" atIndexedSubscript:indexPath.row];
//    [tableView reloadRow:indexPath.row inSection:0 withRowAnimation:UITableViewRowAnimationAutomatic];
//    [tableView scrollToRow:indexPath.row inSection:indexPath.section atScrollPosition:0 animated:YES];
    
    if (indexPath.row == 0) {
//        [self sendTextMessage];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCellId" forIndexPath:indexPath];
    
    cell.title_lab.text = [_array objectAtIndex:indexPath.row];

    return cell;
}
-(void)tencentDidNotLogin:(BOOL)cancelled{
    
}
- (void)tencentDidLogin{
        NSLog( @"登录完成");
    
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length])
    {
        //  记录登录用户的OpenID、Token以及过期时间
//        _labelAccessToken.text = _tencentOAuth.accessToken;
        NSLog(@"%@",_tencentOAuth.accessToken);
    }
    else
    {
        NSLog(@"登录不成功 没有获取accesstoken");

    }
    NSLog(@"openId: %@",[_tencentOAuth openId]);


}
- (void) sendTextMessage
{
    
    
//    BOOL isUserInfo = [_tencentOAuth getUserInfo];
    
//    //分享qq好友
//    QQApiTextObject* txtObj = [QQApiTextObject objectWithText:@"laksdjlfkajsdljkfj"];
//    SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:txtObj];
//    
//    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
//    [self handleSendResult:sent];
    
    //分享QQ空间
    NSURL *previewURL = [NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"];
    NSURL* url = [NSURL URLWithString:@"qq.com"];
    
    QQApiNewsObject* imgObj = [QQApiNewsObject objectWithURL:url title:@"dd" description:@"apiObjEditCtrl.objDesc.text" previewImageURL:previewURL];
    [imgObj setTitle:@"ddddd"];
    [imgObj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    
    SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:imgObj];
    
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    
    [self handleSendResult:sent];
}

- (void)handleSendResult:(QQApiSendResultCode)sendResult
{
    switch (sendResult)
    {
        case EQQAPIAPPNOTREGISTED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"App未注册" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];

            
            break;
        }
        case EQQAPIMESSAGECONTENTINVALID:
        case EQQAPIMESSAGECONTENTNULL:
        case EQQAPIMESSAGETYPEINVALID:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送参数错误" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];

            
            break;
        }
        case EQQAPIQQNOTINSTALLED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"未安装手Q" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];

            
            break;
        }
        case EQQAPIQQNOTSUPPORTAPI:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"API接口不支持" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];

            
            break;
        }
        case EQQAPISENDFAILD:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];

            
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
