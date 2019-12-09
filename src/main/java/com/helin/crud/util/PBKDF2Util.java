package com.helin.crud.util;
 
import org.springframework.stereotype.Component;
 
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
 
@Component
public class PBKDF2Util {
 
    public static final String PBKDF2_ALGORITHM = "PBKDF2WithHmacSHA1";
 
 
    public static final int SALT_BYTE_SIZE = 32 / 2;         //�εĳ���
    public static final int HASH_BIT_SIZE = 128 * 4;         //�������ĵĳ���
    public static final int PBKDF2_ITERATIONS = 1000;        //��������
 
 
 
    /**
     * @auther: Ragty
     * @describe: ����������������֤
     * @param: [attemptedPassword(����֤����), encryptedPassword(����), salt(��ֵ)]
     * @return: boolean
     * @date: 2018/11/2
     */
    public boolean authenticate(String attemptedPassword, String encryptedPassword, String salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        // ����ͬ����ֵ���û������������м���
        String encryptedAttemptedPassword = getEncryptedPassword(attemptedPassword, salt);
        // �Ѽ��ܺ�����ĺ�ԭ���Ľ��бȽϣ���ͬ����֤�ɹ�������ʧ��
        return encryptedAttemptedPassword.equals(encryptedPassword);
    }
 
 
 
    /**
     * @auther: Ragty
     * @describe: ��������
     * @param: [password(��������), salt(��ֵ)]
     * @return: java.lang.String
     * @date: 2018/11/2
     */
    public String getEncryptedPassword(String password, String salt) throws NoSuchAlgorithmException,
            InvalidKeySpecException {
 
        KeySpec spec = new PBEKeySpec(password.toCharArray(), fromHex(salt), PBKDF2_ITERATIONS, HASH_BIT_SIZE);
        SecretKeyFactory f = SecretKeyFactory.getInstance(PBKDF2_ALGORITHM);
        return toHex(f.generateSecret(spec).getEncoded());
    }
 
 
 
 
    /**
     * @auther: Ragty
     * @describe: ͨ�����ܵ�ǿ�����������(���ת��Ϊ16����)
     * @param: []
     * @return: java.lang.String
     * @date: 2018/11/2
     */
    public String generateSalt() throws NoSuchAlgorithmException {
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[SALT_BYTE_SIZE];
        random.nextBytes(salt);
 
        return toHex(salt);
    }
 
 
 
 
    /**
     * @auther: Ragty
     * @describe: ʮ�������ַ���ת�������ַ���
     * @param: [hex]
     * @return: byte[]
     * @date: 2018/11/2
     */
    private static byte[] fromHex(String hex) {
        byte[] binary = new byte[hex.length() / 2];
        for (int i = 0; i < binary.length; i++) {
            binary[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return binary;
    }
 
 
 
 
 
    /**
     * @auther: Ragty
     * @describe: �������ַ���תʮ�������ַ���
     * @param: [array]
     * @return: java.lang.String
     * @date: 2018/11/2
     */
    private static String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0)
            return String.format("%0" + paddingLength + "d", 0) + hex;
        else
            return hex;
    }
}