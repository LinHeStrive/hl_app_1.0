package com.helin.crud.util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Random;

/**
 * PBKDF2_SHA256������֤�㷨
 *
 * @author ��;L
 */

public class Pbkdf2Sha256 {

    private static final Logger logger = LoggerFactory.getLogger(Pbkdf2Sha256.class);

    /**
     * �εĳ���
     */
    public static final int SALT_BYTE_SIZE = 16;

    /**
     * �������ĵĳ���(����64 * 4�����ĳ���Ϊ64)
     */
    public static final int HASH_BIT_SIZE = 64 * 4;

    /**
     * ��������(Ĭ�ϵ�������Ϊ 2000)
     */
    private static final Integer DEFAULT_ITERATIONS = 2000;

    /**
     * �㷨����
     */
    private static final String algorithm = "PBKDF2&SHA256";

    /**
     * ��ȡ����
     * @param password   ��������
     * @param salt       ����
     * @param iterations ��������
     * @return
     */
    public static String getEncodedHash(String password, String salt, int iterations) {
        // Returns only the last part of whole encoded password
        SecretKeyFactory keyFactory = null;
        try {
            keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        } catch (NoSuchAlgorithmException e) {
            logger.error("Could NOT retrieve PBKDF2WithHmacSHA256 algorithm", e);
        }
        KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt.getBytes(Charset.forName("UTF-8")), iterations, HASH_BIT_SIZE);
        SecretKey secret = null;
        try {
            secret = keyFactory.generateSecret(keySpec);
        } catch (InvalidKeySpecException e) {
            logger.error("Could NOT generate secret key", e);
        }

        //ʹ��Base64����ת������
//        byte[] rawHash = secret.getEncoded();
//        byte[] hashBase64 = Base64.getEncoder().encode(rawHash);
//        return new String(hashBase64);

        //ʹ��ʮ����������
        return toHex(secret.getEncoded());
    }

    /**
     * ʮ�������ַ���ת�������ַ���
     * @param hex     ʮ�������ַ���
     * @return      
     */
    public static byte[] fromHex(String hex) {
        byte[] binary = new byte[hex.length() / 2];
        for (int i = 0; i < binary.length; i++) {
            binary[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return binary;
    }

    /**
     * �������ַ���תʮ�������ַ���
     * @param array     ����������
     * @return      
     */
    public static String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0)
            return String.format("%0" + paddingLength + "d", 0) + hex;
        else
            return hex;
    }

    /**
     * ���ļ���     (��ȡ��SALT_BYTE_SIZE�����ȵ���ֵ)
     * @return
     */
    public static String getsalt() {
        //��ֵʹ��ASCII������ּӴ�Сд��ĸ���
        int length = SALT_BYTE_SIZE;
        Random rand = new Random();
        char[] rs = new char[length];
        for (int i = 0; i < length; i++) {
            int t = rand.nextInt(3);
            if (t == 0) {
                rs[i] = (char) (rand.nextInt(10) + 48);
            } else if (t == 1) {
                rs[i] = (char) (rand.nextInt(26) + 65);
            } else {
                rs[i] = (char) (rand.nextInt(26) + 97);
            }
        }
        return new String(rs);
    }

    /**
     * ��ȡ����
     * Ĭ�ϵ���������2000
     * @param password      ��������
     * @return
     */
    public static String encode(String password) {
        return encode(password, getsalt());
    }

    /**
     * ��ȡ����
     * @param password      ��������
     * @param iterations    ��������
     * @return
     */
    public static String encode(String password, int iterations) {
        return encode(password, getsalt(), iterations);
    }

    /**
     * ��ȡ����
     * Ĭ�ϵ���������2000
     * @param password      ��������
     * @param salt          ��ֵ
     * @return
     */
    public static String encode(String password, String salt) {
        return encode(password, salt, DEFAULT_ITERATIONS);
    }

    /**
     * ���շ��ص���������
     *
     * ע���˷������������ַ�����ɣ��㷨����+��������+��ֵ+����
     * ����Ҫ��ֱ����getEncodedHash�������ص�����
     *
     * @param password   ��������
     * @param salt       ����
     * @param iterations ��������
     * @return
     */
    public static String encode(String password, String salt, int iterations) {
        // returns hashed password, along with algorithm, number of iterations and salt
        String hash = getEncodedHash(password, salt, iterations);
        //return String.format("%s$%d$%s$%s", algorithm, iterations, salt, hash);
        return hash;
    }

    /**
     * ��֤����
     * @param password       ����
     * @param hashedPassword ����
     * @return
     */
    public static boolean verification(String password, String hashedPassword) {
        //hashedPassword = �㷨����+��������+��ֵ+����;
        String[] parts = hashedPassword.split("\\$");
        if (parts.length != 4) {
            return false;
        }
        //�����õ�������������ֵ������ֵ
        Integer iterations = Integer.parseInt(parts[1]);
        String salt = parts[2];
        String hash = encode(password, salt, iterations);
        return hash.equals(hashedPassword);
    }
}

