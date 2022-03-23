package util

import (
	//"github.com/beego/beego/v2"
	beego "github.com/beego/beego/v2/server/web"
	"github.com/qinxin0720/alisms-go/SmsClient"
	"log"
	"net/http"
)

//TemplateCode `{"code":"123456"}`
func SendAliyunSMS(PhoneNumbers ,SignName ,TemplateParam string){
	sc, err := SmsClient.NewSMSClient(beego.AppConfig.DefaultString("sms::accessKeyID",""), beego.AppConfig.DefaultString("sms::secretAccessKey",""))
	if err != nil {
		return
	}
	statusCode, _, _ := sc.SendSMS(SmsClient.Params{PhoneNumbers, SignName, beego.AppConfig.DefaultString("sms::accessKeyID",""), TemplateParam})
	if statusCode == http.StatusOK {
		log.Println("发送成功")
	} else {
		log.Println("发送失败")
	}
}