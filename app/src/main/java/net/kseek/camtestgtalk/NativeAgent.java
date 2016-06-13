package net.kseek.camtestgtalk;

import java.io.*;

import android.util.Log;

//public class NativeAgent extends GenericTask{
public class NativeAgent {
    
	public NativeAgent() {
    
    }
    
    static private native int nativeCheckMedia(int wid, int hei, String fileName);
    static public boolean NativeCheckMedia(int wid, int hei, String filename) {
        Log.d("TEAONLY", "Call native function: checkmedia");
        if (nativeCheckMedia(wid, hei, filename) > 0)
            return true;
        else
            return false;
    }
    
    static private native int nativeStartStreamingMedia(FileDescriptor in, FileDescriptor out);
    static public void NativeStartStreamingMedia(FileDescriptor in, FileDescriptor out) {
        nativeStartStreamingMedia(in, out);
    }
    static private native void nativeStopStreamingMedia();
    static public void NativeStopStreamingMedia() {
        nativeStopStreamingMedia();
    }

    public static void LoadLibraries() {
        //Local library .so files before this activity created.
        System.loadLibrary("gtalk");
        System.loadLibrary("ipcamera");		
    }

}
