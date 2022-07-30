package com.insight.regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Example {
    public static void main(String[] args) {
        String res = "OUTREACH-12345";
        String keyid;
        Matcher match = Pattern.compile("<title>\\s{0,2}\\[(IXOUTREACH|OUTREACH)-\\d{3,8}\\].+<\\/title>").matcher(res);
        if (match.find())
            keyid = match.group();
    }
}
