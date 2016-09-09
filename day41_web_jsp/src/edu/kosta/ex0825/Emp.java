package edu.kosta.ex0825;

public class Emp {
	private int empno;
	private String name;
	private int sal;
	
	public Emp() {
		this.empno = 9999;
		this.name = "PJK";
		this.sal = 3000;
		
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", name=" + name + ", sal=" + sal + "]";
	}
	
	
	
}
