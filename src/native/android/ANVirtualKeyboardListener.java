package mobtex.android;

import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import org.haxe.nme.GameActivity;
import org.haxe.nme.HaxeObject;

/**
 * Created by julianliebl on 19.07.13.
 */
public class ANVirtualKeyboardListener {
      private static ANVirtualKeyboardListener savedInstance;

      private HaxeObject callback;

      private static ANVirtualKeyboardListener getInstance(){
          if(savedInstance == null) savedInstance = new ANVirtualKeyboardListener();
          return savedInstance;
      }

      public static int enableListener(HaxeObject callback){
          //currently only one listener can be registered. TODO: ARRAY
          getInstance().callback = callback;

          final View activityRootView = GameActivity.getInstance().getMainView();
          activityRootView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
              @Override
              public void onGlobalLayout() {
                  Rect r = new Rect();
                  //r will be populated with the coordinates of the view area still visible
                  activityRootView.getWindowVisibleDisplayFrame(r);

                  int screenHeight = activityRootView.getRootView().getHeight();
                  final int heightDiff = screenHeight - (r.bottom - r.top);

                  //if there is a callback registered we need to send a signal
                  if(getInstance().callback != null){
                      getInstance().callback.call1("onVirtualKeyboardChange", heightDiff);
                  }else{
                      Log.v("Softkeyboard", "Callback not found!");
                  }
              }
          });
          return 1;
      }

      public static int getVisibleDisplayHeight(){
          Rect r = new Rect();
          View activityRootView = GameActivity.getInstance().getMainView();
          activityRootView.getWindowVisibleDisplayFrame(r);

          int screenHeight = activityRootView.getRootView().getHeight();
          int heightDiff = screenHeight - (r.bottom - r.top);

          return heightDiff;
      }
}
