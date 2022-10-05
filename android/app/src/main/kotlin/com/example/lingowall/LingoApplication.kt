package com.example.lingowall

import android.app.Application
import com.oneframe.android.networking.NetworkingFactory
import com.oneframe.bugfinder.BugFinder
import com.oneframe.bugfinder.data.Environment

class LingoApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        NetworkingFactory.init(this)
        BugFinder.init(
            application = this,
            appName = "oneframemobile",
            env = Environment.PROD,
            debug = true
        )
    }

}