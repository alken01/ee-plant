package com.example.ee_plant;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.ee_plant.fragments.MainFragmentsActivity;

public class MainActivity extends AppCompatActivity {

    private Button button;
    //test commit
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        button = findViewById(R.id.button);


        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent loginIntent = new Intent(MainActivity.this, MainFragmentsActivity.class);
                startActivity(loginIntent);
            }
        });

    }
}
