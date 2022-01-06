package com.tiansui.pojo;

public class Department {
    private int deptId;

    private String daptName;

    public Department() {
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptId=" + deptId +
                ", daptName='" + daptName + '\'' +
                '}';
    }

    public Department(Integer deptId, String daptName) {
        this.deptId = deptId;
        this.daptName = daptName;
    }

//    public Department(String daptName) {
//        this.daptName = daptName;
//    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getDaptName() {
        return daptName;
    }

    public void setDaptName(String daptName) {
        this.daptName = daptName;
    }
}
