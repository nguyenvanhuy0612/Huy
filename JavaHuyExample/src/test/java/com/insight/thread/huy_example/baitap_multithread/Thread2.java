package com.insight.thread.huy_example.baitap_multithread;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Thread2 extends Thread {
    List<Character> list = new ArrayList<>();

    @Override
    public void run() {
        int min = (int) 'a';
        int max = (int) 'z';
        int limit = max - min;

        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            char c = (char) (min + random.nextInt(limit));
            list.add(c);
            System.out.println("Thread2 > " + c);

            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
