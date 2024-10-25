//File abstract class cho cơ sở dữ liê chứa contact(chỉ chứa 1 bảng contact)
package com.example.contactapp

import android.content.Context
import android.provider.CalendarContract.Instances
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import java.time.Instant

@Database(entities = [Contact::class], version = 1)
abstract class ContactDataBase : RoomDatabase(){
    abstract val dao: ContactDao

    companion object{
        @Volatile
        private var Instances:ContactDataBase? = null

        fun getDatabase(context: Context): ContactDataBase{
            return Instances?: synchronized(this){
                Room.databaseBuilder(
                    context,
                    ContactDataBase::class.java,
                    "contact_db"
                )
                    .build().also { Instances = it }
            }
        }
    }
}