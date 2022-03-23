package common

import "github.com/beego/beego/v2/server/web/context"

//包循环调用？再开一个包
var UserId int = 0
var UserName string = "default"
var Ctx *context.Context