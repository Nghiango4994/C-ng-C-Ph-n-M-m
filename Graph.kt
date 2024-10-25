//Kết nối Reposity với CSDL
package com.example.contactapp

import android.content.Context

object Graph{
    lateinit var db: ContactDataBase
        private set
    val repository by lazy {
        ContactRepository(
            db.dao
        )
    }
    fun provide(context: Context){
        db = ContactDataBase.getDatabase(context = context)
    }
}