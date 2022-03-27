package;

#if android
import android.AndroidTools;
import android.Permissions;
#end
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
class SUtil
{

    //Thanks Forever Engine
    static public function gameCrashCheck(){
    	Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
    }
     
    static public function onCrash(e:UncaughtErrorEvent):Void {
        var callStack:Array<StackItem> = CallStack.exceptionStack(true);
        var dateNow:String = Date.now().toString();
        dateNow = StringTools.replace(dateNow, " ", "_");
        dateNow = StringTools.replace(dateNow, ":", "'");
        var errMsg:String = "";

        for (stackItem in callStack)
        {
            switch (stackItem)
            {
                case FilePos(s, file, line, column):
                    errMsg += file + " (line " + line + ")\n";
                default:
                    Sys.println(stackItem);
            }
        }

        errMsg += e.error;
        
        Sys.println(errMsg);
        Sys.println("Crash dump saved in " + Path.normalize(path));
        Sys.println("Making a simple alert ...");

        SUtil.applicationAlert("Uncaught Error:", errMsg);
        flash.system.System.exit(0);
    }
	
    public static function applicationAlert(title:String, description:String){
        Application.current.window.alert(description, title);
    }
}
