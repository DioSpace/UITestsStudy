//
//  GSInputUITest.m
//  GSUITestDemoUITests
//
//  Created by gersces on 2018/8/30.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface P1InputUITest : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation P1InputUITest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    _app = [[XCUIApplication alloc]init];
    [_app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //点击tabbarItem，跳转到Page1界面
    XCUIElement *tabbar = _app.tabBars.allElementsBoundByIndex[0];
    XCUIElementQuery *tabbarItems = [tabbar childrenMatchingType:XCUIElementTypeButton];
    XCUIElement *page1 = [tabbarItems elementBoundByIndex:1];
    [page1 tap];

    /*
      如果控件是 UILabel 、UITextFiled 或者 UIButton 等可以设置 text 的控件,那么其 identifier 就是 text。其实不管控件是否可以设置 text，都是可以通过 accessibilityIdentifier 设置其 identifier 。
     **/
    
    //获取 UITextField
    XCUIElement *nameText = [_app.textFields elementMatchingType:XCUIElementTypeTextField identifier:@"name"];
    [nameText tap];
    [nameText typeText:@"admin"];
    
    //UITextField 的密码形态
    XCUIElement *passWordText = _app.secureTextFields[@"passWord"];
    [passWordText tap];
    [passWordText typeText:@"123456"];
    
    //获取 UITextView
    XCUIElement *tipText = _app.textViews[@"tipText"];
    [tipText tap];
    [tipText typeText:@"提示：皮一下"];
//    sleep(5);
    
    //获取 UIView
    XCUIElement *pageView = [_app.otherElements elementMatchingType:XCUIElementTypeOther identifier:@"pageView1"];
    [pageView tap];
    
    //搜索
    XCUIElement *search = _app.searchFields[@"search content"];
    [search tap];
    [search typeText:@"word"];
    
    //键盘
    XCUIElement *keyBoard = [_app.keyboards elementBoundByIndex:0];
    //键盘search键
    XCUIElement *boardSearch = keyBoard.buttons[@"Search"];
    [boardSearch tap];
    
    //点击alert的确定action
    [_app.buttons[@"确定"] tap];
}

@end
