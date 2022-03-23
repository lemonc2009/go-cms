package e

import (
	//"github.com/beego/beego/v2"
	beego "github.com/beego/beego/v2/server/web"
	//"log"
	)

var MsgFlags = map[string]string{
	"landing successfully":           "登陆成功",
	"landing failed":                 "登陆失败",
}

func T(msg string)(str string) {
	if beego.AppConfig.DefaultString("i18n","ch") == "ch" {
		return MsgFlags[msg]
	}
	if beego.AppConfig.DefaultString("i18n","ch") == "us" {
		return msg
	}
	return
}
