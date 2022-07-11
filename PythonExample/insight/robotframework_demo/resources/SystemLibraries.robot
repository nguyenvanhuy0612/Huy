*** Settings ***
Documentation    Import all robot library for test
Library     Selenium2Library    implicit_wait=30s    run_on_failure=Capture Page Screenshot      #screenshot_root_directory=Results
Library     String
Library     Calculator
Library     String
Library     Collections
Library     DateTime
Library     OperatingSystem


