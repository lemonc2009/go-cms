package util

import (
	//"github.com/beego/beego/v2"
	beego "github.com/beego/beego/v2/server/web"
	"github.com/go-redis/redis/v7"
	"sync"
)

var (
	once sync.Once
	redisClient *redis.Client
)

/**
 * 单例模式 实现redis连接
 */
func NewRedisClient() (*redis.Client,error) {
	once.Do(func() {
		index,_:=  beego.AppConfig.Int("redis::index")
		redisClient = redis.NewClient(&redis.Options{
			Addr:     	beego.AppConfig.DefaultString("redis::addr",""),
			Password: 	beego.AppConfig.DefaultString("redis::password",""),
			DB:       	index,
			PoolSize:	10,
		})
	})

	_,err := redisClient.Ping().Result()
	if err!=nil {
		return nil,err
	}else{
		return redisClient,nil
	}
}