package com.example.ee_plant.fragments;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class FragmentPageAdapter extends FragmentPagerAdapter {
    private final String[] tabTitles = new String[]{"Plant Stats","Graphs","Preferences","Settings"};

    public FragmentPageAdapter(FragmentManager fm) {
        super(fm);

    }

    @NonNull
    @Override
    public Fragment getItem(int position) {
        if (position == 0) {
            return new PlantStatsFragment();
        } else if (position == 1) {
            return new PlantStatsGraphsFragment();
        } else if (position == 2) {
            return new PlantPreferencesFragment();
        } else {
            return new SettingsFragment();
        }
    }

    @Override
    public int getCount() {
        return 4;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        return tabTitles[position];
    }
}
