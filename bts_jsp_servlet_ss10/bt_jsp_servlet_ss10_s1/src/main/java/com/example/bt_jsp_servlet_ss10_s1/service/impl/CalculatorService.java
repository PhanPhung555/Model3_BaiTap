package com.example.bt_jsp_servlet_ss10_s1.service.impl;

import com.example.bt_jsp_servlet_ss10_s1.service.ICalculatorService;

public class CalculatorService implements ICalculatorService {

    @Override
    public double getCalcutor(double firstoperand, String culculator, double secondoperand) {
        switch (culculator) {
            case "cong":
                return summation(firstoperand, secondoperand);
            case "tru":
                return subtraction(firstoperand, secondoperand);
            case "nhan":
                return multiplication(firstoperand, secondoperand);
            case "chia":
                return division(firstoperand, secondoperand);
        }
        return 0;
    }


    private double summation(double firstoperand, double secondoperand) {
        return firstoperand + secondoperand;
    }


    private double subtraction(double firstoperand, double secondoperand) {
        return firstoperand - secondoperand;
    }


    private double multiplication(double firstoperand, double secondoperand) {
        return firstoperand * secondoperand;
    }

    @Override
    public double division(double firstoperand, double secondoperand) {
        try {
            double division = firstoperand / secondoperand;

            if (Double.isInfinite(division)) {
                return 0;
            }else {
                return division;
            }
        } catch (ArithmeticException e) {
            // Xử lý lỗi chia cho 0 hoặc ném lại exception tùy nhu cầu
            return 0;
        }
    }

}
