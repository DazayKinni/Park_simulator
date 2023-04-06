package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Bundle;
import android.os.Debug;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import java.lang.Runtime;

public class AndroidRamInfoUtility
{
	public double AndroidGetRAM()
	{
		ActivityManager actManager = (ActivityManager) RunnerActivity.CurrentActivity.getApplicationContext().getSystemService(Context.ACTIVITY_SERVICE);
		ActivityManager.MemoryInfo memInfo = new ActivityManager.MemoryInfo();
		actManager.getMemoryInfo(memInfo);
		return (double)memInfo.totalMem;
	}
}