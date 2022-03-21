package com.insight.reflection;

public class Employee {
    private int empId;
    private String empName;
    private String company;

    public Employee(int empId, String empName, String company) {
        this.empId = empId;
        this.empName = empName;
        this.company = company;
    }

    public Employee(int empId, String company) {
        this.empId = empId;
        this.company = company;
    }

    public void print() {
        System.out.println("Employee ID: " + getEmpId());
        System.out.println("Employee Name: " + getEmpName());
        System.out.println("Employee Company: " + getCompany());
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
