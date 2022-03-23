package util

import (
	//"github.com/beego/beego/v2"
	beego "github.com/beego/beego/v2/server/web"
	"strconv"
)

func AuthSign(Id int, Email string, Password string) string  {
	s := strconv.Itoa(Id) + Email + beego.Substr(Password, 0, 13)
	return SHA256Encode(s)
}

func AuthSignCheck(Id int, Email string, Password string, sign string) bool  {
	s := AuthSign(Id, Email, Password)
	return s == sign
}