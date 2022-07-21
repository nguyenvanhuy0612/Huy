package com.practice.testng_demo2;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

public class DaiHoiVoLam {

    public static void main(String[] args) throws Exception {

        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream("src/test/java/com/practice/testng_demo2/run.properties");
        properties.load(inputStream);
        inputStream.close();

        Class<?> clazz = Class.forName(properties.getProperty("class"));
        Object object = clazz.getDeclaredConstructor().newInstance();

        Method method = object.getClass().getMethod(properties.getProperty("method"));

        // Listener
        boolean testStatus = true;
        try {
            method.invoke(object);
        } catch (Exception e) {
            e.printStackTrace();
            testStatus = false;
        }
        System.out.println("testStatus: " + testStatus);
    }

    public static void main3(String[] args) throws Exception {

        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream("src/test/java/com/practice/testng_demo2/run.properties");
        properties.load(inputStream);
        inputStream.close();

        Class<?> clazz = Class.forName(properties.getProperty("class"));
        Object object = clazz.getDeclaredConstructor().newInstance();

        Method method = object.getClass().getMethod(properties.getProperty("method"));
        method.invoke(object);

        for (Method m : object.getClass().getMethods()) {
            //System.out.println(m.getName());
            System.out.println(m);
        }
    }

    public static void main2(String[] args) throws Exception {

        TruongVoKy truongVoKy = new TruongVoKy();
        QuachTinh quachTinh = new QuachTinh();
        DuongQua duongQua = new DuongQua();

        Method method = truongVoKy.getClass().getMethod("cuuDuongThanCong");
        method.invoke(truongVoKy);

        method = quachTinh.getClass().getMethod("cuuAmChanKinh");
        method.invoke(quachTinh);

        method = duongQua.getClass().getMethod("danChiThanCong");
        method.invoke(duongQua);
    }

    public static void main1(String[] args) {

        TruongVoKy truongVoKy = new TruongVoKy();
        QuachTinh quachTinh = new QuachTinh();
        DuongQua duongQua = new DuongQua();

        truongVoKy.cuuDuongThanCong();
        quachTinh.cuuAmChanKinh();
        duongQua.danChiThanCong();
        truongVoKy.thaiCucKiem();
    }


}
