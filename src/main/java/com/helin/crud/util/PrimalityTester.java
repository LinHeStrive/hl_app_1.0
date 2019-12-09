package com.helin.crud.util;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 * ���Բ��Թ���
 */
public class PrimalityTester {
    /**
     * �ж�һ�����Ƿ�������ʹ������-�������Բ���
     * @param n ��������������3
     * @param rounds ��������
     * @return �жϽ��
     */
    public static boolean isProbablePrime(long n, int rounds) {
        // 2������
        if (n == 2)
            return true;

        // nΪż��
        if ((n & 1) == 0)
            return false;

        // ��n-1д��(2^s)*d����ʽ
        long s = 0, d = n - 1, quotient, remainder;
        for (;;) {
            quotient = d / 2;
            remainder = d % 2;
            if (remainder == 1)
                break;
            s++;
            d = quotient;
        }

        Random rnd = ThreadLocalRandom.current();
        // ����k������-��������
        for (int i = 0; i < rounds; i++) {
            // n�϶��Ǻ�������������Ȼn��������������������
            long a = Math.abs(rnd.nextLong()) % (n - 1) + 1;
            long b = MathUtil.modExpNonRec(a, d , n);

            if (b == 1 || b == n - 1) {
                continue;
            }
            int j = 0;
            for (; j < s; j++) {
                b = MathUtil.modExpNonRec(b, 2, n);
                if (b == 1) {
                    return false;
                }
                if (b == n - 1)
                    break;
            }
            if (j == s) // None of the steps mad x equals n-1.
                return false;
        }
        return true;
    }
}