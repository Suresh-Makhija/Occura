package com.di.controller;

import java.util.Scanner;

public class Test111111 {

			public static void main(String[] args) {

			/*	Scanner s = new Scanner(System.in);
				System.out.println("Insert num1 :\n1");
				int num1 = s.nextInt();
				System.out.println("Insert num2 :");
				int num2 = s.nextInt();
				int sum = num1 +num2;
				System.out.println("Sum :"+sum);*/
				
				String p1 = "* * * * * * ================================== ";
				String p2 = " * * * * *  ==================================";
				String p3 = "==============================================";
				
				
				int i =0;
				for(i=0 ; i <12 ;i++) {
					if(i % 2 == 0) {
					System.out.println(p1);
					}else if(i % 2 == 1)
					System.out.println(p2);
					}
					if(i>12 && i<17) {
						System.out.println(p3);
					}
					
					i++;
				}
				
				/*int j =0;
				for(j=0 ; j <8 ;j++) {
					System.out.println(p3);
				}
				*/
			}

}
