//Chứa context của ứng dụng, lớp này kế thư lớp Application, đóng vai trò khởi tạo CSDL thông qua ối tượng Graph
package com.example.contactapp

import android.app.Application

class ContactApplication :Application(){
    override fun onCreate(){
        super.onCreate()
        Graph.provide(this)
    }
}

