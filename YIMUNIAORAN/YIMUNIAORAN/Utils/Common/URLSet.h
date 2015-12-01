//
//  URLSet.h
//  SAYOGI
//
//  Created by  莲藕科技 on 15/10/31.
//  Copyright © 2015年  莲藕科技. All rights reserved.
//

#ifndef URLSet_h
#define URLSet_h

#define  BaseURL @"http://121.43.114.30/api/"
//#define  BaseURL @"http://192.168.1.5:8080/archetype/api"

//登陆注册
#define  Login_URL                      BaseURL@"login"
#define  Logout_URL                     BaseURL@"logout"
#define  Register_URL                   BaseURL@"register"
#define  Forgetpass_URL                 BaseURL@"forget_password"
#define  GetRegisterCode_URL            BaseURL@"register/send_verify_code"

//个人资料
#define  ChangeHeaderImage_URL          BaseURL@"user/modify_photo_pic"
#define  ChangeUserInfomation_URL       BaseURL@"user/modify_info"
#define  GetUserInfoUrl                 BaseURL@"user/info_by_cell"

//收货地址
#define  Address_URL                    BaseURL@"address/list"
#define  AddAddress_URL                 BaseURL@"address/create"
#define  DeleteAddress_URL              BaseURL@"address/delete"
#define  SetAddressDefaut_URL           BaseURL@"address/default"
#define  UpdateAddress_URL              BaseURL@"address/update"

//商品分类
#define  CommondityParent               BaseURL@"product_category/parent"
#define  CommondityChild                BaseURL@"product_category/child"

//商品
#define  CommondityProduct              BaseURL@"product"
#define  CommondityProductDetail        BaseURL@"product/detail"

//购物车
#define  ShoppingCartList               BaseURL@"cart/list"
#define  ShoppingCartCreate             BaseURL@"cart/create"
#define  ShoppingCartBatchUpdate        BaseURL@"cart/batch_update"
#define  ShoppingCartBatchDelete        BaseURL@"cart/batch_delete"
#define  ShoppingCartDelete             BaseURL@"cart/delete"
#define  ShoppingCartSync               BaseURL@"cart/sync"

//课堂
#define  Propaganda                     BaseURL@"propaganda"

//案例分享
#define  CaseShareList                  BaseURL@"case/list"
#define  CaseShareInfo                  BaseURL@"case"

//收藏
#define  CollectionCreate               BaseURL@"collect/create"
#define  CollectionCance                BaseURL@"collect/delete"
#define  CollectionBatchCance           BaseURL@"collect/delete"
#define  CollectionList                 BaseURL@"collect/list"


#endif /* URLSet_h */
