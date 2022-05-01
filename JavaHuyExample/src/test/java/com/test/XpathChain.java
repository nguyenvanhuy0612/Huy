package com.test;

import org.openqa.selenium.By;
import org.openqa.selenium.support.pagefactory.ByChained;

public class XpathChain {
    public void test1() {
        By parentLoc = By.xpath("//html");
        By childLoc = By.id("username");
        By chain = new ByChained(parentLoc, childLoc);
    }
}
