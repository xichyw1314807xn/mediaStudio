package com.onion.mediastudio;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.ycw.libspeex.SpeexDemoActivity;

/**
 * Created by congwen.yang.
 * User: congwen.yang
 * Date: 2019/9/25
 * Time: 15:20
 */
public class WelComeActivity extends Activity implements View.OnClickListener {

    private Button btn_start_preview;
    private Button btn_start_preview_audio;


    @Override
    protected void onCreate( Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);
        initView();
    }


    private void initView()
    {
        btn_start_preview = (Button)this.findViewById(R.id.btn_start_preview);
        btn_start_preview.setOnClickListener(this);

        btn_start_preview_audio = (Button)this.findViewById(R.id.btn_start_preview_audio);
        btn_start_preview_audio.setOnClickListener(this);
    }


    @Override
    public void onClick(View view) {
        switch (view.getId())
        {
            case R.id.btn_start_preview:
                startActivity(new Intent(this,MainActivity.class));
                break;
            case R.id.btn_start_preview_audio:
                startActivity(new Intent(this, SpeexDemoActivity.class));
                break;
        }
    }
}
