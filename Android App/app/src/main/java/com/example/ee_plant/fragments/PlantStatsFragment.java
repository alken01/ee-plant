package com.example.ee_plant.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import androidx.fragment.app.Fragment;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.ee_plant.R;

import org.json.JSONArray;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Objects;
import java.util.Random;
import java.util.TimeZone;

public class PlantStatsFragment extends Fragment {

    private RequestQueue request;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.plant_stats_fragment,container,false);

        request = Volley.newRequestQueue(requireContext());

        Random r= new Random();

        Button DB_Button = (Button) rootView.findViewById(R.id.dBTestButton);
        DB_Button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                float humidity=r.nextFloat()*(100);//random float
                Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
                long dateSeconds = calendar.getTimeInMillis() / 1000L;

                String URL= "https://studev.groept.be/api/a21iot02/testDBConnection/"+humidity+"/"+dateSeconds;

                StringRequest submitRequest = new StringRequest( URL,  new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        System.out.println(URL);
                        Toast.makeText(getContext(), "data inserted", Toast.LENGTH_SHORT).show();
                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getContext(), "Unable to communicate with the server", Toast.LENGTH_LONG).show();
                    }
                });
                request.add(submitRequest);

            }
        });

        return rootView;
    }
}
