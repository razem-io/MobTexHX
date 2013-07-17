package ::APP_PACKAGE::;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.KeyEvent;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import org.haxe.nme.NME;
import android.view.View.OnKeyListener;
import android.graphics.Rect;

public class MainActivity extends org.haxe.nme.GameActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        final View activityRootView = getMainView();
        activityRootView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                Rect r = new Rect();
                //r will be populated with the coordinates of your view that area still visible.
                activityRootView.getWindowVisibleDisplayFrame(r);

                int screenHeight = activityRootView.getRootView().getHeight();
                int heightDiff = screenHeight - (r.bottom - r.top);
                boolean visible = heightDiff > screenHeight / 3;

                Log.i("Softkeyboard", "Keyboard visible " + visible);
                if(visible){
                    NME.onKeyChange(0x999999,true);
                }else{
                    NME.onKeyChange(0x666666,true);
                }
            }
        });
    }
}

