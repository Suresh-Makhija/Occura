package com.occura.controller;

public class Test  extends Thread {

	public static void main(String[] args) {

	int i =1;
	switch(i) {
	case 1:
	{
		System.out.println("Monday");
		break;
	}
	case 2:
	{
		System.out.println("Tuesday");
		break;
	}
	default:
	{
		System.err.println("wed");
	}
	}
	}
}
