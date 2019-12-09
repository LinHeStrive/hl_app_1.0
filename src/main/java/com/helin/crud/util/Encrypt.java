package com.helin.crud.util;

import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
 
import org.bouncycastle.jce.provider.BouncyCastleProvider;
 
public class Encrypt {
 
	public static boolean initialized = false;
	
	private static String ivParameter = "ubateubatequanli";
	public static byte[] Aes256Encode(String algorithm,String str, byte[] key){
		initialize();
		byte[] result = null;
		try{
			Cipher cipher = Cipher.getInstance(algorithm, "BC");
			SecretKeySpec keySpec = new SecretKeySpec(key, "AES"); 
			if(algorithm.equals("AES/ECB/PKCS7Padding")) {
				cipher.init(Cipher.ENCRYPT_MODE, keySpec);
			}else {
				IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes("utf-8"));
				cipher.init(Cipher.ENCRYPT_MODE, keySpec, iv);
			}
			
			
			result = cipher.doFinal(str.getBytes("UTF-8"));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public static String Aes256Decode(String algorithm,byte[] bytes, byte[] key){
		initialize();
		String result = null;
		try{
			Cipher cipher = Cipher.getInstance(algorithm, "BC");
			SecretKeySpec keySpec = new SecretKeySpec(key, "AES"); 
			if(algorithm.equals("AES/ECB/PKCS7Padding")) {
				cipher.init(Cipher.DECRYPT_MODE, keySpec);
			}else {
				IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes("utf-8"));
				cipher.init(Cipher.DECRYPT_MODE, keySpec, iv);
			}
			byte[] decoded = cipher.doFinal(bytes);
			result = new String(decoded, "UTF-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static void initialize(){
		if (initialized) return;
		Security.addProvider(new BouncyCastleProvider());
		initialized = true;
	}
}