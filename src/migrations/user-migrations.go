package migrations

import (
	models "../models"
	"github.com/jinzhu/gorm"
)

func UserMigration() {

	db, _ := gorm.Open("mysql", "root:root@tcp(127.0.0.1:33061)/goland")

	db.AutoMigrate(&models.User{})
}
